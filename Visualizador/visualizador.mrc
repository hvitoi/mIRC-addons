alias Visualizador {
  window -k[0] @Visualizador $scriptdirVisualizador.ico
  while (!$filtered) { filter " $+ $$sfile(C:/Meus Documentos/Henrique/*.*,Escolha o arquivo a ser lido) $+ " @Visualizador }
}

menu @Visualizador {
  .Abrir:clear | Visualizador
  -
  Fechar:close Visualizador
}
