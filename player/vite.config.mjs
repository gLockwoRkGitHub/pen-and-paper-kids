import { defineConfig } from 'vite';
import { svelte } from '@sveltejs/vite-plugin-svelte';
import path from 'node:path';

const hier = import.meta.dirname;

// Der Player liegt in player/, die Story und die Kartendaten im übrigen Repo.
export default defineConfig({
  root: hier,
  base: './',
  plugins: [svelte()],
  server: { host: true, port: 5173, fs: { allow: [path.resolve(hier, '..')] } },
  preview: { host: true, port: 8080 },
  build: { outDir: path.resolve(hier, 'dist'), emptyOutDir: true, chunkSizeWarningLimit: 2000 }
});
