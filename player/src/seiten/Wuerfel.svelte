<script lang="ts">
  // Würfelprobe (story-konventionen.md, Abschnitt 4): Ink hat schon gewürfelt,
  // hier rollen nur zwei Würfel auf die gewürfelten Augen aus.
  import { onMount } from 'svelte';
  import { teileAugen, type Probe } from '../lib/text';

  let { probe, salz, tipp, fertig, onfertig }: {
    probe: Probe; salz: number; tipp: boolean; fertig: boolean; onfertig: () => void;
  } = $props();

  const ziel = teileAugen(probe.augen, salz);
  let w = $state<[number, number]>(fertig ? ziel : [1, 1]);
  let rollt = $state(!fertig);
  let schritt = $state(0);

  const AUGEN: Record<number, [number, number][]> = {
    1: [[37, 37]],
    2: [[22, 22], [52, 52]],
    3: [[20, 20], [37, 37], [54, 54]],
    4: [[22, 22], [52, 22], [22, 52], [52, 52]],
    5: [[20, 20], [54, 20], [37, 37], [20, 54], [54, 54]],
    6: [[22, 18], [52, 18], [22, 37], [52, 37], [22, 56], [52, 56]]
  };
  const FARBE = { erfolg: 'var(--gruen)', jaaber: 'var(--bernstein)', miss: 'var(--rot)' };

  onMount(() => {
    if (fertig) return;
    const z = () => 1 + Math.floor(Math.random() * 6);
    const ruhig = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
    let n = ruhig ? 99 : 0;
    w = [z(), z()];
    const timer = setInterval(() => {
      n += 1;
      schritt = n;
      if (n < 11) { w = [z(), z()]; return; }
      clearInterval(timer);
      w = ziel;
      rollt = false;
      onfertig();
    }, 90);
    return () => clearInterval(timer);
  });

  const wertZahl = $derived(probe.bonus >= 0 ? `+${probe.bonus}` : String(probe.bonus));
</script>

<div class="probe" role="status" aria-live="polite">
  <div class="wuerfel" aria-hidden="true">
    {#each w as zahl, i (i)}
      <svg width="74" height="74" viewBox="0 0 74 74" style="transform: rotate({rollt ? (i ? -1 : 1) * (zahl * 13 - 40 + schritt * 7) : i ? 4 : -3}deg)">
        <rect x="3" y="3" width="68" height="68" rx="14" fill="#FBF6EA" stroke="#3B2A1A" stroke-width="3" />
        {#each AUGEN[zahl] as [x, y], k (k)}
          <circle cx={x} cy={y} r="6.5" fill="#2A2018" />
        {/each}
      </svg>
    {/each}
  </div>
  {#if rollt}
    <span class="rollen">Die Würfel rollen …</span>
  {:else}
    <span class="rechnung">Würfel <strong>{probe.augen}</strong> + {probe.wert} <strong>{wertZahl}</strong> = <strong>{probe.gesamt}</strong></span>
    <span class="ergebnis" style="background: {FARBE[probe.art]}">{probe.ergebnis}</span>
  {/if}
</div>
{#if tipp && !rollt}
  <aside class="tipp" aria-label="Tickworts Tipp">
    <svg width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="#6B4E2E" stroke-width="1.6" aria-hidden="true"><circle cx="12" cy="13" r="7" /><circle cx="12" cy="13" r="2.5" /><path d="M12 6V3M10 3h4M19 13h2M3 13h2" /></svg>
    <span>Tickwort sagt: Zehn oder mehr – es klappt. Sieben bis neun – es klappt, aber … Sechs oder weniger – es klappt nicht. Aber die Welt geht davon nicht unter. Meistens.</span>
  </aside>
{/if}

<style>
  .probe { display: flex; flex-direction: column; align-items: center; gap: 10px; padding: 16px 12px 14px; border-radius: 12px; background: #E9DCBC; box-shadow: inset 0 0 18px rgba(110, 66, 18, 0.25); }
  .wuerfel { display: flex; gap: 18px; }
  .wuerfel svg { display: block; transition: transform 90ms; }
  .rollen { font-family: var(--schrift-hand); font-size: 20px; color: var(--tinte-weich); }
  .rechnung { font-family: var(--schrift-ui); font-size: 18px; color: #3B2A1A; text-align: center; }
  .ergebnis { padding: 4px 18px; border-radius: 999px; font-family: var(--schrift-titel); font-size: 20px; font-weight: 900; color: var(--papier-hell); animation: auf 300ms ease-out; }
  @keyframes auf { from { transform: scale(0.6); opacity: 0; } }
  .tipp { display: flex; gap: 12px; align-items: flex-start; padding: 10px 12px; border: 1px dashed #B39766; border-radius: 8px; background: rgba(255, 255, 255, 0.35); font-family: var(--schrift-hand); font-size: 17px; line-height: 1.4; color: #4E3D28; }
  .tipp svg { flex-shrink: 0; }
</style>
