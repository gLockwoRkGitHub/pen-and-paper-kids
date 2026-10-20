// Feste Texte des Players. Alles, was sich mit der Geschichte ändert, kommt aus Ink;
// hier steht nur, was zum Buch selbst gehört (Quelle jeweils angegeben).

/** „Was ich gut kann“ – bestätigt von Pasco am 14.10.2026, docs/tagebuch.md Abschnitt 3 */
export const GUT_VOLK: Record<string, string> = {
  mensch: 'Ich lerne schnell und passe mich an. In jeder Stadt finde ich mich zurecht.',
  zwerg: 'Ich bin stark und stur wie der Fels. Was ich einmal festhalte, lasse ich nicht mehr los.',
  gnom: 'In meinem Kopf drehen sich immer Zahnräder. Für jedes Problem fällt mir eine Idee ein, meistens sogar zwei.',
  ork: 'Ich bin laut und stolz, und mein Herz sitzt am rechten Fleck. Wenn ich rede, hören die Leute zu.',
  troll: 'Ich bin größer als die meisten und trotzdem schneller als fast alle. Niemand rechnet damit, wie flink ich bin.'
};

export const GUT_HINTERGRUND: Record<string, string> = {
  reisender: 'Seit drei Sommern ziehe ich mit Maren über die Wege des Landes. Ich finde Pfade, die auf keiner Karte stehen.',
  schausteller: 'Ich gehöre zu den Funkelnden Narren. Ich kann jonglieren und weiß, wie man ein Publikum fesselt. Man muss nur wissen, wo es kitzelt.',
  strassenkind: 'Ich kenne jede Abkürzung zwischen Hafen und Markt, jedes Dach und jeden Keller. Wo andere nicht durchkommen, schlüpfe ich hindurch.',
  botenlaeufer: 'Ich laufe für das Botenhaus am Markt und kenne jeden Torwächter mit Namen. Meister Holm sagt, ich hätte Wind in den Beinen. Und niemand hält einen Boten auf.',
  kartografenlehrling: 'Zwei Jahre habe ich bei Meisterin Ysolde gelernt. Wenn ich etwas zeichnen oder vermessen soll, weiß meine Hand, was zu tun ist.',
  schiffsjunge: 'Ich fahre auf der Seemöwe von Kapitänin Rhea. Ich kenne jedes Tau und jeden Knoten, und in der Takelage klettere ich wie andere auf einer Treppe.'
};

export const VOLK_NAME: Record<string, [string, string]> = {
  mensch: ['Mensch', 'Mensch'], zwerg: ['Zwerg', 'Zwergin'], gnom: ['Gnom', 'Gnomin'], ork: ['Ork', 'Orkin'], troll: ['Troll', 'Trollin']
};

export const HINTERGRUND_NAME: Record<string, [string, string]> = {
  reisender: ['Reisender', 'Reisende'],
  schausteller: ['Schausteller', 'Schaustellerin'],
  strassenkind: ['Straßenkind', 'Straßenkind'],
  botenlaeufer: ['Botenläufer', 'Botenläuferin'],
  kartografenlehrling: ['Kartografenlehrling', 'Kartografenlehrling'],
  schiffsjunge: ['Schiffsjunge', 'Schiffsmädchen']
};

/** Gilden, so wie sie in der Story heißen */
export const GILDE_NAME: Record<string, string> = {
  weite_feder: 'Gesellschaft der Weiten Feder',
  webstuhl_amboss: 'Gilde von Webstuhl und Amboss',
  phiole: 'Zirkel der Glühenden Phiole',
  leise_hand: 'Die Leise Hand'
};

export const WERT_WOFUER: Record<string, string> = {
  kraft: 'Heben, Kämpfen, Durchhalten',
  geschick: 'Schleichen, Klettern, Fingerfertigkeit',
  verstand: 'Rätsel, Wissen, Spuren lesen',
  ausstrahlung: 'Überreden, Einschüchtern, Lügen erkennen'
};

/** Elemente (docs/magie.md): Farbe, Name der Magie, Quelle */
export const ELEMENT: Record<string, { magie: string; farbe: string; hell: string; quelle: string }> = {
  erde: { magie: 'Erdmagie', farbe: '#6B4E2E', hell: '#E4D6BC', quelle: 'Ein Beutel Erde' },
  wasser: { magie: 'Wassermagie', farbe: '#2C6A86', hell: '#D3E2E6', quelle: 'Der Wasserschlauch' },
  feuer: { magie: 'Feuermagie', farbe: '#A8321F', hell: '#F1D9C8', quelle: 'Die Glutlaterne' },
  wind: { magie: 'Windmagie', farbe: '#5E7A86', hell: '#E4ECEC', quelle: '' }
};
export const STUFE_NAME = ['', 'Funke', 'Strom', 'Sturm'];

/** Hinweise zu den Regeln (# tutorial). Die Regel zur Probe zeigt der Würfel selbst. */
export const TIPP: Record<string, { wer: string; text: string }> = {
  werte: { wer: 'Tickwort sagt', text: 'Deine vier Werte stehen in deinem Tagebuch unter „Ich“. Bei einer Probe zählt der Wert zu deinen zwei Würfeln dazu.' },
  tagebuch: { wer: 'Tickwort sagt', text: 'Unten rechts liegt jetzt dein Tagebuch. Ein rotes Siegel heißt: Es ist etwas Neues darin. Tippe darauf, um es aufzuschlagen.' },
  magie: { wer: 'Gut zu wissen', text: 'Jeder Zauber kostet einen Kraftfunken. Wie viele du noch hast, steht in deinem Tagebuch unter „Ich“.' },
  rasten: { wer: 'Gut zu wissen', text: 'Beim Rasten kommen deine Kraftfunken zurück.' },
  elementstufe: { wer: 'Gut zu wissen', text: 'Deine Magie ist stärker geworden. Eine höhere Stufe heißt: mehr Kraftfunken und größere Zauber.' }
};
