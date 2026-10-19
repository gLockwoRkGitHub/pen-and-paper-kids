<script lang="ts">
  // Leseseite (Design-Entwurf „Geschichte“): Szenenbild links, Text rechts; auf dem Handy untereinander.
  import { tick, untrack } from 'svelte';
  import { SvelteSet } from 'svelte/reactivity';
  import { fade } from 'svelte/transition';
  import type { Spiel, Block } from '../lib/spiel.svelte';
  import { roemisch } from '../lib/text';
  import Wuerfel from './Wuerfel.svelte';

  let { spiel }: { spiel: Spiel } = $props();

  let leser: HTMLElement | undefined = $state();
  let buchOffen = $state(false);

  // Proben, deren Würfel schon ausgerollt sind. Was schon da ist (geladener Stand), rollt nicht noch einmal.
  const fertigeProben = new SvelteSet<number>(
    untrack(() => spiel.bloecke.filter((b) => b.typ === 'probe').map((b) => b.id))
  );

  // Text nach einer Probe erscheint erst, wenn die Würfel liegen.
  const sichtbar = $derived.by(() => {
    const i = spiel.bloecke.findIndex((b) => b.typ === 'probe' && !fertigeProben.has(b.id));
    return i < 0 ? spiel.bloecke : spiel.bloecke.slice(0, i + 1);
  });
  const allesDa = $derived(sichtbar.length === spiel.bloecke.length);

  // Das Bild links ist das zuletzt sichtbare
  const bild = $derived([...sichtbar].reverse().find((b) => b.typ === 'bild') as Extract<Block, { typ: 'bild' }> | undefined);
  const hochkant = (pfad: string) => pfad.startsWith('figur/');
  const src = (pfad: string) => `./bilder/${pfad}.webp`;

  // Lesefluss (story-konventionen.md, Abschnitt 2): die gewählte Zeile rückt nach oben, nie ans Ende springen.
  // Laden danach noch Bilder oder erscheint Text nach den Würfeln, wird kurz nachjustiert –
  // aber nur, solange niemand selbst scrollt.
  let fluss: HTMLElement | undefined = $state();
  $effect(() => {
    const id = spiel.ankerId;
    const l = leser;
    const f = fluss;
    if (!l || !f) return;
    let selbst = false;
    const ausrichten = (sanft: boolean) => {
      const anker = id ? l.querySelector<HTMLElement>(`[data-block="${id}"]`) : null;
      if (!anker) { if (!id) l.scrollTo({ top: 0 }); return; }
      const ziel = anker.getBoundingClientRect().top - l.getBoundingClientRect().top + l.scrollTop - 12;
      if (Math.abs(ziel - l.scrollTop) > 2) l.scrollTo({ top: Math.max(0, ziel), behavior: sanft ? 'smooth' : 'auto' });
    };
    const stopp = () => (selbst = true);
    l.addEventListener('touchstart', stopp, { passive: true });
    l.addEventListener('wheel', stopp, { passive: true });
    l.addEventListener('keydown', stopp);
    tick().then(() => ausrichten(true));
    const gestartet = Date.now();
    const beobachter = new ResizeObserver(() => {
      if (!selbst && Date.now() - gestartet < 2500) ausrichten(false);
    });
    beobachter.observe(f);
    return () => {
      beobachter.disconnect();
      l.removeEventListener('touchstart', stopp);
      l.removeEventListener('wheel', stopp);
      l.removeEventListener('keydown', stopp);
    };
  });

  // „Neu im Tagebuch“: nach vier Sekunden ausblenden, das Siegel am Buch bleibt.
  let zettelZeilen = $state<string[]>([]);
  let zettelAn = $state(false);
  $effect(() => {
    const z = spiel.zettel;
    if (!z.zeilen.length) return;
    zettelZeilen = z.zeilen;
    zettelAn = true;
    const t = setTimeout(() => (zettelAn = false), 4000);
    return () => clearTimeout(t);
  });

  function oeffneBuch() {
    buchOffen = true;
    spiel.buchGesehen();
  }
</script>

<main class="tisch">
  <div class="buch pergament">
    <div class="bildseite" aria-hidden={!bild}>
      {#if bild}
        {#key bild.pfad}
          <img class:hochkant={hochkant(bild.pfad)} src={src(bild.pfad)} alt="" in:fade={{ duration: 500 }} onerror={(e) => ((e.currentTarget as HTMLImageElement).style.visibility = 'hidden')} />
        {/key}
      {/if}
      <svg class="kante" viewBox="0 0 26 790" preserveAspectRatio="none" aria-hidden="true"><path d="M26 0 L12 0 L18 40 L8 90 L16 140 L6 200 L15 260 L9 320 L18 380 L7 440 L14 500 L5 560 L16 620 L8 680 L15 740 L10 790 L26 790 Z" fill="#F4EBD6" /></svg>
    </div>

    <section class="textseite" aria-label="Geschichte">
      <header>
        <span class="perle">{spiel.perle ? `PERLE ${roemisch(spiel.perle)}` : ''}{spiel.kapitel ? ` · ${spiel.kapitel.toUpperCase()}` : ''}</span>
        <button type="button" class="einband" aria-label="Zum Einband" title="Zum Einband" onclick={() => spiel.zumEinband()}>
          <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" aria-hidden="true"><path d="M5 4h11a3 3 0 0 1 3 3v13H8a3 3 0 0 1-3-3z" /><path d="M5 17a3 3 0 0 1 3-3h11" /></svg>
        </button>
      </header>

      <div class="leser" bind:this={leser}>
        <div class="fluss" bind:this={fluss}>
          {#each sichtbar as b (b.id)}
            <div class="block" data-block={b.id}>
              {#if b.typ === 'kapitel'}
                <div class="kapitel">
                  <span class="kapitel-perle">Perle {roemisch(b.perle)}</span>
                  <h2>{b.titel}</h2>
                </div>
              {:else if b.typ === 'bild'}
                <figure class="bild-im-text">
                  <img class:hochkant={hochkant(b.pfad)} src={src(b.pfad)} alt="" onerror={(e) => ((e.currentTarget as HTMLElement).closest('figure')!.style.display = 'none')} />
                </figure>
              {:else if b.typ === 'text'}
                <p class:hand={b.handschrift}>
                  {#if b.initiale}<span class="initiale">{b.text.charAt(0)}</span>{b.text.slice(1)}{:else}{b.text}{/if}
                </p>
              {:else if b.typ === 'gewaehlt'}
                <p class="gewaehlt">{b.text}</p>
              {:else if b.typ === 'probe'}
                <Wuerfel probe={b.probe} salz={b.salz} tipp={b.tipp} fertig={fertigeProben.has(b.id)} onfertig={() => fertigeProben.add(b.id)} />
              {:else if b.typ === 'ende'}
                <div class="ende">
                  <span class="ende-zier" aria-hidden="true">✦ ✦ ✦</span>
                  <p>Hier endet das erste Abenteuer.</p>
                  <button type="button" class="knopf" onclick={() => spiel.zumEinband()}>Zum Einband</button>
                </div>
              {/if}
            </div>
          {/each}

          {#if allesDa && spiel.wahlen.length}
            <div class="wahlen" role="group" aria-label="Was tust du?">
              {#each spiel.wahlen as w (w.index)}
                <button type="button" class="wahl" onclick={() => spiel.waehle(w.index)}>
                  <span class="punkt" aria-hidden="true"></span>
                  <span class="wahl-text">
                    {#if w.vorteil}<span class="vorteil">{w.vorteil}</span>{/if}
                    {w.text}
                  </span>
                  {#if w.abzeichen}
                    <span class="abzeichen" class:zauber={w.art === 'zauber'}>
                      {#if w.art === 'zauber'}
                        <svg width="12" height="12" viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2l2.4 7.6L22 12l-7.6 2.4L12 22l-2.4-7.6L2 12l7.6-2.4z" fill="currentColor" /></svg>
                      {:else if w.art === 'wert'}
                        <span class="raute" aria-hidden="true"></span>
                      {/if}
                      {w.abzeichen}
                    </span>
                  {/if}
                </button>
              {/each}
            </div>
          {/if}
          <div class="platz" aria-hidden="true"></div>
        </div>
      </div>
    </section>

    {#if spiel.buch.da}
      <div class="ecke">
        {#if zettelZeilen.length}
          <div class="zettel" class:an={zettelAn} role="status">
            <span class="zettel-titel">NEU IM TAGEBUCH</span>
            {#each zettelZeilen as z, i (i)}<span class="zettel-zeile">{z}</span>{/each}
          </div>
        {/if}
        <button type="button" class="zu" aria-label="Tagebuch öffnen{spiel.buch.neu ? `, ${spiel.buch.neu} neu` : ''}" onclick={oeffneBuch}>
          <span class="deckel" aria-hidden="true"></span>
          <span class="naht" aria-hidden="true"></span>
          <span class="ecke-o" aria-hidden="true"></span>
          <span class="ecke-u" aria-hidden="true"></span>
          <span class="baendchen" aria-hidden="true"></span>
          <span class="aufschrift">Tagebuch</span>
          {#if spiel.buch.neu}<span class="siegel" aria-hidden="true">{spiel.buch.neu}</span>{/if}
        </button>
      </div>
    {/if}
  </div>

  {#if buchOffen}
    <div class="ueberlagerung" role="dialog" aria-modal="true" aria-label="Tagebuch" transition:fade={{ duration: 200 }}>
      <div class="offenes-buch pergament">
        <button type="button" class="lesebaendchen" onclick={() => (buchOffen = false)}>Zurück zur Geschichte</button>
        <h2>Dein Tagebuch</h2>
        <p>Die Seiten Ich, Erlebtes, Karte, Taschen und Menschen kommen im nächsten Ausbauschritt.</p>
        <p class="klein">Bisher eingetragen: {spiel.buch.eintraege.length} Einträge · {spiel.buch.aufgedeckt.length} Orte und Wege auf der Karte · {Object.values(spiel.buch.taschen).filter((s) => s === 1).length} Dinge in den Taschen · {spiel.buch.menschen.length} Menschen</p>
      </div>
    </div>
  {/if}
</main>

<style>
  .tisch { height: 100%; padding: 22px; background: var(--tisch); display: flex; }
  .buch { position: relative; flex: 1; display: flex; border-radius: 8px; overflow: hidden; box-shadow: 0 14px 34px rgba(0, 0, 0, 0.6); max-width: 1500px; margin: 0 auto; }

  .bildseite { position: relative; width: 42%; max-width: 620px; flex-shrink: 0; overflow: hidden; background: #E8D9B8; }
  .bildseite img { position: absolute; inset: 0; width: 100%; height: 100%; object-fit: cover; }
  .bildseite img.hochkant { object-fit: contain; padding: 24px 30px 24px 18px; }
  .kante { position: absolute; top: 0; right: -1px; height: 100%; width: 26px; }

  .textseite { flex: 1; min-width: 0; display: flex; flex-direction: column; padding: 26px 34px 0 26px; }
  header { display: flex; align-items: center; gap: 10px; padding-bottom: 10px; border-bottom: 1px solid var(--linie-hell); min-height: 44px; }
  .perle { flex: 1; font-family: var(--schrift-titel); font-size: 13px; font-weight: 700; letter-spacing: 0.14em; color: var(--tinte-blass); }
  .einband { width: 44px; height: 44px; display: grid; place-items: center; border: none; border-radius: 8px; background: transparent; color: var(--tinte-blass); }

  .leser { flex: 1; min-height: 0; overflow-y: auto; padding: 6px 8px 0 0; -webkit-overflow-scrolling: touch; overscroll-behavior: contain; }
  .fluss { display: flex; flex-direction: column; gap: 14px; font-family: var(--schrift-text); font-size: 20px; line-height: 1.6; color: var(--tinte); max-width: 46em; }
  .fluss p { margin: 0; }
  .initiale { float: left; font-family: var(--schrift-titel); font-size: 62px; font-weight: 900; line-height: 52px; padding: 6px 8px 0 0; color: var(--rot); }
  .hand { font-family: var(--schrift-hand); font-size: 21px; line-height: 1.5; color: #2B3550; padding-left: 10px; }
  .gewaehlt { margin-top: 6px !important; padding-left: 14px; border-left: 3px solid var(--linie); font-style: italic; color: var(--tinte-weich); }
  .kapitel { display: flex; flex-direction: column; align-items: center; gap: 2px; margin: 10px 0 4px; text-align: center; }
  .kapitel-perle { font-family: var(--schrift-titel); font-size: 13px; font-weight: 700; letter-spacing: 0.24em; color: var(--tinte-blass); text-transform: uppercase; }
  .kapitel h2 { margin: 0; font-family: var(--schrift-titel); font-size: 30px; font-weight: 900; color: #5A2A1C; }
  .bild-im-text { display: none; margin: 4px 0; }
  .bild-im-text img { width: 100%; aspect-ratio: 3 / 2; height: auto; max-height: 60vh; object-fit: cover; border-radius: 6px; box-shadow: 0 2px 8px rgba(60, 40, 20, 0.3); display: block; }
  .bild-im-text img.hochkant { aspect-ratio: 832 / 1216; width: auto; max-width: 100%; margin: 0 auto; object-fit: contain; box-shadow: none; max-height: 50vh; }

  .wahlen { display: flex; flex-direction: column; gap: 10px; margin-top: 8px; }
  .wahl-text { flex: 1; min-width: 0; }
  .vorteil { display: inline-block; margin-right: 6px; padding: 1px 8px; border-radius: 4px; background: var(--gold); color: #1E2A20; font-family: var(--schrift-ui); font-size: 14px; font-weight: 700; vertical-align: 2px; }
  .abzeichen.zauber { color: #2C5A7A; border-color: #9DB7C6; background: #EEF3F2; }
  .platz { height: 70vh; flex-shrink: 0; }

  .ende { display: flex; flex-direction: column; align-items: center; gap: 12px; margin: 20px 0; text-align: center; }
  .ende-zier { color: var(--gold); letter-spacing: 0.4em; }

  .ecke { position: absolute; right: 22px; bottom: 20px; display: flex; flex-direction: column; align-items: flex-end; gap: 10px; pointer-events: none; }
  .zettel { max-width: 290px; padding: 10px 14px; border-radius: 10px; background: var(--papier-hell); box-shadow: 0 4px 12px rgba(40, 22, 8, 0.3); display: flex; flex-direction: column; gap: 4px; pointer-events: none; opacity: 0; transform: translateY(8px); transition: opacity 900ms ease, transform 900ms ease; }
  .zettel.an { opacity: 1; transform: none; }
  .zettel-titel { font-family: var(--schrift-titel); font-size: 12px; font-weight: 700; letter-spacing: 0.12em; color: var(--tinte-blass); }
  .zettel-zeile { font-family: var(--schrift-hand); font-size: 17px; line-height: 1.3; }
  .zu { pointer-events: auto; position: relative; width: 132px; height: 100px; border: none; background: transparent; padding: 0; }
  .zu > span { position: absolute; display: block; }
  .deckel { left: 0; top: 0; width: 120px; height: 90px; border-radius: 6px 10px 10px 6px; background: #4A2C1A; box-shadow: 0 6px 14px rgba(0, 0, 0, 0.45), inset 0 0 0 2px #3A2213, inset 8px 0 0 #3A2213; }
  .naht { left: 14px; top: 8px; width: 98px; height: 74px; border: 1.5px dashed #A98450; border-radius: 4px; }
  .ecke-o { right: 12px; top: 0; width: 12px; height: 12px; background: var(--gold); clip-path: polygon(0 0, 100% 0, 100% 100%); }
  .ecke-u { right: 12px; bottom: 10px; width: 12px; height: 12px; background: var(--gold); clip-path: polygon(100% 0, 100% 100%, 0 100%); }
  .baendchen { left: 70px; top: 82px; width: 14px; height: 18px; background: var(--rot); clip-path: polygon(0 0, 100% 0, 100% 100%, 50% 75%, 0 100%); }
  .aufschrift { left: 14px; top: 34px; width: 98px; text-align: center; font-family: var(--schrift-titel); font-size: 14px; font-weight: 900; letter-spacing: 0.06em; color: var(--gold-hell); }
  .siegel { right: 2px; top: -10px; width: 30px; height: 30px; border-radius: 50%; background: var(--rot); box-shadow: 0 0 0 2px var(--rot-dunkel), 0 2px 4px rgba(0, 0, 0, 0.35); color: var(--rot-papier); font-family: var(--schrift-ui); font-size: 15px; font-weight: 700; display: flex !important; align-items: center; justify-content: center; }

  .ueberlagerung { position: fixed; inset: 0; background: rgba(20, 12, 6, 0.7); display: grid; place-items: center; padding: 16px; z-index: 10; }
  .offenes-buch { position: relative; width: min(560px, 100%); padding: 56px 28px 28px; border-radius: 8px; box-shadow: 0 14px 34px rgba(0, 0, 0, 0.6); font-family: var(--schrift-text); font-size: 19px; line-height: 1.5; }
  .offenes-buch h2 { margin: 0 0 8px; font-family: var(--schrift-titel); color: #5A2A1C; }
  .offenes-buch .klein { font-size: 15px; color: var(--tinte-weich); }
  .lesebaendchen { position: absolute; top: 0; right: 28px; min-height: 48px; padding: 6px 14px 14px; border: none; background: var(--rot); color: var(--rot-papier); font-family: var(--schrift-ui); font-size: 15px; font-weight: 700; clip-path: polygon(0 0, 100% 0, 100% 100%, 50% 82%, 0 100%); }

  /* Handy und Tablet hochkant: Bilder im Text, kein Rand um das Buch */
  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .tisch { padding: 0; }
    .buch { border-radius: 0; }
    .bildseite { display: none; }
    .bild-im-text { display: block; }
    .textseite { padding: max(10px, env(safe-area-inset-top)) 18px 0 18px; }
    .fluss { font-size: 19px; max-width: none; margin: 0 auto; }
    .ecke { right: 12px; bottom: max(12px, env(safe-area-inset-bottom)); }
    .zu { transform: scale(0.75); transform-origin: bottom right; }
    .zettel { max-width: 240px; }
  }
  @media (orientation: portrait) and (min-width: 600px) and (max-width: 1100px) {
    .textseite { padding-left: 40px; padding-right: 40px; }
    .fluss { font-size: 21px; max-width: 40em; }
  }
</style>
