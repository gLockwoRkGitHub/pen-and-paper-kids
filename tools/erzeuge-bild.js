// Erzeugt Bilder über den lokalen ComfyUI-Server von Krita AI Diffusion (FLUX.2 klein 4B oder SDXL).
// Aufruf: node tools/erzeuge-bild.js <prompt.txt> <zielordner/name> [--seed 1] [--anzahl 4]
//           [--breite 1536] [--hoehe 1024] [--schritte n] [--modell flux2|sdxl] [--referenz bild.jpg[,bild2.png,…]]
// Mehrere Referenzen (nur FLUX.2) mit Komma trennen, z. B. Figur + Ortsbild. Reihenfolge = Wichtigkeit.
// Beispiel: node tools/erzeuge-bild.js docs/art/figuren/tickwort.prompt.txt docs/art/figuren/tickwort --anzahl 4
// Ergebnis: <zielordner/name>-s<seed>.png je Seed. Server-Adresse über COMFYUI_URL änderbar.
const fs = require('fs');
const path = require('path');

const server = process.env.COMFYUI_URL || 'http://127.0.0.1:8188';
const [promptDatei, ziel, ...rest] = process.argv.slice(2);
if (!promptDatei || !ziel) {
  console.error('Aufruf: node tools/erzeuge-bild.js <prompt.txt> <zielordner/name> [--seed n] [--anzahl n] [--breite n] [--hoehe n] [--schritte n] [--referenz bild]');
  process.exit(1);
}
const opt = { seed: 1, anzahl: 1, breite: 1536, hoehe: 1024, schritte: null, referenz: null, modell: 'flux2' };
for (let i = 0; i < rest.length; i += 2) {
  const k = rest[i].replace(/^--/, '');
  if (!(k in opt)) { console.error('Unbekannte Option: ' + rest[i]); process.exit(1); }
  opt[k] = k === 'referenz' || k === 'modell' ? rest[i + 1] : parseInt(rest[i + 1], 10);
}
if (!['flux2', 'sdxl'].includes(opt.modell)) { console.error('--modell muss flux2 oder sdxl sein.'); process.exit(1); }
if (opt.modell === 'sdxl' && opt.referenz) { console.error('--referenz geht bisher nur mit --modell flux2.'); process.exit(1); }
if (!opt.schritte) opt.schritte = opt.modell === 'sdxl' ? 28 : 4;
// SDXL braucht einen Negativ-Prompt; FLUX.2 klein arbeitet ohne.
const negativ = 'text, letters, numbers, watermark, signature, photo, 3d render, blurry, deformed';
// Zeilen, die mit # beginnen, sind Kommentare in der Prompt-Datei.
const prompt = fs.readFileSync(promptDatei, 'utf8').split(/\r?\n/)
  .filter((z) => !z.startsWith('#')).join(' ').replace(/\s+/g, ' ').trim();

async function json(url, init) {
  const r = await fetch(server + url, init);
  if (!r.ok) throw new Error(`${url}: ${r.status} ${await r.text()}`);
  return r.json();
}

async function ladeReferenzHoch(datei) {
  const form = new FormData();
  form.append('image', new Blob([fs.readFileSync(datei)]), path.basename(datei));
  form.append('overwrite', 'true');
  return (await json('/upload/image', { method: 'POST', body: form })).name;
}

// Sucht das installierte SDXL-Modell (ZavyChroma bevorzugt), damit kein Dateiname fest im Skript steht.
async function sdxlModell() {
  const info = await json('/object_info/CheckpointLoaderSimple');
  const liste = info.CheckpointLoaderSimple.input.required.ckpt_name[0];
  const namen = Array.isArray(liste) ? liste : info.CheckpointLoaderSimple.input.required.ckpt_name[1].options;
  if (!namen || !namen.length) throw new Error('Kein SDXL-Modell installiert (Krita ▸ Configure ▸ Workloads).');
  return namen.find((n) => /zavy/i.test(n)) || namen[0];
}

function workflowSdxl(seed, ckpt) {
  return {
    modell: { class_type: 'CheckpointLoaderSimple', inputs: { ckpt_name: ckpt } },
    text: { class_type: 'CLIPTextEncode', inputs: { clip: ['modell', 1], text: prompt } },
    negativ: { class_type: 'CLIPTextEncode', inputs: { clip: ['modell', 1], text: negativ } },
    latent: { class_type: 'EmptyLatentImage', inputs: { width: opt.breite, height: opt.hoehe, batch_size: 1 } },
    sample: { class_type: 'KSampler', inputs: { model: ['modell', 0], positive: ['text', 0], negative: ['negativ', 0], latent_image: ['latent', 0], seed, steps: opt.schritte, cfg: 6, sampler_name: 'dpmpp_2m', scheduler: 'karras', denoise: 1 } },
    bild: { class_type: 'VAEDecode', inputs: { samples: ['sample', 0], vae: ['modell', 2] } },
    speichern: { class_type: 'SaveImage', inputs: { images: ['bild', 0], filename_prefix: 'pen-and-paper-kids/' + path.basename(ziel) } },
  };
}

function workflow(seed, referenzName, ckpt) {
  if (opt.modell === 'sdxl') return workflowSdxl(seed, ckpt);
  const w = {
    modell: { class_type: 'UNETLoader', inputs: { unet_name: 'flux-2-klein-4b-fp8.safetensors', weight_dtype: 'default' } },
    clip: { class_type: 'CLIPLoaderGGUF', inputs: { clip_name: 'Qwen3-4B-Q4_K_M.gguf', type: 'flux2' } },
    vae: { class_type: 'VAELoader', inputs: { vae_name: 'flux2-vae.safetensors' } },
    text: { class_type: 'CLIPTextEncode', inputs: { clip: ['clip', 0], text: prompt } },
    guider: { class_type: 'BasicGuider', inputs: { model: ['modell', 0], conditioning: ['text', 0] } },
    rauschen: { class_type: 'RandomNoise', inputs: { noise_seed: seed } },
    sampler: { class_type: 'KSamplerSelect', inputs: { sampler_name: 'euler' } },
    sigmas: { class_type: 'Flux2Scheduler', inputs: { steps: opt.schritte, width: opt.breite, height: opt.hoehe } },
    latent: { class_type: 'EmptyFlux2LatentImage', inputs: { width: opt.breite, height: opt.hoehe, batch_size: 1 } },
    sample: { class_type: 'SamplerCustomAdvanced', inputs: { noise: ['rauschen', 0], guider: ['guider', 0], sampler: ['sampler', 0], sigmas: ['sigmas', 0], latent_image: ['latent', 0] } },
    bild: { class_type: 'VAEDecode', inputs: { samples: ['sample', 0], vae: ['vae', 0] } },
    speichern: { class_type: 'SaveImage', inputs: { images: ['bild', 0], filename_prefix: 'pen-and-paper-kids/' + path.basename(ziel) } },
  };
  // Jede Referenz wird verkleinert, kodiert und als ReferenceLatent an die Bedingung gehängt (Kette).
  let bedingung = ['text', 0];
  (referenzName || []).forEach((name, i) => {
    w['refBild' + i] = { class_type: 'LoadImage', inputs: { image: name } };
    w['refKlein' + i] = { class_type: 'ImageScaleToTotalPixels', inputs: { image: ['refBild' + i, 0], upscale_method: 'lanczos', megapixels: 1, resolution_steps: 16 } };
    w['refLatent' + i] = { class_type: 'VAEEncode', inputs: { pixels: ['refKlein' + i, 0], vae: ['vae', 0] } };
    w['refText' + i] = { class_type: 'ReferenceLatent', inputs: { conditioning: bedingung, latent: ['refLatent' + i, 0] } };
    bedingung = ['refText' + i, 0];
  });
  w.guider.inputs.conditioning = bedingung;
  return w;
}

async function erzeuge(seed, referenzName, ckpt) {
  const { prompt_id } = await json('/prompt', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ prompt: workflow(seed, referenzName, ckpt) }),
  });
  for (;;) {
    await new Promise((r) => setTimeout(r, 1000));
    const eintrag = (await json('/history/' + prompt_id))[prompt_id];
    if (!eintrag) continue;
    if (eintrag.status && eintrag.status.status_str === 'error') {
      throw new Error('ComfyUI meldet einen Fehler: ' + JSON.stringify(eintrag.status.messages.slice(-1)));
    }
    const b = eintrag.outputs.speichern.images[0];
    const r = await fetch(`${server}/view?${new URLSearchParams({ filename: b.filename, subfolder: b.subfolder, type: b.type })}`);
    const datei = `${ziel}-s${seed}.png`;
    fs.mkdirSync(path.dirname(datei), { recursive: true });
    fs.writeFileSync(datei, Buffer.from(await r.arrayBuffer()));
    return datei;
  }
}

(async () => {
  const referenzName = [];
  for (const datei of opt.referenz ? opt.referenz.split(',').map((d) => d.trim()).filter(Boolean) : []) {
    referenzName.push(await ladeReferenzHoch(datei));
  }
  const ckpt = opt.modell === 'sdxl' ? await sdxlModell() : null;
  if (ckpt) console.log('SDXL-Modell: ' + ckpt);
  for (let s = opt.seed; s < opt.seed + opt.anzahl; s++) {
    const start = Date.now();
    const datei = await erzeuge(s, referenzName, ckpt);
    console.log(`${datei}  (${((Date.now() - start) / 1000).toFixed(1)} s)`);
  }
})().catch((e) => { console.error(e.message); process.exit(1); });
