// Der Story-Motor des Players: führt die Ink-Geschichte aus und hält fest, was angezeigt wird.
// Grundregel (docs/story-konventionen.md, Abschnitt 1): Ink rechnet, der Player zeigt.
import { Story } from 'inkjs';
import storyJson from '../generated/story.json?raw';
import versionInfo from '../generated/version.json';
import karten from '../../../docs/art/karten/karten.json';
import { ladeStand, speichereStand } from './speicher';
import {
  WERTE, type Wert, type Wahl, type Probe,
  leseWahl, leseProbe, leseTag, leseWerteWahl, teileTitel, ohneAnfuehrung
} from './text';

export const VERSION: string = versionInfo.version;

// ---------------------------------------------------------------- Typen

export type Block =
  | { id: number; typ: 'kapitel'; perle: number; titel: string }
  | { id: number; typ: 'bild'; pfad: string }
  | { id: number; typ: 'text'; text: string; initiale: boolean; handschrift: boolean }
  | { id: number; typ: 'probe'; probe: Probe; salz: number; tipp: boolean }
  | { id: number; typ: 'gewaehlt'; text: string }
  | { id: number; typ: 'ende' };

type OhneId<T> = T extends unknown ? Omit<T, 'id'> : never;

export interface Eintrag {
  titel: string;
  perle: number;
  ort: string;
  bild: string | null;     // Skizze bei einer Tagebuchseite
  seite: boolean;          // Tagebuchseite (true) oder Erinnerung (false)
  zeilen: { text: string; handschrift: boolean }[];
  fertig: boolean;
}

export interface Buch {
  da: boolean;                         // ab Tickworts Geschenk (# tutorial: tagebuch)
  eintraege: Eintrag[];
  aufgedeckt: string[];                // „ort:hafen“, „bereich:stadt-west“, „weg:…“ aus karten.json
  aktuell: string;                     // aktueller Ort („ort:hafen“)
  taschen: Record<string, number>;     // tasche_status(id)
  menschen: string[];                  // bekannte Menschen
  neu: number;                         // ungesehene Neuigkeiten (rotes Siegel)
}

interface Speicherpunkt {
  ink: string;
  zeile: string;
  tags: string[];
  buch: Buch;
  bloeckeId: number;
}

export interface Stand {
  version: string;
  ink: string;
  name: string;
  perle: number;
  kapitel: string;
  bild: string;
  bloecke: Block[];
  naechsteId: number;
  buch: Buch;
  tippsUebrig: number;
  ende: boolean;
  speicherpunkt: Speicherpunkt | null;
  gespeichert: number;
}

export interface Auswahl {
  index: number;
  titel: string;
  text: string;
  plus: string;          // „+2“ bei Werte-Wahl
  istWert: boolean;
}

interface ErstellungsSchritt {
  ink: string;
  frage: string;
  zusatz: string;
  plus: string;
  werte: Record<Wert, number>;
}

// Volksbonus: Ink gibt dafür (noch) keinen Text aus, siehe story-konventionen.md 2a.
// Sobald charakter.ink eine Zeile ausgibt, zeigt der Player stattdessen diese.
const BONUS_TEXT: Record<string, string> = {
  zwerg: 'Zwerge sind stark wie der Fels: +1 Kraft.',
  gnom: 'Gnome haben immer eine Idee: +1 Verstand.',
  ork: 'Orks wissen, wie man redet: +1 Ausstrahlung.',
  troll: 'Trolle sind flinker, als alle denken: +1 Geschick.'
};

const MAX_BLOECKE = 200;
const GESPEICHERTE_BLOECKE = 80;

type KartenTag = { zeigt?: string[]; aktuell?: string };
type KartenEintrag = { name?: string };
const K = karten as unknown as {
  tags: Record<string, KartenTag>;
  orte: Record<string, KartenEintrag>;
  bereiche: Record<string, KartenEintrag>;
};

function leeresBuch(): Buch {
  return { da: false, eintraege: [], aufgedeckt: [], aktuell: '', taschen: {}, menschen: [], neu: 0 };
}

const kopie = <T>(x: T): T => JSON.parse(JSON.stringify(x));

// ---------------------------------------------------------------- Spiel

export class Spiel {
  // Was die Oberfläche zeigt
  seite = $state<'start' | 'erstellung' | 'geschichte'>('start');
  vorhanden = $state<Stand | null>(null);       // gespeicherter Stand (Startbildschirm)
  hinweis = $state('');                        // z. B. „Die Geschichte wurde geändert …“
  titel = $state('Der Weg hinaus');

  // Charaktererstellung
  name = $state('');
  frage = $state('');
  zusatz = $state('');
  auswahl = $state<Auswahl[]>([]);
  bereit = $state(false);                      // Werte fertig, Abenteuer kann beginnen
  bonusText = $state('');
  neuerWert = $state<Wert | null>(null);
  werteVorher = $state<Record<Wert, number> | null>(null);
  kannZurueck = $state(false);

  // Geschichte
  bloecke = $state<Block[]>([]);
  wahlen = $state<Wahl[]>([]);
  perle = $state(0);
  kapitel = $state('');
  bild = $state('');
  buch = $state<Buch>(leeresBuch());
  ende = $state(false);
  zettel = $state<{ nr: number; zeilen: string[] }>({ nr: 0, zeilen: [] });
  ankerId = $state(0);                          // gewählte Zeile, die nach oben rückt
  version = $state(0);                          // zählt hoch, wenn sich Werte ändern

  private story: Story;
  private naechsteId = 1;
  private tippsUebrig = 0;
  private speicherpunkt: Speicherpunkt | null = null;
  private offenerEintrag: Eintrag | null = null;
  private handschriftAb = false;
  private letztesTagebuchBild: string | null = null;
  private zeilenSeitBild = 99;
  private naechsteInitiale = false;
  private schritte: ErstellungsSchritt[] = [];
  private wartendeZeile: { text: string; tags: string[] } | null = null;
  private neuigkeiten: string[] = [];

  constructor() {
    this.story = new Story(storyJson);
    const tags = this.story.globalTags ?? [];
    for (const t of tags) {
      const [n, w] = leseTag(t);
      if (n === 'titel' && w) this.titel = w;
    }
  }

  // ------------------------------------------------------------ Werte

  wert(name: string): unknown {
    // `version` lesen, damit Svelte neu zeichnet, wenn Ink Werte ändert
    void this.version;
    return this.story.variablesState.$(name);
  }

  werte(): Record<Wert, number> {
    void this.version;
    const w = {} as Record<Wert, number>;
    for (const id of WERTE) w[id] = Number(this.story.variablesState.$(id)) || 0;
    return w;
  }

  // ------------------------------------------------------------ Start

  async ladeVorhanden() {
    this.vorhanden = await ladeStand<Stand>();
  }

  neuesAbenteuer() {
    this.story = new Story(storyJson);
    this.story.state.storySeed = Math.floor(Math.random() * 100000);
    this.name = '';
    this.schritte = [];
    this.bereit = false;
    this.wartendeZeile = null;
    this.frage = 'Wie heißt du?';
    this.zusatz = '';
    this.auswahl = [];
    this.neuerWert = null;
    this.kannZurueck = false;
    this.buch = leeresBuch();
    this.seite = 'erstellung';
  }

  // ------------------------------------------------------------ Charaktererstellung

  /** Name ist eingegeben: Ink-Variable setzen und die erste Frage holen. */
  setzeName(name: string) {
    this.name = name.trim().slice(0, 16);
    this.story.variablesState.$('name', this.name);
    this.weiterErstellung();
  }

  private weiterErstellung() {
    const zeilen: string[] = [];
    while (this.story.canContinue) {
      const text = (this.story.Continue() ?? '').trim();
      const tags = this.story.currentTags ?? [];
      if (tags.some((t) => leseTag(t)[0] === 'werte_fertig')) {
        // Diese Zeile gehört schon zur Geschichte; sie wird gezeigt, wenn das Abenteuer beginnt.
        this.wartendeZeile = { text, tags: [...tags] };
        break;
      }
      if (text) zeilen.push(text);
    }
    this.version++;
    const vorher = this.schritte.at(-1)?.werte ?? null;
    if (this.wartendeZeile) {
      this.bereit = true;
      const volk = String(this.wert('volk'));
      this.bonusText = zeilen.join(' ') || BONUS_TEXT[volk] || '';
      this.frage = this.bonusText ? 'Was dein Volk dir mitgibt' : 'Bereit?';
      this.zusatz = '';
      this.auswahl = [];
    } else {
      this.bereit = false;
      this.bonusText = '';
      let frage = zeilen.pop() ?? '';
      let plus = '';
      const p = frage.match(/\s*\((\+\d+)\)$/);
      if (p) { plus = p[1]; frage = frage.slice(0, p.index).trim(); }
      // „Als Mensch passt du dich an. Worin wirst du noch besser?“ → Überschrift + Frage
      const satz = frage.match(/^(.+?[.!])\s+(.+\?)$/);
      if (satz && !zeilen.length) { zeilen.push(satz[1]); frage = satz[2]; }
      this.frage = frage;
      this.zusatz = zeilen.join(' ');
      this.auswahl = this.story.currentChoices.map((c) => {
        const w = leseWerteWahl(c.text);
        if (w) return { index: c.index, titel: teileTitel(c.text)[0].replace(/\s*\(\d+\)$/, ''), text: `jetzt ${w.jetzt}`, plus, istWert: true };
        const [titel, text] = teileTitel(c.text);
        return { index: c.index, titel, text, plus: '', istWert: false };
      });
    }
    // Welcher Wert ist eben gestiegen? (golden leuchtender Edelstein)
    const jetzt = this.werte();
    this.werteVorher = vorher;
    this.neuerWert = vorher ? (WERTE.find((id) => jetzt[id] > vorher[id]) ?? null) : null;
    this.kannZurueck = this.schritte.length > 0 || this.name !== '';
  }

  waehleErstellung(index: number) {
    this.schritte.push({ ink: this.story.state.toJson(), frage: this.frage, zusatz: this.zusatz, plus: this.auswahl[0]?.plus ?? '', werte: this.werte() });
    this.story.ChooseChoiceIndex(index);
    this.weiterErstellung();
  }

  zurueck() {
    const s = this.schritte.pop();
    if (!s) {
      // Zurück zur Namensfrage
      this.story = new Story(storyJson);
      this.story.state.storySeed = Math.floor(Math.random() * 100000);
      this.frage = 'Wie heißt du?';
      this.zusatz = '';
      this.auswahl = [];
      this.kannZurueck = false;
      this.neuerWert = null;
      this.bereit = false;
      this.version++;
      return;
    }
    this.story.state.LoadJson(s.ink);
    this.wartendeZeile = null;
    this.bereit = false;
    this.bonusText = '';
    this.version++;
    this.frage = s.frage;
    this.zusatz = s.zusatz;
    this.auswahl = this.story.currentChoices.map((c) => {
      const w = leseWerteWahl(c.text);
      if (w) return { index: c.index, titel: c.text.replace(/\s*\(\d+\)$/, ''), text: `jetzt ${w.jetzt}`, plus: s.plus, istWert: true };
      const [titel, text] = teileTitel(c.text);
      return { index: c.index, titel, text, plus: '', istWert: false };
    });
    const vorher = this.schritte.at(-1)?.werte ?? null;
    const jetzt = this.werte();
    this.neuerWert = vorher ? (WERTE.find((id) => jetzt[id] > vorher[id]) ?? null) : null;
    this.kannZurueck = true;
  }

  /** „Das Abenteuer beginnt“ – ab hier gibt es kein Zurück mehr. */
  async beginne() {
    this.seite = 'geschichte';
    this.bloecke = [];
    this.naechsteId = 1;
    this.buch = leeresBuch();
    this.tippsUebrig = 0;
    this.ende = false;
    this.speicherpunkt = null;
    this.merkeTaschenUndMenschen(true);
    const z = this.wartendeZeile;
    this.wartendeZeile = null;
    if (z) this.verarbeite(z.text, z.tags);
    await this.weiterGeschichte();
  }

  // ------------------------------------------------------------ Geschichte

  private block(b: OhneId<Block>): Block {
    const neu = { ...b, id: this.naechsteId++ } as Block;
    this.bloecke.push(neu);
    if (this.bloecke.length > MAX_BLOECKE) this.bloecke.splice(0, this.bloecke.length - MAX_BLOECKE);
    return neu;
  }

  private async weiterGeschichte() {
    while (this.story.canContinue) {
      const text = this.story.Continue() ?? '';
      this.verarbeite(text, [...(this.story.currentTags ?? [])]);
    }
    this.version++;
    const w = this.werte();
    this.wahlen = this.story.currentChoices.map((c) => leseWahl(c.index, c.text, w));
    this.merkeTaschenUndMenschen(false);
    if (!this.wahlen.length && !this.ende) {
      // Geschichte zu Ende, ohne # ende (sollte nicht vorkommen)
      this.ende = true;
      this.block({ typ: 'ende' });
    }
    this.zeigeNeuigkeiten();
    await this.speichere();
  }

  async waehle(index: number) {
    const w = this.wahlen.find((x) => x.index === index);
    if (!w) return;
    const b = this.block({ typ: 'gewaehlt', text: w.text });
    this.ankerId = b.id;
    this.wahlen = [];
    this.story.ChooseChoiceIndex(index);
    await this.weiterGeschichte();
  }

  /** Eine Zeile aus Ink mit ihren Tags darstellen. */
  private verarbeite(roh: string, tags: string[], ausSpeicherpunkt = false) {
    const text = roh.trim();
    const t = tags.map(leseTag);
    const hat = (n: string) => t.some(([name]) => name === n);
    const wert = (n: string) => t.find(([name]) => name === n)?.[1] ?? '';

    if (hat('perle') && !ausSpeicherpunkt) {
      // Speicherpunkt: Zustand nach dieser Zeile + die Zeile selbst (wird beim Neubeginn wiederholt)
      this.speicherpunkt = { ink: this.story.state.toJson(), zeile: roh, tags: [...tags], buch: kopie($state.snapshot(this.buch)), bloeckeId: this.naechsteId };
    }
    this.zeilenSeitBild++;

    for (const [name, w] of t) {
      switch (name) {
        case 'perle': this.perle = parseInt(w, 10) || this.perle; break;
        case 'kapitel':
          this.kapitel = w;
          this.block({ typ: 'kapitel', perle: this.perle, titel: w });
          this.naechsteInitiale = true;
          break;
        case 'bild':
          if (!w) break;
          this.bild = w;
          this.block({ typ: 'bild', pfad: w });
          if (w.startsWith('tagebuch/')) { this.letztesTagebuchBild = w; this.zeilenSeitBild = 0; }
          break;
        case 'karte': this.karte(w); break;
        case 'tutorial':
          if (w === 'probe') this.tippsUebrig = 3;
          if (w === 'tagebuch') this.buch.da = true;
          break;
        case 'tagebuch': {
          const seite = this.zeilenSeitBild <= 1 && !!this.letztesTagebuchBild;
          this.offenerEintrag = { titel: w, perle: this.perle, ort: this.buch.aktuell, bild: seite ? this.letztesTagebuchBild : null, seite, zeilen: [], fertig: false };
          this.buch.eintraege.push(this.offenerEintrag);
          this.offenerEintrag = this.buch.eintraege[this.buch.eintraege.length - 1];  // die reaktive Fassung weiter bearbeiten
          this.handschriftAb = false;
          this.neuigkeiten.push(seite ? `Neue Tagebuchseite: ${w}` : `Neue Erinnerung: ${w}`);
          break;
        }
        case 'ende': this.ende = true; break;
      }
    }

    if (text) {
      if (hat('probe')) {
        const p = leseProbe(text);
        if (p) {
          this.block({ typ: 'probe', probe: p, salz: this.naechsteId, tipp: this.tippsUebrig > 0 });
          if (this.tippsUebrig > 0) this.tippsUebrig--;
        } else {
          this.block({ typ: 'text', text, initiale: false, handschrift: false });
        }
      } else {
        const istHandschrift = !!this.offenerEintrag && this.handschriftAb;
        this.block({
          typ: 'text',
          text: istHandschrift ? ohneAnfuehrung(text) : text,
          initiale: this.naechsteInitiale && !istHandschrift,
          handschrift: istHandschrift
        });
        this.naechsteInitiale = false;
      }
      if (this.offenerEintrag) this.offenerEintrag.zeilen.push({ text, handschrift: this.handschriftAb });
    }
    if (hat('handschrift') && this.offenerEintrag) this.handschriftAb = true;
    if (hat('tagebuch_ende') && this.offenerEintrag) {
      this.offenerEintrag.fertig = true;
      this.offenerEintrag = null;
      this.handschriftAb = false;
    }
    if (hat('ende')) this.block({ typ: 'ende' });
  }

  private karte(schluessel: string) {
    const tag = K.tags[schluessel];
    if (!tag) return;
    for (const z of tag.zeigt ?? []) {
      if (this.buch.aufgedeckt.includes(z)) continue;
      this.buch.aufgedeckt.push(z);
      const [art, id] = z.split(':');
      const name = art === 'ort' ? K.orte[id]?.name : art === 'bereich' ? K.bereiche[id]?.name : undefined;
      if (name) this.neuigkeiten.push(`Neuer Ort auf der Karte: ${name}`);
    }
    if (tag.aktuell) this.buch.aktuell = tag.aktuell;
  }

  /** Taschen und Menschen über die reinen Ink-Funktionen abfragen (Abschnitt 7a). */
  private merkeTaschenUndMenschen(nurMerken: boolean) {
    const s = this.story;
    try {
      const taschen = String(s.EvaluateFunction('taschen_liste', [])).split(',').map((x) => x.trim()).filter(Boolean);
      for (const id of taschen) {
        const status = Number(s.EvaluateFunction('tasche_status', [id]));
        const alt = this.buch.taschen[id] ?? 0;
        if (status === 1 && alt !== 1 && !nurMerken) {
          const name = (s.EvaluateFunction('tasche_name', [id], true) as { output: string }).output.trim();
          this.neuigkeiten.push(`Neu in deinen Taschen: ${name}`);
        }
        this.buch.taschen[id] = status;
      }
      const menschen = String(s.EvaluateFunction('menschen_liste', [])).split(',').map((x) => x.trim()).filter(Boolean);
      for (const id of menschen) {
        const bekannt = !!s.EvaluateFunction('mensch_bekannt', [id]);
        if (bekannt && !this.buch.menschen.includes(id)) {
          this.buch.menschen.push(id);
          if (!nurMerken) {
            const name = (s.EvaluateFunction('mensch_name', [id], true) as { output: string }).output.trim();
            this.neuigkeiten.push(`Neu bei den Menschen: ${name}`);
          }
        }
      }
    } catch (e) {
      console.warn('Taschen/Menschen konnten nicht gelesen werden', e);
    }
  }

  private zeigeNeuigkeiten() {
    if (!this.neuigkeiten.length) return;
    // Vor Tickworts Geschenk gibt es noch kein Buch: dann nichts anzeigen und nichts zählen.
    if (this.buch.da) {
      this.buch.neu += this.neuigkeiten.length;
      this.zettel = { nr: this.zettel.nr + 1, zeilen: [...this.neuigkeiten] };
    }
    this.neuigkeiten = [];
  }

  /** Das Buch wird geöffnet: Siegel verschwindet. */
  buchGesehen() {
    this.buch.neu = 0;
    void this.speichere();
  }

  // ------------------------------------------------------------ Speichern und Laden

  private async speichere() {
    const stand: Stand = {
      version: VERSION,
      ink: this.story.state.toJson(),
      name: String(this.wert('name')),
      perle: this.perle,
      kapitel: this.kapitel,
      bild: this.bild,
      bloecke: $state.snapshot(this.bloecke).slice(-GESPEICHERTE_BLOECKE) as Block[],
      naechsteId: this.naechsteId,
      buch: $state.snapshot(this.buch) as Buch,
      tippsUebrig: this.tippsUebrig,
      ende: this.ende,
      speicherpunkt: this.speicherpunkt,
      gespeichert: Date.now()
    };
    if (await speichereStand(stand)) this.vorhanden = stand;
  }

  /** Weiterlesen. Passt der Stand nicht zur Story-Version, beginnt die Perle neu. */
  async weiterlesen() {
    const s = this.vorhanden;
    if (!s) return;
    if (s.version !== VERSION) {
      this.hinweis = 'Die Geschichte wurde inzwischen verbessert. Deshalb beginnt diese Perle noch einmal von vorn.';
      await this.perleNeu();
      return;
    }
    try {
      this.story = new Story(storyJson);
      this.story.state.LoadJson(s.ink);
    } catch {
      this.hinweis = 'Der Spielstand ließ sich nicht laden. Diese Perle beginnt noch einmal von vorn.';
      await this.perleNeu();
      return;
    }
    this.uebernehme(s);
    this.bloecke = s.bloecke;
    this.version++;
    const w = this.werte();
    this.wahlen = this.story.currentChoices.map((c) => leseWahl(c.index, c.text, w));
    this.ankerId = [...s.bloecke].reverse().find((b) => b.typ === 'gewaehlt')?.id ?? 0;
    this.seite = 'geschichte';
  }

  /** Diese Perle von vorn beginnen (Speicherpunkt bei # perle). */
  async perleNeu() {
    const s = this.vorhanden;
    const sp = s?.speicherpunkt;
    if (!s || !sp) { this.hinweis = 'Für diese Perle gibt es noch keinen Speicherpunkt.'; return; }
    try {
      this.story = new Story(storyJson);
      this.story.state.LoadJson(sp.ink);
    } catch {
      this.hinweis = 'Der Spielstand passt nicht mehr zur Geschichte. Bitte beginne ein neues Abenteuer.';
      this.seite = 'start';
      return;
    }
    this.uebernehme(s);
    this.buch = kopie(sp.buch);
    this.speicherpunkt = sp;
    this.bloecke = [];
    this.naechsteId = sp.bloeckeId;
    this.ende = false;
    this.verarbeite(sp.zeile, sp.tags, true);
    this.seite = 'geschichte';
    await this.weiterGeschichte();
  }

  private uebernehme(s: Stand) {
    this.perle = s.perle;
    this.kapitel = s.kapitel;
    this.bild = s.bild;
    this.buch = s.buch;
    this.naechsteId = s.naechsteId;
    this.tippsUebrig = s.tippsUebrig;
    this.ende = s.ende;
    this.speicherpunkt = s.speicherpunkt;
    this.offenerEintrag = null;
    this.handschriftAb = false;
    this.zettel = { nr: this.zettel.nr + 1, zeilen: [] };
  }

  zumEinband() {
    this.seite = 'start';
  }
}
