<script lang="ts">
  // Lasche „Taschen“ (Design-Entwurf „Taschen“): Abgegebenes bleibt durchgestrichen stehen.
  import type { Spiel } from '../../lib/spiel.svelte';
  import Sammlung from './Sammlung.svelte';
  let { spiel }: { spiel: Spiel } = $props();
  const liste = spiel.taschenListe().map((t) => ({ ...t, weg: t.status === 2 }));
</script>

<Sammlung titel="Meine Taschen" unter="Was ich bei mir trage" ordner="taschen" {liste} leer="In meinen Taschen ist noch Platz." wegText="Das habe ich nicht mehr." />
