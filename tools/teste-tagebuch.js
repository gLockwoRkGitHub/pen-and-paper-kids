// Prüft die Tagebuch-Funktionen in story/tagebuch.ink (Taschen und Menschen).
// Spielt 200 zufällige Durchläufe und ruft am Ende jede Funktion für jede ID auf:
// Jeder vorhandene Gegenstand und jeder bekannte Mensch braucht Name und Text, ohne {}-Reste.
// Aufruf: node tools/teste-tagebuch.js [lauf]   – mit Laufnummer werden die Seiten dieses Laufs ausgegeben.
const fs=require('fs'),path=require('path');
const {Compiler,CompilerOptions}=require('inkjs/full');
const {PosixFileHandler}=require('inkjs/compiler/FileHandler/PosixFileHandler');
const dir='/home/claude/pen-and-paper-kids/story';
const c=new Compiler(fs.readFileSync(dir+'/main.ink','utf8'),new CompilerOptions(dir+'/main.ink',[],false,null,new PosixFileHandler(dir)));
const story=c.Compile();
const fehler=new Set(); const zeig=process.argv[2];
for(let lauf=0;lauf<200;lauf++){
  story.ResetState(); story.state.storySeed=lauf; story.variablesState['name']='Mika';
  let n=0;
  while(true){ while(story.canContinue) story.Continue(); if(!story.currentChoices.length) break; story.ChooseChoiceIndex(Math.floor(Math.random()*story.currentChoices.length)); if(++n>5000)break;}
  for(const [liste,stat,name,text] of [['taschen_liste','tasche_status','tasche_name','tasche_text'],['menschen_liste','mensch_bekannt','mensch_name','mensch_text']]){
    for(const id of story.EvaluateFunction(liste).split(',')){
      const st=story.EvaluateFunction(stat,[id]);
      if(!st) continue;
      const nm=story.EvaluateFunction(name,[id],true).output.trim();
      const tx=story.EvaluateFunction(text,[id],true).output.trim();
      if(!nm||!tx||/[{}]/.test(tx)) fehler.add(`${id}: leer oder Klammer (${nm}|${tx})`);
      if(zeig==lauf) console.log(`[${st}] ${nm}: ${tx}`);
    }
  }
}
if(fehler.size){console.error('Tagebuch-FEHLER:\n'+[...fehler].join('\n'));process.exit(1);}
console.log('Tagebuch (Taschen, Menschen): in Ordnung.');
