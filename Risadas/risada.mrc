alias F3 {
  inc %contador
  inc %calculo $rand(1,20)
  splay $+($scriptdirlol,$rand(1,2),.wav)
  goto $rand(1,4)
  :1
  { say $read($scriptdirRisadas.txt) Nº 12[2 $calc(%contador * %calculo) ÷ %calculo =  $+ %contador $+  12] | halt }
  :2
  { say $read($scriptdirRisadas.txt) Nº 12[2 $calc(%contador / %calculo) x %calculo =  $+ %contador $+  12] | halt }
  :3
  { say $read($scriptdirRisadas.txt) Nº 12[2 $calc(%contador + %calculo) - %calculo =  $+ %contador $+  12] | halt }
  :4
  { say $read($scriptdirRisadas.txt) Nº 12[2 $calc(%contador - %calculo) + %calculo =  $+ %contador $+  12] | halt }
}

menu menubar {
  .Risadas
  .Instruções: /run $scriptdirInstruções.txt
  .Leia-me: /run $scriptdirLeia-me.txt
  .Suas Risadas: /run $scriptdirRisadas.txt
  .-
  .Descarregar: unload -rs $+(",$script,")
}

on *:load:{
  echo -a 3>10>1> 2Addon Carregado com sucesso! 
  echo -a 3>10>1> 2Autor: Henrique Abrantes Vitoi
  echo -a 3>10>1> 2Nick: Hav_gt_sdw / HenriqueVitoi
  echo -a 3>10>1> 2Redes Que Frequento: IRC-Gate, BRLink, BrasIRC
  echo -a 3>10>1> 2Qualquer dúvida me contate em algumas dessas redes
echo -a 3>10>1> 2Veja as instruções em Comandos.Risadas.Instruções }

alias risadas {
  run $scriptdirRisadas.txt
}
