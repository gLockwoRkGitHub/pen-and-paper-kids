<script lang="ts">
  // Das aufgeschlagene Tagebuch (story-konventionen.md 7b): Laschen Ich, Erlebtes, Karte, Taschen, Menschen.
  // Zurück zur Geschichte geht es über das Lesebändchen.
  import { fade } from 'svelte/transition';
  import type { Spiel, Lasche } from '../lib/spiel.svelte';
  import Ich from './buch/Ich.svelte';
  import Erlebtes from './buch/Erlebtes.svelte';
  import Karte from './buch/Karte.svelte';
  import Taschen from './buch/Taschen.svelte';
  import Menschen from './buch/Menschen.svelte';

  let { spiel, schliessen }: { spiel: Spiel; schliessen: () => void } = $props();

  // Beim Öffnen die Lasche mit Neuem zeigen, sonst „Ich“
  let lasche = $state<Lasche>(spiel.buch.neuIn[0] ?? 'ich');
  let eintragZiel = $state<number | null>(null);
  let ortZiel = $state<string | null>(null);

  $effect(() => {
    spiel.lascheGesehen(lasche);
  });

  function geheZu(l: Lasche, opt: { eintrag?: number; ort?: string } = {}) {
    eintragZiel = opt.eintrag ?? null;
    ortZiel = opt.ort ?? null;
    lasche = l;
  }

  const LASCHEN: { id: Lasche; name: string; farbe: string; icon: string }[] = [
    { id: 'ich', name: 'Ich', farbe: '#8E2F23', icon: '<path d="M12 3l7 3v5c0 5-3 8-7 10-4-2-7-5-7-10V6z"/><path d="M12 8v8M9 11h6"/>' },
    { id: 'erlebtes', name: 'Erlebtes', farbe: '#2F5A3A', icon: '<path d="M20 4c-6 0-11 4-13 11l-2 5"/><path d="M20 4c0 6-4 11-11 12"/><path d="M9 11l5-2"/>' },
    { id: 'karte', name: 'Karte', farbe: '#284B66', icon: '<path d="M3 6l6-2 6 2 6-2v14l-6 2-6-2-6 2z"/><path d="M9 4v14M15 6v14"/>' },
    { id: 'taschen', name: 'Taschen', farbe: '#6B4E2E', icon: '<path d="M6 8h12l-1 12H7z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/><path d="M10 13h4"/>' },
    { id: 'menschen', name: 'Menschen', farbe: '#5A3A5A', icon: '<circle cx="9" cy="8" r="3"/><path d="M3 20c0-3.5 2.7-6 6-6s6 2.5 6 6"/><circle cx="17" cy="9" r="2.5"/><path d="M15.5 14.2c3 .3 5.5 2.5 5.5 5.8"/>' }
  ];

  function taste(e: KeyboardEvent) {
    if (e.key === 'Escape') schliessen();
  }
</script>

<svelte:window onkeydown={taste} />

<div class="tisch" role="dialog" aria-modal="true" aria-label="Tagebuch" transition:fade={{ duration: 180 }}>
  <div class="huelle">
    <span class="naht" aria-hidden="true"></span>
    {#each ['lo', 'ro', 'lu', 'ru'] as ecke (ecke)}
      <svg class="ecke {ecke}" width="58" height="58" viewBox="0 0 58 58" aria-hidden="true"><path d="M2 2h44c0 8-6 10-14 10H12v20c0 8-2 14-10 14z" fill="#B8923F" stroke="#7A5A22" stroke-width="2" /><circle cx="12" cy="12" r="3.5" fill="#7A5A22" /></svg>
    {/each}

    <nav class="laschen" aria-label="Buch">
      <button type="button" class="baendchen" onclick={schliessen} aria-label="Zurück zur Geschichte">
        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="#F6DFC0" stroke-width="1.8" stroke-linejoin="round" aria-hidden="true"><path d="M12 6c-2-1.5-5-2-8-2v14c3 0 6 .5 8 2 2-1.5 5-2 8-2V4c-3 0-6 .5-8 2z" /><path d="M12 6v14" /></svg>
        <span>Geschichte</span>
      </button>
      {#each LASCHEN as l (l.id)}
        <button type="button" class="lasche" class:aktiv={lasche === l.id} aria-current={lasche === l.id ? 'page' : undefined} onclick={() => geheZu(l.id)}>
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke={l.farbe} stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">{@html l.icon}</svg>
          <span>{l.name}</span>
          {#if spiel.buch.neuIn.includes(l.id) && lasche !== l.id}<span class="punkt" aria-label="neu"></span>{/if}
        </button>
      {/each}
    </nav>

    <div class="inhalt">
      {#if lasche === 'ich'}
        <Ich {spiel} />
      {:else if lasche === 'erlebtes'}
        <Erlebtes {spiel} start={eintragZiel} zurKarte={(ort) => geheZu('karte', { ort })} />
      {:else if lasche === 'karte'}
        <Karte {spiel} start={ortZiel} oeffneEintrag={(i) => geheZu('erlebtes', { eintrag: i })} />
      {:else if lasche === 'taschen'}
        <Taschen {spiel} />
      {:else}
        <Menschen {spiel} />
      {/if}
    </div>
    <svg class="eselsohr" width="46" height="46" viewBox="0 0 46 46" aria-hidden="true"><path d="M0 0H46L0 46Z" fill="#D2BD8F" stroke="#9C8456" stroke-width="1" /><path d="M46 0L0 46" stroke="rgba(60,35,12,0.35)" stroke-width="2" /></svg>
  </div>
</div>

<style>
  .tisch { position: fixed; inset: 0; z-index: 20; background: var(--tisch); display: flex; align-items: center; justify-content: center; padding: 18px 136px 18px 18px; }
  .huelle {
    position: relative;
    width: min(1240px, 100%);
    height: min(900px, 100%);
    display: flex;
    padding: 16px;
    border-radius: 14px;
    background: #4A2C1A;
    box-shadow: 0 14px 34px rgba(0, 0, 0, 0.6), inset 0 0 0 3px #3A2213, inset 0 0 40px rgba(0, 0, 0, 0.35);
  }
  .naht { position: absolute; inset: 7px; border: 2px dashed #A98450; border-radius: 10px; pointer-events: none; }
  .ecke { position: absolute; z-index: 3; pointer-events: none; }
  .ecke.lo { top: 2px; left: 2px; }
  .ecke.ro { top: 2px; right: 2px; transform: scaleX(-1); }
  .ecke.lu { bottom: 2px; left: 2px; transform: scaleY(-1); }
  .ecke.ru { bottom: 2px; right: 2px; transform: scale(-1, -1); }
  .eselsohr { position: absolute; right: 16px; bottom: 16px; z-index: 2; pointer-events: none; }
  .inhalt { position: relative; z-index: 1; flex: 1; min-width: 0; display: flex; }

  /* Laschen am rechten Rand (Tablet quer) */
  .laschen { position: absolute; top: 34px; left: calc(100% - 18px); z-index: 0; display: flex; flex-direction: column; gap: 8px; }
  .baendchen {
    width: 128px; min-height: 52px; margin: 0 0 6px -8px; padding: 0 26px 0 22px;
    display: flex; align-items: center; gap: 8px; border: none;
    background: var(--rot); color: var(--rot-papier);
    font-family: var(--schrift-titel); font-size: 13px; font-weight: 900; letter-spacing: 0.03em;
    clip-path: polygon(0 0, 100% 0, calc(100% - 14px) 50%, 100% 100%, 0 100%);
    box-shadow: inset 0 0 12px rgba(0, 0, 0, 0.35);
    background-image: repeating-linear-gradient(90deg, rgba(255, 255, 255, 0.05) 0 2px, transparent 2px 5px);
  }
  .lasche {
    position: relative; width: 112px; min-height: 76px; padding: 6px 10px 6px 18px;
    display: flex; flex-direction: column; align-items: center; justify-content: center; gap: 3px;
    border: none; border-radius: 0 14px 14px 0; background: #C9AF80; color: #3A2A1A;
    font-family: var(--schrift-titel); font-size: 13px; font-weight: 700; letter-spacing: 0.03em;
    box-shadow: inset 8px 0 10px -6px rgba(50, 30, 10, 0.55), 3px 3px 6px rgba(0, 0, 0, 0.45), inset 0 0 14px rgba(110, 70, 20, 0.35);
  }
  .lasche:nth-of-type(odd) { background: #CFB687; }
  .lasche.aktiv {
    width: 146px; min-height: 80px; margin-left: -20px; padding-left: 34px;
    border-radius: 0 16px 16px 0; background: #DCC596; color: #2E2016; font-weight: 900; font-size: 14px;
    box-shadow: 2px 3px 5px rgba(0, 0, 0, 0.4), inset 0 0 18px rgba(110, 66, 18, 0.45), inset 0 -6px 10px -6px rgba(95, 55, 15, 0.4);
  }
  .punkt { position: absolute; top: 8px; right: 10px; width: 12px; height: 12px; border-radius: 50%; background: var(--rot); box-shadow: 0 0 0 2px var(--rot-dunkel); }

  /* Handy und Tablet hochkant: eine Seite, Laschen unten */
  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .tisch { padding: 0; align-items: stretch; }
    .huelle { width: 100%; height: 100%; border-radius: 0; padding: 8px 8px calc(78px + env(safe-area-inset-bottom)); }
    .naht, .ecke, .eselsohr { display: none; }
    .inhalt { display: flex; flex-direction: column; overflow-y: auto; overscroll-behavior: contain; -webkit-overflow-scrolling: touch; }
    .laschen {
      position: fixed; left: 0; right: 0; top: auto; bottom: 0; z-index: 5;
      flex-direction: row; gap: 4px; padding: 6px 6px calc(6px + env(safe-area-inset-bottom));
      background: #4A2C1A; box-shadow: 0 -4px 10px rgba(0, 0, 0, 0.35);
    }
    .baendchen { width: auto; min-height: 60px; margin: 0; padding: 0 16px 0 10px; clip-path: polygon(0 0, 100% 0, 100% 100%, 0 100%); border-radius: 8px; flex-direction: column; justify-content: center; gap: 2px; font-size: 11px; }
    .lasche, .lasche.aktiv { flex: 1; width: auto; min-width: 0; min-height: 60px; margin: 0; padding: 4px 2px; border-radius: 8px; font-family: var(--schrift-ui); font-size: 12px; font-weight: 700; letter-spacing: 0; }
    .baendchen { font-family: var(--schrift-ui); font-size: 12px; letter-spacing: 0; }
    .lasche.aktiv { box-shadow: inset 0 0 0 2px #8E2F23, inset 0 0 14px rgba(110, 66, 18, 0.35); }
    .lasche span:not(.punkt), .baendchen span { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; max-width: 100%; }
    .punkt { top: 4px; right: 6px; }
  }
</style>
