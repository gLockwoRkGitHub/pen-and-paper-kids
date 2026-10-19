<script lang="ts">
  // Lasche „Erlebtes“ (Design-Entwurf „Tagebuch“): links die Einträge nach Perlen, rechts der aufgeschlagene Eintrag.
  // Tagebuchseite = Skizze + „Du zeichnest …“ + Handschrift; Erinnerung = die Stelle aus der Geschichte.
  import type { Spiel, Eintrag } from '../../lib/spiel.svelte';
  import { roemisch, ohneAnfuehrung } from '../../lib/text';
  import karten from '../../../../docs/art/karten/karten.json';

  let { spiel, start, zurKarte }: { spiel: Spiel; start: number | null; zurKarte: (ort: string) => void } = $props();

  const eintraege = $derived(spiel.buch.eintraege.filter((e) => e.fertig || e.zeilen.length));
  let auswahl = $state(start ?? spiel.buch.eintraege.length - 1);
  let offen = $state(start !== null);   // Handy: Eintrag statt Liste zeigen

  const gruppen = $derived.by(() => {
    const g: { perle: number; titel: string; liste: { e: Eintrag; i: number }[] }[] = [];
    spiel.buch.eintraege.forEach((e, i) => {
      let gr = g.find((x) => x.perle === e.perle);
      if (!gr) { gr = { perle: e.perle, titel: spiel.buch.perlen?.[e.perle] ?? '', liste: [] }; g.push(gr); }
      gr.liste.push({ e, i });
    });
    return g;
  });

  const e = $derived(spiel.buch.eintraege[auswahl] as Eintrag | undefined);
  const ORTE = (karten as unknown as { orte: Record<string, { name: string }> }).orte;
  const ortId = $derived(e?.ort?.startsWith('ort:') ? e.ort.slice(4) : '');
  const ortName = $derived(ORTE[ortId]?.name ?? '');

  // Tagebuchseite: Bildunterschrift = Erzählzeilen vor der Handschrift, ohne „Darunter schreibst du:“
  const unterschrift = $derived(e ? e.zeilen.filter((z) => !z.handschrift && !/schreibst du:?$/i.test(z.text.trim())).map((z) => z.text).join(' ') : '');
  const handschrift = $derived(e ? e.zeilen.filter((z) => z.handschrift).map((z) => ohneAnfuehrung(z.text)) : []);

  function waehle(i: number) {
    auswahl = i;
    offen = true;
  }
</script>

<div class="doppel" class:offen>
  <section class="blatt links" aria-label="Inhalt des Tagebuchs">
    <div>
      <h1>Mein Tagebuch</h1>
      <span class="unter">Was ich erlebt und entschieden habe</span>
    </div>
    <div class="zier" aria-hidden="true"><span></span></div>
    {#if !eintraege.length}
      <p class="leer">Noch ist keine Seite beschrieben.</p>
    {/if}
    <div class="gruppen">
      {#each gruppen as g (g.perle)}
        <div class="gruppe">
          <span class="klein-titel">PERLE {roemisch(g.perle)}{g.titel ? ` · ${g.titel.toUpperCase()}` : ''}</span>
          {#each g.liste as { e: x, i } (i)}
            <button type="button" class="listen-knopf" aria-current={i === auswahl ? 'true' : 'false'} onclick={() => waehle(i)}>
              {#if x.seite}
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#2F5A3A" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M20 4c-6 0-11 4-13 11l-2 5" /><path d="M20 4c0 6-4 11-11 12" /></svg>
              {:else}
                <span class="erinnerung-punkt" aria-hidden="true"></span>
              {/if}
              <span class="titel">{x.titel}</span>
              <span class="art">{x.seite ? 'Seite' : 'Erinnerung'}</span>
            </button>
          {/each}
        </div>
      {/each}
    </div>
    <p class="leer weiter-unten">Die nächsten Seiten sind noch leer.</p>
  </section>

  <section class="blatt rechts" aria-label="Eintrag">
    {#if e}
      <button type="button" class="zurueck-liste" onclick={() => (offen = false)}>‹ Alle Einträge</button>
      <div class="kopf">
        <span class="klein-titel">PERLE {roemisch(e.perle)} · {e.seite ? 'TAGEBUCHSEITE' : 'ERINNERUNG'}</span>
        <h2 class="eintrag-titel">{e.titel}</h2>
      </div>
      <div class="text">
        {#if e.seite}
          {#if e.bild}
            <figure class="eingeklebt">
              <img src="./bilder/{e.bild}.webp" alt="" onerror={(ev) => ((ev.currentTarget as HTMLElement).closest('figure')!.style.display = 'none')} />
            </figure>
          {/if}
          {#if unterschrift}<p class="unterschrift">{unterschrift}</p>{/if}
          <div class="hand liniert">
            {#each handschrift as z, k (k)}<div>{z}</div>{/each}
          </div>
        {:else}
          {#each e.zeilen as z, k (k)}
            <p class:hand={z.handschrift} class="absatz">
              {#if k === 0}<span class="initiale">{z.text.charAt(0)}</span>{z.text.slice(1)}{:else}{z.text}{/if}
            </p>
          {/each}
        {/if}
      </div>
      <div class="fuss">
        {#if ortName}
          <button type="button" class="ort" onclick={() => zurKarte(ortId)}>{ortName} auf der Karte</button>
        {:else}<span class="ort-platz"></span>{/if}
        <button type="button" class="blaettern" aria-label="Vorige Seite" disabled={auswahl <= 0} onclick={() => (auswahl -= 1)}>‹</button>
        <button type="button" class="blaettern" aria-label="Nächste Seite" disabled={auswahl >= spiel.buch.eintraege.length - 1} onclick={() => (auswahl += 1)}>›</button>
      </div>
    {:else}
      <p class="leer">Wenn du etwas erlebst, schreibst du es hier auf.</p>
    {/if}
  </section>
</div>

<style>
  .gruppen { display: flex; flex-direction: column; gap: 10px; }
  .gruppe { display: flex; flex-direction: column; gap: 2px; }
  .titel { flex: 1; min-width: 0; }
  .erinnerung-punkt { width: 20px; height: 20px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
  .erinnerung-punkt::after { content: ''; width: 12px; height: 12px; border-radius: 50%; background: var(--rot); box-shadow: 0 0 0 2px var(--rot-dunkel); }
  .weiter-unten { margin: auto 0 0; padding-top: 10px; }
  .kopf { display: flex; flex-direction: column; gap: 2px; }
  .eintrag-titel { font-size: 26px !important; font-weight: 900 !important; line-height: 1.2; letter-spacing: 0.02em !important; }
  .text { flex: 1; display: flex; flex-direction: column; gap: 12px; }
  .eingeklebt { margin: 8px 0 0; transform: rotate(-0.8deg); }
  .unterschrift { margin: 0; font-family: var(--schrift-text); font-size: 15px; font-style: italic; line-height: 1.4; color: var(--tinte-weich); }
  .absatz { margin: 0; font-family: var(--schrift-text); font-size: 18px; line-height: 1.55; }
  .absatz.hand { font-family: var(--schrift-hand); font-size: 19px; }
  .initiale { float: left; font-family: var(--schrift-titel); font-size: 58px; font-weight: 900; line-height: 48px; padding: 6px 8px 0 0; color: var(--rot); }
  .fuss { display: flex; align-items: center; gap: 8px; padding: 10px 40px 4px 0; border-top: 1px solid #C7AE7E; }
  .ort { flex: 1; min-height: 44px; border: none; background: transparent; text-align: left; color: #284B66; font-family: var(--schrift-ui); font-size: 15px; font-weight: 700; text-decoration: underline dotted; text-underline-offset: 4px; }
  .ort-platz { flex: 1; }
  .blaettern { width: 48px; height: 44px; border: 2px solid #B39766; border-radius: 8px; background: transparent; font-size: 24px; line-height: 1; color: #5A2A1C; }
  .blaettern:disabled { opacity: 0.3; }
  .zurueck-liste { display: none; align-self: flex-start; min-height: 40px; border: none; background: transparent; font-family: var(--schrift-ui); font-size: 16px; font-weight: 700; color: #5A2A1C; padding: 0; }

  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .doppel:not(.offen) .rechts { display: none; }
    .doppel.offen .links { display: none; }
    .zurueck-liste { display: block; }
    .fuss { padding-right: 0; }
  }
</style>
