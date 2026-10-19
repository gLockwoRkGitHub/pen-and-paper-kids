<script lang="ts">
  // Lasche „Karte“ (docs/art/karten/README.md, Design-Entwurf „Karte“):
  // Grundkarte nur in den aufgedeckten Bereichen, Ortsskizzen an ihrer Stelle, Wege als Tuschelinie,
  // Namen in Handschrift, „hier bin ich“ und Siegel für die Tagebucheinträge eines Ortes.
  import type { Spiel } from '../../lib/spiel.svelte';
  import { roemisch } from '../../lib/text';
  import kartenDaten from '../../../../docs/art/karten/karten.json';
  import skizzenMasse from '../../generated/skizzen.json';

  let { spiel, start, oeffneEintrag }: { spiel: Spiel; start: string | null; oeffneEintrag: (i: number) => void } = $props();

  type Ort = { karte: string; name: string; x: number; y: number; breite: number; skizze?: string };
  type Bereich = { karte: string; flaeche: number[][]; name?: string; beschriftung?: number[] };
  type Weg = { karte: string; stil: string; name?: string; punkte: number[][] };
  const K = kartenDaten as unknown as {
    karten: Record<string, { name: string; breite: number; hoehe: number; grundkarte: string }>;
    orte: Record<string, Ort>; bereiche: Record<string, Bereich>; wege: Record<string, Weg>;
    start: string[]; variablen: Record<string, { zeigt: string[] }>;
  };
  const MASSE = skizzenMasse as Record<string, number>;

  // Was ist aufgedeckt? Story-Tags (im Buch gemerkt) + Start + Weltgedächtnis-Variablen
  const aufgedeckt = $derived.by(() => {
    const s = new Set<string>([...K.start, ...spiel.buch.aufgedeckt]);
    for (const [v, def] of Object.entries(K.variablen)) if (spiel.wert(v)) def.zeigt.forEach((z) => s.add(z));
    return s;
  });

  const aktuellId = $derived(spiel.buch.aktuell.startsWith('ort:') ? spiel.buch.aktuell.slice(4) : '');
  const startOrt = start ?? aktuellId;
  let karte = $state(K.orte[startOrt]?.karte ?? 'meridel');
  let offen = $state<string | null>(start);
  let zoom = $state(1);

  const lysmaraDa = $derived([...aufgedeckt].some((z) => z.startsWith('ort:') && K.orte[z.slice(4)]?.karte === 'lysmara'));
  const k = $derived(K.karten[karte]);
  const orte = $derived(Object.entries(K.orte).filter(([id, o]) => o.karte === karte && aufgedeckt.has(`ort:${id}`)));
  const bereiche = $derived(Object.entries(K.bereiche).filter(([id, b]) => b.karte === karte && aufgedeckt.has(`bereich:${id}`)));
  const wege = $derived(Object.entries(K.wege).filter(([id, w]) => w.karte === karte && aufgedeckt.has(`weg:${id}`)));

  // Tagebucheinträge je Ort
  const proOrt = $derived.by(() => {
    const m: Record<string, { titel: string; perle: number; i: number }[]> = {};
    spiel.buch.eintraege.forEach((e, i) => {
      if (!e.ort?.startsWith('ort:')) return;
      (m[e.ort.slice(4)] ??= []).push({ titel: e.titel, perle: e.perle, i });
    });
    return m;
  });

  function skizze(o: Ort) {
    if (!o.skizze) return null;
    const pfad = `karten/${o.skizze.replace(/\.png$/, '.webp')}`;
    const h = o.breite * (MASSE[pfad] ?? 0.75);
    return { src: `./bilder/${pfad}`, x: o.x - o.breite / 2, y: o.y - h / 2, b: o.breite, h };
  }
  const flaeche = (f: number[][]) => f.map((p) => p.join(',')).join(' ');
  const linie = (p: number[][]) => p.map((q) => q.join(',')).join(' ');
  const ortOffen = $derived(offen ? K.orte[offen] : null);

  // Auf kleinen Bildschirmen vergrößert öffnen und zum aktuellen (bzw. gesuchten) Ort scrollen
  let kasten: HTMLElement | undefined = $state();
  $effect(() => {
    const f = kasten;
    if (!f) return;
    if (f.clientWidth < 700 && zoom === 1) zoom = 2.5;
  });
  $effect(() => {
    const f = kasten;
    const ziel = K.orte[offen ?? aktuellId];
    void zoom; void karte;
    if (!f || !ziel || ziel.karte !== karte) return;
    requestAnimationFrame(() => {
      const svg = f.querySelector('svg');
      if (!svg) return;
      const s = svg.clientWidth / k.breite;
      f.scrollTo({ left: ziel.x * s - f.clientWidth / 2, top: ziel.y * s - f.clientHeight / 2 });
    });
  });
</script>

<div class="kartenseite blatt">
  <div class="kopf">
    <h1 class="titel">{k.name}</h1>
    {#if lysmaraDa}
      <div class="umschalter" role="group" aria-label="Karte wählen">
        <button type="button" aria-pressed={karte === 'meridel'} onclick={() => { karte = 'meridel'; offen = null; }}>Meridel</button>
        <button type="button" aria-pressed={karte === 'lysmara'} onclick={() => { karte = 'lysmara'; offen = null; }}>Lysmara</button>
      </div>
    {/if}
    <span class="luecke"></span>
    <div class="legende">
      <span><i class="l-siegel"></i>Erinnerung</span>
      <span><i class="l-hier"></i>hier bin ich</span>
      <span><svg width="26" height="6" viewBox="0 0 26 6" aria-hidden="true"><path d="M1 3h24" stroke="#3B2A1A" stroke-width="2" stroke-dasharray="4 4" /></svg>nur davon gehört</span>
    </div>
    <div class="zoom" role="group" aria-label="Vergrößern">
      <button type="button" aria-label="Kleiner" disabled={zoom <= 1} onclick={() => (zoom = Math.max(1, zoom - 0.75))}>−</button>
      <button type="button" aria-label="Größer" disabled={zoom >= 2.5} onclick={() => (zoom = Math.min(2.5, zoom + 0.75))}>+</button>
    </div>
  </div>

  <div class="flaeche" bind:this={kasten}>
    <svg role="img" aria-label="Handgezeichnete Karte von {k.name}" viewBox="0 0 {k.breite} {k.hoehe}" style="width: {zoom * 100}%">
      <defs>
        <filter id="weich-{karte}" x="-10%" y="-10%" width="120%" height="120%"><feGaussianBlur stdDeviation="22" /></filter>
        <mask id="maske-{karte}" maskUnits="userSpaceOnUse" x="0" y="0" width={k.breite} height={k.hoehe}>
          <g filter="url(#weich-{karte})" fill="white">
            {#each bereiche as [id, b] (id)}<polygon points={flaeche(b.flaeche)} />{/each}
            {#each orte as [id, o] (id)}<circle cx={o.x} cy={o.y} r={o.breite * 0.9} />{/each}
          </g>
        </mask>
      </defs>
      <image href="./bilder/{k.grundkarte.replace(/\.png$/, '.webp')}" x="0" y="0" width={k.breite} height={k.hoehe} preserveAspectRatio="none" mask="url(#maske-{karte})" class="druck" />

      {#each wege as [id, w] (id)}
        <polyline points={linie(w.punkte)} fill="none" stroke="#3B2A1A" stroke-linecap="round" stroke-linejoin="round"
          stroke-width={w.stil === 'strasse' ? 5 : 3} stroke-dasharray={w.stil === 'unsicher' ? '10 10' : w.stil === 'pfad' ? '2 7' : 'none'} opacity="0.75" />
      {/each}

      {#each bereiche as [id, b] (id)}
        {#if b.name && b.beschriftung}
          <text x={b.beschriftung[0]} y={b.beschriftung[1]} class="bereichsname">{b.name}</text>
        {/if}
      {/each}

      {#each orte as [id, o] (id)}
        {@const s = skizze(o)}
        <g class="ort" role="button" tabindex="0" aria-label={o.name} onclick={() => (offen = id)} onkeydown={(e) => e.key === 'Enter' && (offen = id)}>
          {#if s}<image href={s.src} x={s.x} y={s.y} width={s.b} height={s.h} class="druck" />{/if}
          <rect x={o.x - o.breite / 2} y={o.y - o.breite / 2} width={o.breite} height={o.breite} fill="transparent" />
          <text x={o.x} y={o.y + (s ? s.h / 2 : 10) + 26} class="ortsname">{o.name}</text>
        </g>
        {#if id === aktuellId}
          <circle cx={o.x} cy={o.y} r={Math.max(34, o.breite * 0.62)} fill="none" stroke="#A8321F" stroke-width="5" class="hier" />
        {/if}
        {#if proOrt[id]?.length}
          <g class="siegel" role="button" tabindex="0" aria-label="{proOrt[id].length} Einträge in {o.name}" onclick={() => (offen = id)} onkeydown={(e) => e.key === 'Enter' && (offen = id)}>
            <circle cx={o.x + o.breite / 2} cy={o.y - o.breite / 3} r="22" />
            <text x={o.x + o.breite / 2} y={o.y - o.breite / 3 + 8}>{proOrt[id].length}</text>
          </g>
        {/if}
      {/each}
    </svg>
  </div>

  {#if offen && ortOffen}
    <div class="zettel" role="dialog" aria-label={ortOffen.name}>
      <div class="zettel-kopf">
        <span class="zettel-name">{ortOffen.name}</span>
        <button type="button" class="zu" aria-label="Schließen" onclick={() => (offen = null)}>×</button>
      </div>
      {#if proOrt[offen]?.length}
        <span class="klein-titel">AUS MEINEM TAGEBUCH</span>
        {#each proOrt[offen] as e (e.i)}
          <button type="button" class="eintrag" onclick={() => oeffneEintrag(e.i)}>
            <span>{e.titel}</span><small>Perle {roemisch(e.perle)}</small>
          </button>
        {/each}
      {:else}
        <span class="leer">Hier habe ich noch nichts aufgeschrieben.</span>
      {/if}
      {#if offen === 'lysmara' && lysmaraDa}
        <button type="button" class="knopf" onclick={() => { karte = 'lysmara'; offen = null; }}>Stadtplan öffnen</button>
      {/if}
    </div>
  {/if}
</div>

<style>
  .kartenseite { flex: 1; border-radius: 6px; position: relative; padding: 18px 22px 16px; gap: 8px; overflow: hidden;
    box-shadow: inset 0 0 70px rgba(110, 66, 18, 0.42), inset -2px 0 0 rgba(60, 35, 12, 0.15); }
  .kopf { display: flex; align-items: center; gap: 14px; flex-wrap: wrap; }
  .titel { font-family: var(--schrift-hand) !important; font-size: 36px !important; line-height: 1; letter-spacing: 0 !important; color: #2E2016 !important; }
  .umschalter { display: flex; gap: 6px; }
  .umschalter button { min-height: 40px; padding: 0 14px; border: 2px solid #9C8456; border-radius: 999px; background: transparent; font-family: var(--schrift-titel); font-size: 14px; font-weight: 700; color: #3B2A1A; }
  .umschalter button[aria-pressed='true'] { background: var(--rot); border-color: var(--rot-dunkel); color: var(--rot-papier); }
  .luecke { flex: 1; }
  .legende { display: flex; gap: 16px; align-items: center; font-family: var(--schrift-hand); font-size: 16px; color: #4E3D28; }
  .legende span { display: flex; align-items: center; gap: 6px; }
  .l-siegel { width: 16px; height: 16px; border-radius: 50%; background: var(--rot); box-shadow: 0 0 0 2px var(--rot-dunkel); display: block; }
  .l-hier { width: 14px; height: 14px; border-radius: 50%; border: 3px solid #A8321F; display: block; }
  .zoom { display: flex; gap: 4px; }
  .zoom button { width: 44px; height: 40px; border: 2px solid #9C8456; border-radius: 8px; background: transparent; font-size: 22px; line-height: 1; color: #3B2A1A; }
  .zoom button:disabled { opacity: 0.35; }
  .flaeche { flex: 1; min-height: 0; overflow: auto; display: flex; align-items: flex-start; justify-content: safe center; -webkit-overflow-scrolling: touch; }
  .flaeche svg { display: block; flex-shrink: 0; height: auto; max-height: none; }
  .druck { mix-blend-mode: multiply; }
  .ortsname { font-family: var(--schrift-hand); font-size: 26px; font-weight: 700; fill: #2E2016; text-anchor: middle; paint-order: stroke; stroke: rgba(234, 219, 182, 0.85); stroke-width: 6px; }
  .bereichsname { font-family: var(--schrift-hand); font-size: 34px; font-weight: 700; fill: #5A4630; text-anchor: middle; letter-spacing: 4px; opacity: 0.8; }
  .ort { cursor: pointer; }
  .ort, .siegel { outline: none; }
  .ort:focus-visible .ortsname { fill: var(--rot); }
  .hier { filter: drop-shadow(0 0 3px rgba(168, 50, 31, 0.35)); pointer-events: none; animation: puls 2.4s ease-in-out infinite; transform-box: fill-box; transform-origin: center; }
  @keyframes puls { 50% { transform: scale(1.12); opacity: 0.7; } }
  .siegel { cursor: pointer; }
  .siegel circle { fill: var(--rot); stroke: var(--rot-dunkel); stroke-width: 3; filter: drop-shadow(0 2px 3px rgba(0, 0, 0, 0.35)); }
  .siegel text { fill: var(--rot-papier); font-family: var(--schrift-ui); font-size: 22px; font-weight: 700; text-anchor: middle; }
  .zettel { position: absolute; right: 26px; bottom: 26px; z-index: 3; width: min(340px, calc(100% - 32px)); max-height: 70%; overflow-y: auto; padding: 14px 16px; border-radius: 6px; background: #F4EBD6; box-shadow: 0 6px 16px rgba(40, 22, 8, 0.4); display: flex; flex-direction: column; gap: 8px; transform: rotate(-0.6deg); }
  .zettel-kopf { display: flex; align-items: flex-start; justify-content: space-between; gap: 8px; border-bottom: 1px solid #C7AE7E; padding-bottom: 6px; }
  .zettel-name { font-family: var(--schrift-titel); font-size: 20px; font-weight: 900; color: #5A2A1C; }
  .zu { width: 44px; height: 44px; margin: -10px -10px 0 0; border: none; background: transparent; font-size: 28px; color: #5A2A1C; }
  .eintrag { display: flex; align-items: center; gap: 10px; min-height: 44px; border: none; background: transparent; text-align: left; padding: 0; color: #2E2016; }
  .eintrag span { flex: 1; font-family: var(--schrift-text); font-size: 17px; font-weight: 700; border-bottom: 1px dotted #9C8456; }
  .eintrag small { font-family: var(--schrift-titel); font-size: 12px; color: #725C38; }
  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .kartenseite { padding: 12px 10px 10px; }
    .legende { display: none; }
    .titel { font-size: 30px !important; }
    .zettel { right: 10px; left: 10px; width: auto; bottom: 10px; }
  }
</style>
