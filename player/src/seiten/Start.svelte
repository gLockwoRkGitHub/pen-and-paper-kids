<script lang="ts">
  // Startbildschirm: der Einband des Abenteuerbuchs (Design-Entwurf „Start“).
  import type { Spiel } from '../lib/spiel.svelte';
  import { roemisch } from '../lib/text';

  let { spiel }: { spiel: Spiel } = $props();
  let fragen = $state(false);

  const stand = $derived(spiel.vorhanden);
  const neu = () => {
    if (stand && !stand.ende) fragen = true;
    else spiel.neuesAbenteuer();
  };
</script>

<main class="tisch">
  <div class="einband">
    <div class="rahmen" aria-hidden="true"></div>
    <div class="rahmen innen" aria-hidden="true"></div>

    <span class="ueber">EIN ABENTEUER IN MERIDEL</span>

    <svg class="wappen" role="img" aria-label="Wappen: ein Pfad führt durch eine Schlucht im Gebirge, dahinter geht die Sonne auf" viewBox="0 0 150 150">
      <circle cx="75" cy="75" r="68" fill="none" stroke="#B8923F" stroke-width="2.5" />
      <circle cx="75" cy="75" r="60" fill="none" stroke="#B8923F" stroke-width="1" stroke-dasharray="3 5" />
      <path d="M62 66 A13 13 0 0 1 88 66" fill="#E2C27A" />
      <path d="M75 46 V40 M62 50 L58 45 M88 50 L92 45 M55 60 L49 58 M95 60 L101 58" stroke="#E2C27A" stroke-width="2.5" stroke-linecap="round" />
      <path d="M22 92 L36 70 L46 80 L58 58 L66 70 L68 92 M82 92 L84 70 L92 58 L104 80 L114 70 L128 92" fill="none" stroke="#E2C27A" stroke-width="3.5" stroke-linejoin="round" stroke-linecap="round" />
      <path d="M68 92 C69 80 71 74 75 70 C79 74 81 80 82 92" fill="none" stroke="#B8923F" stroke-width="2" />
      <path d="M75 128 C60 120 88 112 72 104 C64 100 80 96 75 90" fill="none" stroke="#E2C27A" stroke-width="3" stroke-dasharray="5 5" stroke-linecap="round" />
    </svg>

    <h1>{#each spiel.titel.split(' ') as wort, i}{#if i === 2}<br />{/if}{wort}{' '}{/each}</h1>

    {#if stand?.ende}
      <span class="bestanden">Abenteuer bestanden</span>
    {/if}

    {#if spiel.hinweis}
      <p class="hinweis" role="status">{spiel.hinweis}</p>
    {/if}

    <div class="knoepfe">
      {#if fragen}
        <div class="frage" role="alertdialog" aria-label="Neues Abenteuer beginnen?">
          <span class="frage-titel">Ganz von vorn anfangen?</span>
          <span>Dein Abenteuer mit {stand?.name} ist dann weg – auch das Tagebuch.</span>
          <div class="frage-knoepfe">
            <button type="button" class="knopf" onclick={() => { fragen = false; spiel.neuesAbenteuer(); }}>Ja, neu anfangen</button>
            <button type="button" class="knopf-leise" onclick={() => (fragen = false)}>Lieber nicht</button>
          </div>
        </div>
      {:else}
        {#if stand && !stand.ende}
          <button type="button" class="weiter" onclick={() => spiel.weiterlesen()}>
            <span class="weiter-titel">Weiterlesen</span>
            <span class="weiter-info">{stand.name} · Perle {roemisch(stand.perle)}{stand.kapitel ? ` · ${stand.kapitel}` : ''}</span>
          </button>
        {/if}
        <button type="button" class="neu" onclick={neu}>{stand ? 'Neues Abenteuer' : 'Das Abenteuer beginnen'}</button>
        {#if stand?.speicherpunkt && !stand.ende}
          <button type="button" class="leise" onclick={() => spiel.perleNeu()}>Diese Perle von vorn beginnen</button>
        {/if}
      {/if}
    </div>
  </div>
</main>

<style>
  .tisch {
    min-height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: max(16px, env(safe-area-inset-top)) 16px max(16px, env(safe-area-inset-bottom));
    background: var(--nacht);
  }
  .einband {
    position: relative;
    width: min(640px, 100%);
    min-height: min(782px, calc(100dvh - 32px));
    border-radius: 10px 16px 16px 10px;
    background: var(--einband);
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.7), inset 0 0 60px rgba(0, 0, 0, 0.45), inset 18px 0 0 var(--einband-dunkel), inset 20px 0 0 rgba(255, 255, 255, 0.06);
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: clamp(36px, 8vh, 64px) clamp(28px, 9%, 70px) 40px clamp(40px, 12%, 84px);
  }
  .rahmen { position: absolute; inset: 18px 18px 18px 36px; border: 2px solid var(--gold); border-radius: 8px; pointer-events: none; }
  .rahmen.innen { inset: 26px 26px 26px 44px; border: 1px solid rgba(184, 146, 63, 0.55); border-radius: 6px; }
  .ueber { font-family: var(--schrift-titel); font-size: 15px; font-weight: 700; letter-spacing: 0.3em; color: var(--gold); text-align: center; }
  .wappen { width: clamp(110px, 18vh, 150px); height: auto; margin: clamp(18px, 4vh, 34px) 0 clamp(14px, 3vh, 26px); }
  h1 {
    margin: 0;
    font-family: var(--schrift-titel);
    font-size: clamp(44px, 9vw, 62px);
    font-weight: 900;
    line-height: 1.05;
    letter-spacing: 0.04em;
    color: var(--gold-hell);
    text-align: center;
    text-shadow: 0 2px 0 rgba(0, 0, 0, 0.45);
  }
  .bestanden { margin-top: 16px; padding: 6px 16px; border: 2px solid var(--gold); border-radius: 999px; font-family: var(--schrift-titel); font-weight: 700; color: var(--gold-hell); }
  .hinweis { margin: 18px 0 0; padding: 10px 14px; border-radius: 8px; background: rgba(0, 0, 0, 0.25); color: #E8D8B0; font-family: var(--schrift-text); font-size: 17px; text-align: center; }
  .knoepfe { margin-top: auto; padding-top: 28px; width: 100%; display: flex; flex-direction: column; gap: 14px; position: relative; }
  .weiter {
    min-height: 76px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 2px;
    border: none;
    border-radius: 8px;
    background: var(--gold);
    color: #1E2A20;
    box-shadow: inset 0 0 0 2px #7A5A22, inset 0 0 18px rgba(255, 240, 200, 0.35), 0 3px 0 #6E5020;
  }
  .weiter-titel { font-family: var(--schrift-titel); font-size: 22px; font-weight: 900; letter-spacing: 0.06em; }
  .weiter-info { font-size: 15px; font-weight: 700; }
  .neu { min-height: 56px; border-radius: 8px; border: 2px solid var(--gold); background: rgba(0, 0, 0, 0.15); color: var(--gold-hell); font-family: var(--schrift-titel); font-size: 18px; font-weight: 700; letter-spacing: 0.04em; }
  .leise { min-height: 46px; border: none; background: transparent; color: #CDB98A; font-size: 16px; font-weight: 500; text-decoration: underline; text-underline-offset: 4px; }
  .frage { padding: 18px 20px; border-radius: 10px; background: var(--papier); color: var(--tinte); display: flex; flex-direction: column; gap: 12px; font-family: var(--schrift-text); font-size: 18px; line-height: 1.45; }
  .frage-titel { font-family: var(--schrift-titel); font-size: 19px; font-weight: 900; color: #5A2A1C; }
  .frage-knoepfe { display: flex; gap: 10px; flex-wrap: wrap; }
  .frage-knoepfe > * { flex: 1; }
</style>
