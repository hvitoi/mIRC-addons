on *:input:*:{ if (/* !iswm $1) && ($active != Status Window) { say $replace($1-,a,2�,b,3�,c,4�,d,5�,e,3�,f,7F,g,1G,h,3|-|,i,10�,j,11J,k,12|<,l,4L,m,14M,n,14�,o,2�,p,3P,q,4Q,r,5�,s,6�,t,7T,u,13�,v,12v,w,3W,x,10�,y,11�,z,12Z,�,2�,�,2�,�,5�,�,2�,�,5�,�,2�,?,4?,!,13�) | halt } }

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
echo -a 3>10>1> 2Qualquer d�vida me contate em algumas dessas redes }
