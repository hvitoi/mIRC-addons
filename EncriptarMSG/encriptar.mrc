on *:input:*:{ if (/* !iswm $1) && ($active != Status Window) { say $replace($1-,a,2ä,b,3ß,c,4©,d,5Ð,e,3ë,f,7F,g,1G,h,3|-|,i,10î,j,11J,k,12|<,l,4L,m,14M,n,14ñ,o,2ð,p,3P,q,4Q,r,5®,s,6§,t,7T,u,13µ,v,12v,w,3W,x,10×,y,11¥,z,12Z,ã,2ã,á,2á,é,5é,ó,2ó,ú,5ú,õ,2õ,?,4?,!,13¡) | halt } }

menu menubar {
  .Encriptar mensagem
  .Leia-me: /run $scriptdirLeia-me.txt
  .-
  .Descarregar: unload -rs $+(",$script,")
}

on *:load:{
  echo -a 3>10>1> 2Addon Carregado com sucesso!
  echo -a 3>10>1> 2Autor: Henrique Vitoi 
  echo -a 3>10>1> 2Nick: Hav_gt_sdw / HenriqueVitoi 
  echo -a 3>10>1> 2Redes Que Frequento: IRC-Gate, BRLink, BrasIRC 
echo -a 3>10>1> 2Qualquer dúvida me contate em algumas dessas redes }
