// =====================================================================
// Perle 2 – Der Schmiedelehrling (Erweiterung 14.10.2026)
// =====================================================================

=== p2_lehrling
Auf dem Rückweg führt dich die Gasse am Färberturm vorbei. Er steht noch, schwarz und schief, und es riecht nach nassem Holz und verbrannter Wolle. Ein paar Leute stehen davor und reden leise.

„… ein Kind, sage ich dir. Hat das Feuer einfach weggemacht.“

„Die Waage sucht schon. Die haben den ganzen Nachmittag Fragen gestellt.“

# bild: szene/lehrling-ole
Du ziehst den Kopf ein und gehst schneller. Da tritt dir jemand in den Weg. Ein Junge, vielleicht fünfzehn, mit Ruß im Gesicht und einer verbundenen Hand. Der Schmiedelehrling. Der mit dem Kohlenkarren.

„Du warst das“, sagt er leise. „Ich hab dich gesehen. Ich …“ Er schluckt. „Das Rad ist gebrochen. Ich hab's nicht gemerkt. Wenn du nicht gewesen wärst …“ Er kann nicht weiterreden.
* [„Es war nicht deine Schuld. Räder brechen eben.“]
    ~ lehrling_schweigt = true
    Der Junge sieht dich an, als hättest du ihm einen Sack Steine von den Schultern genommen. „Ich heiße Ole“, sagt er. „Und ich hab dich nie gesehen. Wenn die Waage fragt. Nie.“
* [„Sag niemandem, dass ich es war. Bitte.“]
    ~ lehrling_schweigt = true
    „Bestimmt nicht“, sagt der Junge schnell. „Ich bin Ole. Die Waage hat mich schon gefragt. Ich hab gesagt, es war ein großer Mann mit Bart.“ Er grinst schief. „Einen Bart hattest du nicht.“
* [Einfach weitergehen. Je weniger Leute dich sehen, desto besser.]
    ~ von_waage_notiert = true
    Du gehst an ihm vorbei, ohne etwas zu sagen. Als du dich an der Ecke umdrehst, steht er noch da und sieht dir nach. Ein Söldner der Waage spricht ihn an, und er zeigt in deine Richtung. Du rennst.
-
{ lehrling_schweigt:
    Bevor du gehst, drückt Ole dir etwas in die Hand. Ein kleines, glattes Stück Eisen, ein Hufnagel, krumm geschlagen zu einem Ring. „Das macht man bei uns so“, sagt er verlegen. „Wenn einer einem anderen was schuldet. Damit man's nicht vergisst.“
}
->->
