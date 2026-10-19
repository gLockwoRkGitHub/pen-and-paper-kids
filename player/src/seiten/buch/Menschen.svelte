<script lang="ts">
  // Lasche „Menschen“ (Design-Entwurf „Menschen“): wen ich kenne – nie, wie gut wir uns verstehen.
  import type { Spiel } from '../../lib/spiel.svelte';
  import Sammlung from './Sammlung.svelte';
  let { spiel }: { spiel: Spiel } = $props();
  const liste = spiel.menschenListe();
</script>

<Sammlung titel="Menschen" unter="Wen ich unterwegs getroffen habe" ordner="menschen" {liste} leer="Noch habe ich niemanden aufgeschrieben." />
