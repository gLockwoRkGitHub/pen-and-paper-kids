<script lang="ts">
  import { Spiel } from './lib/spiel.svelte';
  import Start from './seiten/Start.svelte';
  import Erstellung from './seiten/Erstellung.svelte';
  import Geschichte from './seiten/Geschichte.svelte';

  const spiel = new Spiel();
  spiel.ladeVorhanden();

  // Für die automatischen Tests (tools/teste-player.js)
  (window as unknown as { spiel: Spiel }).spiel = spiel;
</script>

{#if spiel.seite === 'start'}
  <Start {spiel} />
{:else if spiel.seite === 'erstellung'}
  <Erstellung {spiel} />
{:else}
  <Geschichte {spiel} />
{/if}
