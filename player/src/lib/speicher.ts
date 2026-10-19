// Ein Spielstand pro Gerät, im Browser (IndexedDB). Siehe docs/story-konventionen.md, Abschnitt 9.
import { get, set, del } from 'idb-keyval';

const SCHLUESSEL = 'spielstand-1';

export async function ladeStand<T>(): Promise<T | null> {
  try {
    return ((await get(SCHLUESSEL)) as T) ?? null;
  } catch {
    // IndexedDB gesperrt (z. B. privates Fenster): ohne Speichern weiterspielen
    return null;
  }
}

export async function speichereStand<T>(stand: T): Promise<boolean> {
  try {
    await set(SCHLUESSEL, stand);
    return true;
  } catch {
    return false;
  }
}

export async function loescheStand(): Promise<void> {
  try { await del(SCHLUESSEL); } catch { /* nichts zu tun */ }
}
