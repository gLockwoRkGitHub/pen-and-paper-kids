<script lang="ts">
  // Charaktererstellung (Design-Entwurf „Erstellung“): links der Steckbrief, rechts die Frage aus charakter.ink.
  import type { Spiel } from '../lib/spiel.svelte';
  import { WERTE, WERT_NAME } from '../lib/text';

  let { spiel }: { spiel: Spiel } = $props();
  let eingabe = $state(spiel.name);

  const WOFUER = {
    kraft: 'Heben, Kämpfen, Durchhalten',
    geschick: 'Schleichen, Klettern, Fingerfertigkeit',
    verstand: 'Rätsel, Wissen, Spuren lesen',
    ausstrahlung: 'Überreden, Einschüchtern, Lügen erkennen'
  };
  const VOLK: Record<string, string> = { mensch: 'Mensch', zwerg: 'Zwerg', gnom: 'Gnom', ork: 'Ork', troll: 'Troll' };
  const HG: Record<string, [string, string]> = {
    reisender: ['Reisender', 'Reisende'],
    schausteller: ['Schausteller', 'Schaustellerin'],
    strassenkind: ['Straßenkind', 'Straßenkind'],
    botenlaeufer: ['Botenläufer', 'Botenläuferin'],
    kartografenlehrling: ['Kartografenlehrling', 'Kartografenlehrling'],
    schiffsjunge: ['Schiffsjunge', 'Schiffsjunge']
  };

  const istName = $derived(!spiel.bereit && spiel.auswahl.length === 0 && spiel.frage === 'Wie heißt du?');
  const geschlecht = $derived(String(spiel.wert('geschlecht') ?? ''));
  const volk = $derived(String(spiel.wert('volk') ?? ''));
  const hg = $derived(String(spiel.wert('hintergrund') ?? ''));
  const werte = $derived(spiel.werte());
  const anzeigeName = $derived(istName ? eingabe : spiel.name);

  const beschreibung = $derived(
    [geschlecht === 'm' ? 'Ein Junge' : geschlecht === 'w' ? 'Ein Mädchen' : '', VOLK[volk] ?? '', HG[hg] ? HG[hg][geschlecht === 'w' ? 1 : 0] : '']
      .filter(Boolean)
      .join(' · ')
  );

  const SCHRITTE = ['Name', 'Wer', 'Volk', 'Herkunft', 'Stärken', 'Bereit'];
  const schritt = $derived(
    istName ? 0 : spiel.bereit ? 5 : !geschlecht ? 1 : !volk ? 2 : !hg ? 3 : 4
  );

  function steine(id: (typeof WERTE)[number]) {
    const v = werte[id];
    const vorher = spiel.neuerWert === id && spiel.werteVorher ? spiel.werteVorher[id] : v;
    return [0, 1, 2].map((i) => (i < vorher ? 'voll' : i < v ? 'neu' : 'leer'));
  }

  function nameWeiter(e?: Event) {
    e?.preventDefault();
    if (eingabe.trim()) spiel.setzeName(eingabe);
  }
</script>

<main class="tisch">
  <div class="buch">
    <section class="seite links pergament" aria-label="Steckbrief">
      <span class="ueber">DIESES ABENTEUER ERLEBT</span>
      <div class="name-zeile"><span class="name">{anzeigeName}</span></div>
      <span class="beschreibung">{beschreibung}</span>

      <div class="werte">
        {#each WERTE as id (id)}
          <div class="wert" class:leuchtet={spiel.neuerWert === id}>
            <div class="wert-name">
              <span class="titel">{WERT_NAME[id]}</span>
              <span class="wofuer">{WOFUER[id]}</span>
            </div>
            <div class="steine" aria-hidden="true">
              {#each steine(id) as art, i (i)}
                <span class="stein {art}"></span>
              {/each}
            </div>
            <span class="zahl" aria-label="{WERT_NAME[id]} {werte[id]}">{werte[id] > 0 ? `+${werte[id]}` : '0'}</span>
          </div>
        {/each}
      </div>
      <p class="fuss">Alle Werte beginnen bei 0. Höchstens 3 sind möglich – wachsen wirst du unterwegs.</p>
    </section>

    <section class="seite rechts pergament" aria-label="Frage">
      <ol class="fortschritt" aria-label="Fortschritt">
        {#each SCHRITTE as s, i (s)}
          <li class:fertig={i < schritt} class:aktuell={i === schritt} aria-current={i === schritt ? 'step' : undefined}>{s}</li>
        {/each}
      </ol>

      <h1>{spiel.frage}</h1>
      {#if spiel.zusatz}<p class="zusatz">{spiel.zusatz}</p>{/if}

      {#if istName}
        <form class="name-form" onsubmit={nameWeiter}>
          <label for="name">Dein Name</label>
          <input id="name" type="text" autocomplete="off" autocapitalize="words" maxlength="16" placeholder="z. B. Kai" bind:value={eingabe} />
          <span class="klein">So nennen dich alle in der Geschichte. Du kannst ihn später nicht mehr ändern.</span>
        </form>
      {:else if spiel.bereit}
        {#if spiel.bonusText}
          <div class="bonus">{spiel.bonusText}</div>
        {/if}
        <p class="bereit-text">
          <span class="breit">Links</span><span class="schmal">Oben</span> steht, wer du bist. Schau es dir noch einmal an. Wenn alles stimmt, beginnt deine letzte Nacht in Lysmara.
        </p>
      {:else}
        <div class="auswahl" role="group" aria-label={spiel.frage}>
          {#each spiel.auswahl as a (a.index)}
            <button type="button" class="wahl" onclick={() => spiel.waehleErstellung(a.index)}>
              <span class="punkt" aria-hidden="true"></span>
              <span class="wahl-text">
                <span class="wahl-titel">{a.titel}</span>
                {#if a.text}<span class="wahl-unter">{a.text}</span>{/if}
              </span>
              {#if a.istWert && a.plus}<span class="abzeichen">{a.plus}</span>{/if}
            </button>
          {/each}
        </div>
      {/if}

      <div class="fusszeile">
        <button type="button" class="knopf-leise" disabled={!spiel.kannZurueck} onclick={() => spiel.zurueck()}>Zurück</button>
        <span class="luecke"></span>
        {#if istName}
          <button type="button" class="knopf" disabled={!eingabe.trim()} onclick={() => nameWeiter()}>Weiter</button>
        {:else if spiel.bereit}
          <button type="button" class="knopf" onclick={() => spiel.beginne()}>Das Abenteuer beginnt</button>
        {/if}
      </div>
    </section>
  </div>
</main>

<style>
  .tisch { min-height: 100%; display: flex; padding: 22px; background: var(--nacht); }
  .buch {
    flex: 1;
    display: flex;
    border-radius: 10px;
    padding: 14px;
    background: var(--einband);
    box-shadow: 0 14px 34px rgba(0, 0, 0, 0.6), inset 0 0 40px rgba(0, 0, 0, 0.4);
    max-width: 1300px;
    margin: 0 auto;
  }
  .seite { flex: 1; min-width: 0; display: flex; flex-direction: column; gap: 14px; }
  .links { padding: 44px 40px 30px 48px; border-radius: 4px 0 0 4px; box-shadow: inset -26px 0 26px -20px rgba(60, 40, 20, 0.4); gap: 18px; }
  .rechts { padding: 30px 40px 26px 36px; border-radius: 0 4px 4px 0; box-shadow: inset 26px 0 26px -20px rgba(60, 40, 20, 0.4); }
  .ueber { font-family: var(--schrift-titel); font-size: 14px; font-weight: 700; letter-spacing: 0.2em; color: var(--tinte-blass); }
  .name-zeile { min-height: 70px; border-bottom: 2px solid var(--linie); display: flex; align-items: flex-end; }
  .name { font-family: var(--schrift-hand); font-size: 54px; font-weight: 700; line-height: 1.1; overflow-wrap: anywhere; }
  .beschreibung { font-family: var(--schrift-text); font-size: 21px; font-style: italic; color: #4E3D28; min-height: 30px; }
  .werte { display: flex; flex-direction: column; margin-top: 6px; }
  .wert { display: flex; align-items: center; gap: 14px; padding: 10px 0; border-bottom: 1px solid #DCCBA6; }
  .wert-name { flex: 1; display: flex; flex-direction: column; }
  .titel { font-family: var(--schrift-titel); font-size: 19px; font-weight: 700; }
  .wofuer { font-size: 14px; color: #6B5A40; }
  .steine { display: flex; gap: 9px; }
  .stein { width: 14px; height: 14px; transform: rotate(45deg); display: block; border: 2px solid #A99366; }
  .stein.voll { background: var(--rot); border-color: var(--rot-dunkel); box-shadow: inset 2px 2px 0 rgba(255, 210, 180, 0.45); }
  .stein.neu { background: #D89A2A; border-color: #8A5410; box-shadow: 0 0 0 3px rgba(240, 200, 110, 0.55); animation: leuchten 1.4s ease-out; }
  @keyframes leuchten { from { box-shadow: 0 0 0 10px rgba(240, 200, 110, 0); transform: rotate(45deg) scale(1.5); } }
  .zahl { width: 44px; text-align: right; font-family: var(--schrift-ui); font-size: 24px; font-weight: 700; }
  .fuss { margin: auto 0 0; font-family: var(--schrift-text); font-size: 16px; font-style: italic; color: #6B5A40; }

  .fortschritt { list-style: none; margin: 0; padding: 0; display: flex; gap: 6px; flex-wrap: wrap; }
  .fortschritt li { padding: 4px 10px; border-radius: 999px; font-family: var(--schrift-titel); font-size: 13px; font-weight: 700; color: #A99366; border: 1px solid #D9C9A6; }
  .fortschritt li.fertig { color: var(--tinte-weich); border-color: var(--linie); background: rgba(201, 182, 142, 0.25); }
  .fortschritt li.aktuell { color: var(--rot-papier); background: var(--rot); border-color: var(--rot-dunkel); }
  h1 { margin: 10px 0 0; font-family: var(--schrift-titel); font-size: 30px; font-weight: 900; line-height: 1.2; color: #5A2A1C; }
  .zusatz { margin: -4px 0 0; font-family: var(--schrift-text); font-size: 18px; color: #4E3D28; }
  .name-form { display: flex; flex-direction: column; gap: 10px; margin-top: 8px; }
  .name-form label { font-size: 16px; font-weight: 700; color: #4E3D28; }
  .name-form input { min-height: 60px; padding: 0 16px; border-radius: 8px; border: 2px solid #9C8456; background: var(--papier-hell); font-family: var(--schrift-hand); font-size: 30px; color: var(--tinte); width: 100%; }
  .klein { font-size: 15px; color: #6B5A40; }
  .auswahl { display: flex; flex-direction: column; gap: 9px; overflow-y: auto; padding: 2px 4px 2px 0; min-height: 0; }
  .auswahl .wahl { min-height: 64px; }
  .wahl-text { flex: 1; min-width: 0; display: flex; flex-direction: column; gap: 1px; }
  .wahl-titel { font-family: var(--schrift-titel); font-size: 19px; font-weight: 700; }
  .wahl-unter { font-family: var(--schrift-text); font-size: 16px; color: var(--tinte-weich); }
  .auswahl .abzeichen { font-size: 17px; font-weight: 700; padding: 4px 12px; }
  .bonus { padding: 16px 18px; border-radius: 10px; background: var(--papier-dunkel); border: 2px dashed var(--gold); font-family: var(--schrift-text); font-size: 20px; line-height: 1.45; }
  .bereit-text { margin: 0; font-family: var(--schrift-text); font-size: 20px; line-height: 1.5; }
  .schmal { display: none; }
  .fusszeile { margin-top: auto; display: flex; align-items: center; gap: 12px; padding-top: 12px; flex-wrap: wrap; }
  .luecke { flex: 1; }

  /* Handy und Tablet hochkant: Steckbrief oben, kompakt */
  @media (max-width: 860px) {
    .tisch { padding: 8px; }
    .buch { flex-direction: column; padding: 8px; }
    .links { padding: 18px 20px 14px; gap: 6px; border-radius: 4px 4px 0 0; box-shadow: inset 0 -20px 20px -18px rgba(60, 40, 20, 0.4); flex: none; }
    .rechts { padding: 18px 20px 20px; border-radius: 0 0 4px 4px; box-shadow: none; }
    .name-zeile { min-height: 44px; }
    .name { font-size: 36px; }
    .beschreibung { font-size: 17px; min-height: 0; }
    .werte { flex-direction: row; flex-wrap: wrap; gap: 4px 14px; margin-top: 4px; }
    .wert { flex: 1 1 40%; gap: 8px; padding: 4px 0; border-bottom: none; }
    .wofuer, .fuss { display: none; }
    .titel { font-size: 15px; }
    .zahl { font-size: 18px; width: 30px; }
    .stein { width: 11px; height: 11px; }
    .steine { gap: 6px; }
    h1 { font-size: 24px; margin-top: 4px; }
    .breit { display: none; }
    .schmal { display: inline; }
    .auswahl { overflow: visible; }
  }
</style>
