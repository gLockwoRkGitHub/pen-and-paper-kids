// Liest die Schreibweisen aus der Story, die der Player besonders darstellt
// (docs/story-konventionen.md, Abschnitte 2a, 4 und 8).

export const WERTE = ['kraft', 'geschick', 'verstand', 'ausstrahlung'] as const;
export type Wert = (typeof WERTE)[number];
export const WERT_NAME: Record<Wert, string> = {
  kraft: 'Kraft', geschick: 'Geschick', verstand: 'Verstand', ausstrahlung: 'Ausstrahlung'
};
const WERT_ID: Record<string, Wert> = { Kraft: 'kraft', Geschick: 'geschick', Verstand: 'verstand', Ausstrahlung: 'ausstrahlung' };

export interface Wahl {
  index: number;
  text: string;          // ohne Vorteil und Abzeichen
  vorteil: string;       // „Schiffsjunge“ aus „(Schiffsjunge) …“
  abzeichen: string;     // „Geschick +2“, „Zauber“, „1 → 2“
  art: 'wert' | 'zauber' | 'sonst' | '';
}

/** Zerlegt den Text einer Entscheidung. `werte` sind die aktuellen Werte der Spielfigur. */
export function leseWahl(index: number, roh: string, werte: Record<Wert, number>): Wahl {
  let text = roh.trim();
  let vorteil = '';
  let abzeichen = '';
  let art: Wahl['art'] = '';
  const v = text.match(/^\(([^()]+)\)\s*/);
  if (v) { vorteil = v[1]; text = text.slice(v[0].length); }
  const a = text.match(/\s*\(([^()]+)\)$/);
  if (a) {
    text = text.slice(0, a.index).trim();
    const inhalt = a[1].trim();
    const w = inhalt.match(/^(Kraft|Geschick|Verstand|Ausstrahlung)(?:\s*([+-]\d+))?$/);
    if (w) {
      const id = WERT_ID[w[1]];
      const zahl = werte[id] + (w[2] ? parseInt(w[2], 10) : 0);
      abzeichen = `${w[1]} ${zahl >= 0 ? '+' : ''}${zahl}`;
      art = 'wert';
    } else if (inhalt.startsWith('Zauber')) {
      abzeichen = 'Zauber';
      art = 'zauber';
    } else {
      abzeichen = inhalt;
      art = 'sonst';
    }
  }
  return { index, text, vorteil, abzeichen, art };
}

/** „Titel – Beschreibung“ (Charaktererstellung) */
export function teileTitel(t: string): [string, string] {
  const i = t.indexOf(' – ');
  return i < 0 ? [t.trim(), ''] : [t.slice(0, i).trim(), t.slice(i + 3).trim()];
}

/** „Kraft (1)“ in der Charaktererstellung */
export function leseWerteWahl(t: string): { id: Wert; jetzt: number } | null {
  const m = t.trim().match(/^(Kraft|Geschick|Verstand|Ausstrahlung)\s*\((\d+)\)$/);
  return m ? { id: WERT_ID[m[1]], jetzt: parseInt(m[2], 10) } : null;
}

export interface Probe {
  wert: string;
  augen: number;
  bonus: number;
  gesamt: number;
  ergebnis: string;
  art: 'erfolg' | 'jaaber' | 'miss';
}

/** „(Geschick: Würfel 8 + 1 = 9 – Ja, aber …)“ aus probe_zeile() */
export function leseProbe(zeile: string): Probe | null {
  const m = zeile.trim().match(/^\((.+?): Würfel (\d+) \+ (-?\d+) = (-?\d+) – (.+)\)$/);
  if (!m) return null;
  const ergebnis = m[5].trim();
  const art = ergebnis.startsWith('Erfolg') ? 'erfolg' : ergebnis.startsWith('Ja') ? 'jaaber' : 'miss';
  return { wert: m[1], augen: +m[2], bonus: +m[3], gesamt: +m[4], ergebnis, art };
}

/**
 * Ink würfelt nur die Summe (2W6). Für die Anzeige teilen wir sie auf zwei Würfel auf –
 * immer gleich für dieselbe Probe, damit ein neu geladener Spielstand dasselbe zeigt.
 */
export function teileAugen(summe: number, salz: number): [number, number] {
  const min = Math.max(1, summe - 6);
  const max = Math.min(6, summe - 1);
  const a = min + (Math.abs(salz * 7 + summe * 3) % (max - min + 1));
  return [a, summe - a];
}

/** Tags in { name, wert } zerlegen: „bild: szene/hafen“ → ["bild", "szene/hafen"] */
export function leseTag(t: string): [string, string] {
  const i = t.indexOf(':');
  return i < 0 ? [t.trim(), ''] : [t.slice(0, i).trim(), t.slice(i + 1).trim()];
}

const ROEMISCH = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'];
export const roemisch = (n: number) => ROEMISCH[n] ?? String(n);

/** Äußere Anführungszeichen der Handschrift weglassen (Abschnitt 7) */
export function ohneAnfuehrung(t: string): string {
  return t.replace(/^\s*[„"»]/, '').replace(/[“"«]\s*$/, '');
}
