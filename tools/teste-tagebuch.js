// Prüft die Tagebuch-Funktionen in story/tagebuch.ink (Taschen und Menschen).
// Spielt 200 zufällige Durchläufe und ruft am Ende jede Funktion für jede ID auf:
// Jeder vorhandene Gegenstand und jeder bekannte Mensch braucht Name und Text, ohne {}-Reste.
// Aufruf: node tools/teste-tagebuch.js [lauf]   – mit Laufnummer werden die Seiten dieses Laufs ausgegeben.
const fs=require('fs'),path=require('path');
const {Compiler,CompilerOptions}=require('inkjs/full');
const {PosixFileHandler}=require('inkjs/compiler/FileHandler/PosixFileHandler');
const dir=path.join(__dirname,'..','story');
const c=new Compiler(fs.readFileSync(dir+'/main.ink','utf8'),new CompilerOptions(dir+'/main.ink',[],false,null,new PosixFileHandler(dir)));
const story=c.Compile();
const fehler=new Set(); const zeig=process.argv[2];
// Die Funktionen müssen „rein“ sein: Der Player ruft sie jederzeit auf, sie dürfen nichts verändern
// und nicht würfeln (docs/story-konventionen.md, Abschnitt 7a).
const quelle=fs.readFileSync(path.join(dir,'tagebuch.ink'),'utf8').split('\n').filter((z)=>!z.trim().startsWith('//'));
quelle.forEach((z,i)=>{
  if(/RANDOM|SEED_RANDOM/.test(z)) fehler.add(`tagebuch.ink Zeile ${i+1}: kein RANDOM in Tagebuch-Funktionen`);
  if(/^\s*~\s*(?!return\b|temp\b)[a-z_]+\s*(=|\+=|-=|\+\+|--)/.test(z)) fehler.add(`tagebuch.ink Zeile ${i+1}: Tagebuch-Funktionen dürfen keine Variablen ändern`);
  if(/^\s*(->|<-)/.test(z) || /^\s*[*+]\s/.test(z)) fehler.add(`tagebuch.ink Zeile ${i+1}: keine Umleitungen oder Entscheidungen in Tagebuch-Funktionen`);
});
let zufall=1;
for(let lauf=0;lauf<200;lauf++){
  story.ResetState(); story.state.storySeed=lauf; story.variablesState['name']='Mika';
  let n=0;
  while(true){ while(story.canContinue) story.Continue(); if(!story.currentChoices.length) break; zufall=(zufall*16807+lauf)%2147483647; story.ChooseChoiceIndex(zufall%story.currentChoices.length); if(++n>5000)break;}
  for(const [liste,stat,name,text] of [['taschen_liste','tasche_status','tasche_name','tasche_text'],['menschen_liste','mensch_bekannt','mensch_name','mensch_text']]){
    for(const id of story.EvaluateFunction(liste).split(',')){
      const st=story.EvaluateFunction(stat,[id]);
      if(!st) continue;
      const vorher=JSON.stringify(JSON.parse(story.state.ToJson()).variablesState);
      const nm=story.EvaluateFunction(name,[id],true).output.trim();
      const tx=story.EvaluateFunction(text,[id],true).output.trim();
      if(!nm||!tx||/[{}]/.test(tx)) fehler.add(`${id}: leer oder Klammer (${nm}|${tx})`);
      const nachher=JSON.stringify(JSON.parse(story.state.ToJson()).variablesState);
      if(vorher!==nachher) fehler.add(`${id}: Aufruf verändert Variablen`);
      if(zeig==lauf) console.log(`[${st}] ${nm}: ${tx}`);
    }
  }
}
if(fehler.size){console.error('Tagebuch-FEHLER:\n'+[...fehler].join('\n'));process.exit(1);}
console.log('Tagebuch (Taschen, Menschen): in Ordnung.');
