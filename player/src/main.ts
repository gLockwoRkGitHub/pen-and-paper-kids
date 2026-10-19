import { mount } from 'svelte';
import './stil.css';
import App from './App.svelte';

mount(App, { target: document.getElementById('app')! });

// Offline spielbar (nur bei https oder localhost möglich, im Heim-WLAN über http nicht)
if ('serviceWorker' in navigator && window.isSecureContext && import.meta.env.PROD) {
  navigator.serviceWorker.register('./sw.js').catch(() => { /* ohne Offline weiterspielen */ });
}
