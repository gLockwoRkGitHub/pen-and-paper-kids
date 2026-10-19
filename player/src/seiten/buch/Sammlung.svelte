<script lang="ts">
  // Gemeinsamer Aufbau für „Taschen“ und „Menschen“: links die Skizzen als Liste, rechts das Aufgeschlagene.
  // Die Daten kommen aus den reinen Ink-Funktionen in story/tagebuch.ink (story-konventionen.md, 7a).
  export interface Ding { id: string; name: string; text: string; bild: string; weg?: boolean }

  let { titel, unter, ordner, liste, leer, wegText }: {
    titel: string; unter: string; ordner: string; liste: Ding[]; leer: string; wegText?: string;
  } = $props();

  let auswahl = $state(0);
  let offen = $state(false);
  const d = $derived(liste[auswahl]);
  const src = (bild: string) => `./bilder/${ordner}/${bild}.webp`;
  const verstecken = (ev: Event) => ((ev.currentTarget as HTMLElement).style.visibility = 'hidden');
</script>

<div class="doppel" class:offen>
  <section class="blatt links" aria-label={titel}>
    <div>
      <h1>{titel}</h1>
      <span class="unter">{unter}</span>
    </div>
    <div class="zier" aria-hidden="true"><span></span></div>
    {#if !liste.length}<p class="leer">{leer}</p>{/if}
    <div class="raster">
      {#each liste as x, i (x.id)}
        <button type="button" class="karte" class:weg={x.weg} aria-current={i === auswahl ? 'true' : 'false'} onclick={() => { auswahl = i; offen = true; }}>
          <span class="bild"><img src={src(x.bild)} alt="" loading="lazy" onerror={verstecken} /></span>
          <span class="name">{x.name}</span>
        </button>
      {/each}
    </div>
  </section>

  <section class="blatt rechts" aria-label="Aufgeschlagen">
    {#if d}
      <button type="button" class="zurueck-liste" onclick={() => (offen = false)}>‹ Alle</button>
      <figure class="eingeklebt gross" class:weg={d.weg}>
        <img src={src(d.bild)} alt="" onerror={verstecken} />
      </figure>
      <h2 class="titel" class:weg={d.weg}>{d.name}</h2>
      <p class="hand">{d.text}</p>
      {#if d.weg && wegText}<p class="leer">{wegText}</p>{/if}
    {:else}
      <p class="leer">{leer}</p>
    {/if}
  </section>
</div>

<style>
  .raster { display: grid; grid-template-columns: repeat(auto-fill, minmax(118px, 1fr)); gap: 10px; }
  .karte { display: flex; flex-direction: column; align-items: center; gap: 4px; padding: 8px 6px; border: none; border-radius: 8px; background: transparent; color: var(--tinte); min-height: 44px; }
  .karte[aria-current='true'] { background: rgba(142, 47, 35, 0.12); box-shadow: inset 0 0 0 2px rgba(142, 47, 35, 0.4); }
  .bild { width: 100%; aspect-ratio: 1; display: flex; align-items: center; justify-content: center; }
  .bild img { max-width: 100%; max-height: 100%; object-fit: contain; mix-blend-mode: multiply; }
  .name { font-family: var(--schrift-hand); font-size: 16px; line-height: 1.2; text-align: center; }
  .weg .name, .titel.weg { text-decoration: line-through; text-decoration-color: var(--rot); text-decoration-thickness: 2px; }
  .karte.weg img, .eingeklebt.weg img { opacity: 0.55; }
  .gross { align-self: center; width: min(360px, 100%); margin-top: 10px; transform: rotate(0.8deg); }
  .titel { font-family: var(--schrift-hand) !important; font-size: 30px !important; letter-spacing: 0 !important; color: var(--tinte) !important; }
  .hand { margin: 0; font-size: 21px !important; }
  .zurueck-liste { display: none; align-self: flex-start; min-height: 40px; border: none; background: transparent; font-family: var(--schrift-ui); font-size: 16px; font-weight: 700; color: #5A2A1C; padding: 0; }
  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .doppel:not(.offen) .rechts { display: none; }
    .doppel.offen .links { display: none; }
    .zurueck-liste { display: block; }
    .raster { grid-template-columns: repeat(auto-fill, minmax(100px, 1fr)); }
  }
</style>
