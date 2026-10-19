<script lang="ts">
  // Lasche „Ich“: der Charakterbogen (Design-Entwurf „Main“, abgenommen 13.10.2026).
  // Nie anzeigen: Neigungen, Ruf, Beziehungen (story-konventionen.md, Abschnitt 8).
  import type { Spiel } from '../../lib/spiel.svelte';
  import { WERTE, WERT_NAME, roemisch } from '../../lib/text';
  import { GUT_VOLK, GUT_HINTERGRUND, VOLK_NAME, HINTERGRUND_NAME, GILDE_NAME, WERT_WOFUER, ELEMENT, STUFE_NAME } from '../../lib/texte';

  let { spiel }: { spiel: Spiel } = $props();

  const w = (n: string) => spiel.wert(n);
  const weiblich = $derived(String(w('geschlecht')) === 'w');
  const volk = $derived(String(w('volk')));
  const hg = $derived(String(w('hintergrund')));
  const werte = $derived(spiel.werte());
  const level = $derived(Number(w('level')) || 1);
  const gilde = $derived(String(w('gilde') ?? ''));
  const element = $derived(String(w('element') ?? ''));
  const stufe = $derived(Number(w('elementstufe')) || 0);
  const funken = $derived(Number(w('kraftfunken')) || 0);
  const quelle = $derived(!!w('quelle'));
  const el = $derived(ELEMENT[element]);

  const ICON: Record<string, string> = {
    kraft: '<path d="M13 3l8 8-3 3-8-8z"/><path d="M10 9l-7 7 3 3 7-7"/>',
    geschick: '<path d="M4 20L19 5"/><path d="M13 4h7v7"/><path d="M4 20l1-4M4 20l4-1"/>',
    verstand: '<path d="M2 12s4-7 10-7 10 7 10 7-4 7-10 7S2 12 2 12z"/><circle cx="12" cy="12" r="3"/>',
    ausstrahlung: '<circle cx="12" cy="12" r="4"/><path d="M12 2v3M12 19v3M2 12h3M19 12h3M5 5l2 2M17 17l2 2M5 19l2-2M17 7l2-2"/>'
  };
  const ELEMENT_ICON: Record<string, string> = {
    wasser: '<path d="M26 12c4 6 8 10 8 14.5a8 8 0 0 1-16 0C18 22 22 18 26 12z"/>',
    feuer: '<path d="M26 11c2 5 8 8 8 15a8 8 0 0 1-16 0c0-4 2-6 4-8 0 3 1 5 3 5-1-4 0-8 1-12z"/>',
    erde: '<path d="M14 34l8-14 5 7 4-5 7 12z"/>',
    wind: '<path d="M14 22h16a4 4 0 1 0-4-4M14 28h20a4 4 0 1 1-4 4M14 25h10"/>'
  };
</script>

<div class="doppel">
  <section class="blatt links" aria-label="Wer ich bin">
    <div class="kopf">
      <div class="wer">
        <span class="klein-titel">DIESES BUCH GEHÖRT</span>
        <h1 class="name">{w('name')}</h1>
        <span class="volk">{VOLK_NAME[volk]?.[weiblich ? 1 : 0] ?? ''} · {HINTERGRUND_NAME[hg]?.[weiblich ? 1 : 0] ?? ''}</span>
      </div>
      <div class="siegel" role="img" aria-label="Level {level}">
        <svg width="96" height="96" viewBox="0 0 96 96" aria-hidden="true"><circle cx="48" cy="48" r="40" fill="#8E2F23" stroke="#8E2F23" stroke-width="9" stroke-dasharray="5 4" stroke-linecap="round" /><circle cx="48" cy="48" r="31" fill="none" stroke="#6A1F17" stroke-width="2.5" /></svg>
        <span class="siegel-text" aria-hidden="true"><small>LEVEL</small>{level}</span>
      </div>
    </div>

    <div class="zier" aria-hidden="true"><span></span></div>

    <div class="block">
      <h2>Was ich gut kann</h2>
      {#if GUT_HINTERGRUND[hg]}<p class="hand">{GUT_HINTERGRUND[hg]}</p>{/if}
      {#if GUT_VOLK[volk]}<p class="hand">{GUT_VOLK[volk]}</p>{/if}
    </div>

    {#if gilde && GILDE_NAME[gilde]}
      <div class="gilde">
        <img src="./bilder/taschen/gildenzeichen-{gilde}.webp" alt="" onerror={(e) => ((e.currentTarget as HTMLElement).style.display = 'none')} />
        <div>
          <span class="klein-titel">GILDE</span>
          <span class="gilde-name">{GILDE_NAME[gilde]}</span>
        </div>
      </div>
    {/if}

    <div class="perle klein-titel">{spiel.perle ? `PERLE ${roemisch(spiel.perle)}` : ''}{spiel.kapitel ? ` · ${spiel.kapitel.toUpperCase()}` : ''}</div>
  </section>

  <section class="blatt rechts" aria-label="Werte und Magie">
    <div>
      <h1>Meine Werte</h1>
      <p class="erkl">Bei einer Probe zählt der Wert zu deinen zwei Würfeln dazu.</p>
    </div>
    <div class="werte">
      {#each WERTE as id (id)}
        <div class="wert">
          <span class="rund" aria-hidden="true"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="#5A2A1C" stroke-width="1.8" stroke-linejoin="round" stroke-linecap="round">{@html ICON[id]}</svg></span>
          <div class="wert-name"><span class="titel">{WERT_NAME[id]}</span><span class="wofuer">{WERT_WOFUER[id]}</span></div>
          <div class="steine" aria-hidden="true">
            {#each [0, 1, 2] as i (i)}<span class="stein" class:voll={i < werte[id]}></span>{/each}
          </div>
          <span class="zahl" aria-label="{WERT_NAME[id]} {werte[id]}">{werte[id] > 0 ? `+${werte[id]}` : '0'}</span>
        </div>
      {/each}
    </div>

    {#if element && el}
      <div class="magie" style="--f: {el.farbe}; --h: {el.hell}">
        <div class="magie-kopf">
          <svg width="52" height="52" viewBox="0 0 52 52" aria-hidden="true"><circle cx="26" cy="26" r="24" fill="none" stroke="var(--f)" stroke-width="1.5" stroke-dasharray="2 3" /><circle cx="26" cy="26" r="19" fill="var(--h)" stroke="var(--f)" stroke-width="1.8" /><g fill="var(--f)" stroke="var(--f)" stroke-width="1.6" stroke-linecap="round">{@html ELEMENT_ICON[element] ?? ''}</g></svg>
          <div>
            <span class="magie-name">{el.magie}</span>
            <span class="magie-stufe">Stufe {stufe} von 3{STUFE_NAME[stufe] ? ` – ` : ''}<strong>{STUFE_NAME[stufe]}</strong></span>
          </div>
        </div>
        <div class="zeile">
          <span>Kraftfunken</span>
          <span class="funken" role="img" aria-label="{funken} von {stufe + 1} Kraftfunken">
            {#each Array.from({ length: stufe + 1 }, (_, i) => i) as i (i)}
              <svg width="28" height="28" viewBox="0 0 24 24" fill={i < funken ? 'var(--f)' : 'none'} stroke={i < funken ? 'var(--f)' : '#8FA4AB'} stroke-width="1.3" stroke-linejoin="round" aria-hidden="true"><path d="M12 2l2.2 7.8L22 12l-7.8 2.2L12 22l-2.2-7.8L2 12l7.8-2.2z" /></svg>
            {/each}
          </span>
        </div>
        <div class="zeile">
          <span>Quelle</span>
          <span>{element === 'wind' ? 'Wind braucht keine' : `${el.quelle} · `}{#if element !== 'wind'}<strong>{quelle ? 'gefüllt' : 'leer'}</strong>{/if}</span>
        </div>
        <p class="erkl">Jeder Zauber kostet einen Kraftfunken. Beim Rasten kommen sie zurück.</p>
      </div>
    {:else}
      <p class="leer">Hier ist noch Platz. Vielleicht steht hier eines Tages mehr.</p>
    {/if}
  </section>
</div>

<style>
  .kopf { display: flex; align-items: center; justify-content: space-between; gap: 16px; }
  .wer { display: flex; flex-direction: column; gap: 2px; min-width: 0; }
  .name { font-family: var(--schrift-hand) !important; font-size: 56px !important; font-weight: 700; line-height: 1.05; color: var(--tinte) !important; letter-spacing: 0 !important; overflow-wrap: anywhere; }
  .volk { font-family: var(--schrift-text); font-size: 21px; font-style: italic; color: #4E3D28; }
  .siegel { position: relative; width: 96px; height: 96px; flex-shrink: 0; }
  .siegel-text { position: absolute; inset: 0; display: flex; flex-direction: column; align-items: center; justify-content: center; color: var(--rot-papier); font-family: var(--schrift-ui); font-size: 34px; font-weight: 700; line-height: 1; }
  .siegel-text small { font-family: var(--schrift-titel); font-size: 11px; letter-spacing: 0.14em; }
  .block { display: flex; flex-direction: column; gap: 6px; }
  .block p { margin: 0; }
  .gilde { display: flex; align-items: center; gap: 14px; }
  .gilde img { width: 64px; height: 64px; object-fit: contain; mix-blend-mode: multiply; }
  .gilde div { display: flex; flex-direction: column; gap: 1px; }
  .gilde-name { font-family: var(--schrift-text); font-size: 21px; font-weight: 700; }
  .perle { margin-top: auto; }
  .erkl { margin: 3px 0 0; font-size: 16px; font-style: italic; color: var(--tinte-weich); }
  .werte { display: flex; flex-direction: column; }
  .wert { display: flex; align-items: center; gap: 12px; padding: 10px 0; border-bottom: 1px solid #C7AE7E; }
  .rund { width: 40px; height: 40px; display: flex; align-items: center; justify-content: center; border: 2px solid var(--gold); border-radius: 50%; flex-shrink: 0; }
  .wert-name { flex: 1; min-width: 0; display: flex; flex-direction: column; gap: 1px; }
  .titel { font-family: var(--schrift-titel); font-size: 20px; font-weight: 700; }
  .wofuer { font-size: 15px; color: var(--tinte-weich); }
  .steine { display: flex; gap: 9px; padding-right: 2px; }
  .stein { width: 15px; height: 15px; transform: rotate(45deg); border: 2px solid #9C8456; display: block; }
  .stein.voll { background: var(--rot); border-color: var(--rot-dunkel); box-shadow: inset 2px 2px 0 rgba(255, 210, 180, 0.45); }
  .zahl { width: 46px; text-align: right; font-family: var(--schrift-ui); font-size: 28px; font-weight: 700; }
  .magie { margin-top: 6px; display: flex; flex-direction: column; gap: 10px; padding: 16px 18px 14px; border: 2px solid var(--f); border-radius: 12px; background: #E1DAC0; box-shadow: 0 0 0 4px #EADBB6, 0 0 0 5px var(--h), inset 0 0 20px rgba(110, 66, 18, 0.18); }
  .magie-kopf { display: flex; align-items: center; gap: 14px; }
  .magie-kopf div { display: flex; flex-direction: column; }
  .magie-name { font-family: var(--schrift-titel); font-size: 23px; font-weight: 900; color: var(--f); }
  .magie-stufe { font-size: 16px; color: #33474E; }
  .zeile { display: flex; align-items: center; justify-content: space-between; gap: 12px; font-size: 17px; }
  .funken { display: flex; gap: 8px; }

  @media (max-width: 860px), (orientation: portrait) and (max-width: 1100px) {
    .name { font-size: 42px !important; }
    .siegel { transform: scale(0.85); }
  }
</style>
