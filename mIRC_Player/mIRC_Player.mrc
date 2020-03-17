alias mIRC_Player { if (!$dialog(mIRC_Player)) { dialog -md mIRC_Player mIRC_Player } }
alias _toc_player {
  inc %_toc
  if (%_toc == 4) { unset %_toc }
  did -ra mIRC_Player 11 Tocando $+ $str(.,%_toc)
}
dialog mIRC_Player {
  title "mIRC Player"
  icon $scriptdiripod.ico
  size -1 -1 131 217
  option dbu
  tab "Músicas", 12, 1 0 128 215
  tab "Playlist", 13
  tab "Procurar", 14
  tab "Opcões", 15
  edit "By Hav_gt_sdw.. for You ;) << >> Select a Music", 1, 3 15 124 11, tab 12, read autohs
  button "Play", 2, 4 29 18 12, tab 12, flat
  button "Stop", 3, 46 29 22 12, tab 12, flat
  button "Pause", 4, 23 29 22 12, tab 12, flat
  list 5, 4 44 123 155, tab 12, sort radio
  button "Abrir", 6, 110 201 15 12, tab 12, flat
  text "", 7, 7 203 35 7, tab 12
  text "&Volume:", 8, 75 32 20 7, tab 12
  button "-", 9, 98 31 8 8, tab 12, flat
  button "+", 10, 116 31 8 8, tab 12, flat
  text "", 11, 55 203 27 7, tab 12
  box "", 16, 5 13 120 108, tab 14
  text "Digite o 'Nome' ou 'Artista' da música a ser procurada.", 17, 10 21 100 30, tab 14
  list 18, 6 136 118 80, tab 14, sort radio
  combo 19, 18 42 70 10, tab 14
  button "&Procurar.!", 20, 77 62 35 10, tab 14, default
  text "", 21, 13 92 100 13, tab 14
  text "Procurar em:", 22, 10 82 30 7, tab 14
  link "Selecionar", 23, 85 107 25 7, tab 14
  text "", 24, 96 128 30 7, tab 14
  box "Resultados da Pesquisa", 25, 4 123 123 90, tab 14
  box "Playlist", 26, 4 15 97 110, tab 13
  list 27, 7 23 90 100, tab 13, radio hsbar autohs
  button "&Add", 28, 103 29 23 12, tab 13, flat
  button "&Del", 29, 103 48 23 12, tab 13, flat
  button "+", 30, 109 70 10 10, tab 13, flat
  button "-", 31, 109 106 10 10, tab 13, flat
  text "V", 32, 112 83 11 7, tab 13
  text "o", 33, 112 90 11 7, tab 13
  text "L", 34, 112 98 11 7, tab 13
  box "Controle", 35, 4 125 122 30, tab 13
  icon 36, 9 134 20 20, $scriptdirBack.ico, tab 13
  icon 37, 33 134 20 20, $scriptdirPlay.ico, tab 13
  icon 38, 55 134 20 20, $scriptdirPause.ico, tab 13
  icon 39, 78 134 20 20, $scriptdirStop.ico, tab 13
  icon 40, 101 134 20 20, $scriptdirNext.ico, tab 13
  box "Informações", 41, 4 156 122 57, tab 13
  text "&Título -------", 42, 10 165 40 7, tab 13
  text "", 43, 39 165 80 7, tab 13
  text "&Artista -------", 44, 10 174 40 7, tab 13
  text "", 45, 39 174 80 7, tab 13
  text "&Álbum -------", 46, 10 183 40 7, tab 13
  text "", 47, 39 183 80 7, tab 13
  text "&Gênero -----", 48, 10 192 40 7, tab 13
  text "", 49, 39 192 80 7, tab 13
  text "&Duração ---", 50, 10 201 30 7, tab 13
  text "", 51, 39 201 20 7, tab 13
  check "Automaticamente carregar lista ao iniciar", 53, 10 68 110 10, tab 15
  check "Parar música ao sair", 54, 10 48 100 10, tab 15
  link "Selecionar Diretório", 55, 71 98 51 10, tab 15
  text "", 56, 9 82 100 13, tab 15
  box "Geral", 57, 5 15 120 99, tab 15
  check "Pular música automaticamente", 58, 10 28 100 10, tab 15
  check "Mostrar música atual em canais", 59, 10 128 110 10, tab 15
  edit "", 60, 15 144 93 12, tab 15, autohs
  button "Prever.!", 61, 90 160 25 10, tab 15
  box "Outros", 62, 5 115 120 97, tab 15
  text "<nome>", 63, 10 175 25 7, tab 15
  text "<artista>", 64, 10 187 25 7, tab 15
  text "<album>", 65, 10 199 25 7, tab 15
  text "<genero>", 66, 50 175 25 7, tab 15
  text "<tempo>", 67, 50 187 25 7, tab 15
  text "<bitrate>", 68, 50 199 25 7, tab 15
  text "<ano>", 69, 90 175 25 7,tab 15
  text "<faixa>", 70, 90 187 25 7,tab 15
  text "<formato>", 71, 90 199 27 7,tab 15
}
on *:mp3end:{ if ($dialog(mIRC_Player)) {
    if (%_selmp3 == on) {
      if (%_inplayer != sim) {
        var %_tpassar = $calc(%_passar + 1)
        if (%_modo == musicas) && ($did(mIRC_Player, 5).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_dir $+ $did(mIRC_Player, 5, %_tpassar).text
          did -s mIRC_Player 5 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname).text) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == musicas) && ($did(mIRC_Player, 5).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == procura) && ($did(mIRC_Player, 18).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_pdir $+ $did(mIRC_Player, 18, %_tpassar).text
          did -s mIRC_Player 18 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname).text) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == procura) && ($did(mIRC_Player, 18).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == playlist) && ($did(mIRC_Player, 27).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay $read($scriptdird-playlist.txt, %_passar) $+ $read($scriptdira-playlist.txt, %_passar)
          did -s mIRC_Player 27 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          did -ra mIRC_Player 43 $sound($insong.fname).title
          did -ra mIRC_Player 45 $sound($insong.fname).artist
          did -ra mIRC_Player 47 $sound($insong.fname).album
          did -ra mIRC_Player 49 $sound($insong.fname).genre
          did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss)
          if ($insong.pause == $false) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
          .timer_toc 0 1 _toc_player
        } 
      }
      if (%_modo == playlist) && ($did(mIRC_Player, 27).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
    if (%_inplayer != =/) {
      if (%_selmp3 != on) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
  }
}
on *:midiend:{ if ($dialog(mIRC_Player)) {
    if (%_selmp3 == on) {
      if (%_inplayer != =/) {
        var %_tpassar = $calc(%_passar + 1)
        if (%_modo == musicas) && ($did(mIRC_Player, 5).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_dir $+ $did(mIRC_Player, 5, %_tpassar).text
          did -s mIRC_Player 5 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname).text) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == musicas) && ($did(mIRC_Player, 5).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == procura) && ($did(mIRC_Player, 18).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_pdir $+ $did(mIRC_Player, 18, %_tpassar).text
          did -s mIRC_Player 18 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == procura) && ($did(mIRC_Player, 18).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == playlist) && ($did(mIRC_Player, 27).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay $read($scriptdird-playlist.txt, %_passar) $+ $read($scriptdira-playlist.txt, %_passar)
          did -s mIRC_Player 27 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          did -ra mIRC_Player 43 $sound($insong.fname).title
          did -ra mIRC_Player 45 $sound($insong.fname).artist
          did -ra mIRC_Player 47 $sound($insong.fname).album
          did -ra mIRC_Player 49 $sound($insong.fname).genre
          did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss)
          if ($insong.pause == $false) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
          .timer_toc 0 1 _toc_player
        } 
      }
      if (%_modo == playlist) && ($did(mIRC_Player, 27).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
    if (%_inplayer != =/) {
      if (%_selmp3 != on) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
  }
}
on *:waveend:{ if ($dialog(mIRC_Player)) {
    if (%_selmp3 == on) {
      if (%_inplayer != =/) {
        var %_tpassar = $calc(%_passar + 1)
        if (%_modo == musicas) && ($did(mIRC_Player, 5).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_dir $+ $did(mIRC_Player, 5, %_tpassar).text
          did -s mIRC_Player 5 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == musicas) && ($did(mIRC_Player, 5).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == procura) && ($did(mIRC_Player, 18).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay %_pdir $+ $did(mIRC_Player, 18, %_tpassar).text
          did -s mIRC_Player 18 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          .timer_toc 0 1 _toc_player
        }
      }
      if (%_modo == procura) && ($did(mIRC_Player, 18).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
      if (%_inplayer != =/) {
        if (%_modo == playlist) && ($did(mIRC_Player, 27).lines >= %_tpassar) {
          set %_passar $calc(%_passar + 1)
          splay stop
          splay $read($scriptdird-playlist.txt, %_passar) $+ $read($scriptdira-playlist.txt, %_passar)
          did -s mIRC_Player 27 %_passar
          did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
          if ($did(mIRC_Player, 1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
          did -ra mIRC_Player 43 $sound($insong.fname).title
          did -ra mIRC_Player 45 $sound($insong.fname).artist
          did -ra mIRC_Player 47 $sound($insong.fname).album
          did -ra mIRC_Player 49 $sound($insong.fname).genre
          did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss)
          if ($insong.pause == $false) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
          if ($insong.pause == $false) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
          .timer_toc 0 1 _toc_player
        } 
      }
      if (%_modo == playlist) && ($did(mIRC_Player, 27).lines < %_tpassar) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =//
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
    if (%_inplayer != =/) {
      if (%_selmp3 != on) {
        did -ra mIRC_Player 1 StandBy
        set %_inplayer =/
        .timer_toc off
        did -ra mIRC_Player 11 Parado
      }
    }
  }
}
on *:dialog:mIRC_Player:init:*:{
  did -a mIRC_Player 21 %_pdir
  did -a mIRC_Player 56 %_cadir
  did -a mIRC_Player 60 %_aparecer_
  if (%_selmp1 != off) { did -c mIRC_Player 53 }
  if (%_selmp2 != off) { did -c mIRC_Player 54 }
  if (%_selmp3 != off) { did -c mIRC_Player 58 }
  if (%_selmp1 == on) { loadbuf -o mIRC_Player 5 " $+ $scriptdirtotal.txt $+ " }
  loadbuf -o mIRC_Player 27 " $+ $scriptdira-playlist.txt $+ "
  if ($did(5).lines == 0) || ($did(5).lines == 1) { did -a mIRC_Player 7 $did(5).lines Música }
  if ($did(5).lines > 1) { did -a mIRC_Player 7 $did(5).lines Músicas }
  if ($did(18).lines == 0) || ($did(18).lines == 1) { did -a mIRC_Player 24 $did(18).lines Item }
  if ($did(18).lines > 1) { did -a mIRC_Player 24 $did(18).lines Itens }
  if (%_selmp1 == on) { did -c $dname 53 }
  if (%_selmp2 == on) { did -c $dname 54 }
  if ($insong == $true) && ($insong.pause == $false) {
    did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
    if (%_modo == musicas) { did -s mIRC_Player 5 %_passar }
    if (%_modo == playlist) { did -s mIRC_Player 27 %_passar }
    if (%_modo == playlist) { did -ra mIRC_Player 43 $sound($insong.fname).title }
    if (%_modo == playlist) { did -ra mIRC_Player 45 $sound($insong.fname).artist }
    if (%_modo == playlist) { did -ra mIRC_Player 47 $sound($insong.fname).album }
    if (%_modo == playlist) { did -ra mIRC_Player 49 $sound($insong.fname).genre }
    if (%_modo == playlist) { did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss) }
    if (%_modo == playlist) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    .timer_toc 0 1 _toc_player
  }
  if ($insong == $false) {
    did -ra mIRC_Player 11 Parado
  }
  if ($insong.pause == $true) {
    did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
    if (%_modo == musicas) { did -s mIRC_Player 5 %_passar }
    if (%_modo == playlist) { did -s mIRC_Player 27 %_passar }
    if (%_modo == playlist) { did -ra mIRC_Player 43 $sound($insong.fname).title }
    if (%_modo == playlist) { did -ra mIRC_Player 45 $sound($insong.fname).artist }
    if (%_modo == playlist) { did -ra mIRC_Player 47 $sound($insong.fname).album }
    if (%_modo == playlist) { did -ra mIRC_Player 49 $sound($insong.fname).genre }
    if (%_modo == playlist) { did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss) }
    if (%_modo == playlist) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if (%_modo == playlist) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    did -ra mIRC_Player 11 Pausado
  }
}
on *:dialog:mIRC_Player:sclick:2:{
  if ($did(5).seltext == $null) && ($insong.pause == $false) {
    return $input(Selecione uma música para tocar, uoi, Aviso)
  }
  if ($insong.pause == $false) {
    set %_passar $did(5).sel
    set %_modo musicas
    splay stop
    did -ra mIRC_Player 1 $sound(%_dir $+ $did(5).seltext).artist - $sound(%_dir $+ $did(5).seltext).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath(%_dir $+ $did(5).seltext) }
    splay %_dir $+ $did(5).seltext
    if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
    if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
    set %_inplayer =)
    .timer_toc 0 1 _toc_player
  }
  if ($insong.pause == $true) {
    did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
    splay resume
    set %_inplayer =)
    .timer_toc 0 1 _toc_player
  }
}
on *:dialog:mIRC_Player:sclick:3:{
  splay stop
  did -ra mIRC_Player 1 StandBy
  set %_inplayer =/
  .timer_toc off
  did -ra mIRC_Player 11 Parado
}
on *:dialog:mIRC_Player:sclick:4:{
  if ($insong.fname == $null) {
    return $input(Nenhuma música a ser pausada, uoi, Aviso)
  }
  splay pause
  set %_inplayer =/
  .timer_toc off
  did -ra mIRC_Player 11 Pausado
}
on *:dialog:mIRC_Player:dclick:5:{
  set %_passar $did(5).sel
  set %_modo musicas
  splay stop
  did -ra mIRC_Player 1 $sound(%_dir $+ $did(5).seltext).artist - $sound(%_dir $+ $did(5).seltext).title
  if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath(%_dir $+ $did(5).seltext) }
  splay %_dir $+ $did(5).seltext
  if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
  if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
  set %_inplayer =)
  .timer_toc 0 1 _toc_player
}
on *:dialog:mIRC_Player:sclick:6:{ 
  var %_tdir $sdir($sound(mp3),Informe Aqui o Diretório de Suas Músicas)
  var %_1 = 1
  var %_mtotal = $findfile(%_tdir,*.mp3;*.wma;*.ogg;*.wav;*.mid,0)
  if (%_tdir != $null) {
    did -r mIRC_Player 5
    while (%_1 <= %_mtotal) {
      did -a mIRC_Player 5 $remove($findfile(%_tdir,*.mp3;*.wma;*.ogg;*.wav;*.mid,$v1),%_tdir)
      inc %_1
    }
    if ($did(5).lines == 0) || ($did(5).lines == 1) { did -ra mIRC_Player 7 $did(5).lines Música }
    if ($did(5).lines > 1) { did -ra mIRC_Player 7 $did(5).lines Músicas }
    if (0 == %_mtotal) { return $input(Nenhuma música foi encontrada, uoi, Aviso) }
    set %_dir %_tdir
  }
}
on *:dialog:mIRC_Player:sclick:9:{
  vol -v $calc($vol(master) - 2000)
}
on *:dialog:mIRC_Player:sclick:10:{
  vol -v $calc($vol(master) + 2000)
}
on *:dialog:mIRC_Player:sclick:20:{
  did -r mIRC_Player 18
  var %_1 = 1
  var %_ptotal = $findfile(%_pdir,* $+ $did(19).text $+ *.mp3;* $+ $did(19).text $+ *.wma;* $+ $did(19).text $+ *.ogg;* $+ $did(19).text $+ *.wav;* $+ $did(19).text $+ *.mid,0)
  while (%_1 <= %_ptotal) {
    did -a mIRC_Player 18 $remove($findfile(%_pdir,* $+ $did(19).text $+ *.mp3;* $+ $did(19).text $+ *.wma;* $+ $did(19).text $+ *.ogg;* $+ $did(19).text $+ *.wav;* $+ $did(19).text $+ *.mid,$v1),%_pdir)
    inc %_1 
  }
  if ($did(18).lines == 0) || ($did(18).lines == 1) { did -ra mIRC_Player 24 $did(18).lines Item }
  if ($did(18).lines > 1) { did -ra mIRC_Player 24 $did(18).lines Itens }
  if (%_pdir == $null) { return $input(Selecione a pasta onde a música será procurada, uoi, Pesquisa) }
  if (0 == $findfile(%_pdir,* $+ $did(19).text $+ *.mp3;* $+ $did(19).text $+ *.wma;* $+ $did(19).text $+ *.ogg;* $+ $did(19).text $+ *.wav;* $+ $did(19).text $+ *.mid,0)) { return $input(Nenhuma música foi encontrada, uoi, Pesquisa) }
} 
on *:dialog:mIRC_Player:dclick:18:{
  set %_passar $did(18).sel
  set %_modo procura
  splay stop
  did -ra mIRC_Player 1 $sound(%_pdir $+ $did(18).seltext).artist - $sound(%_pdir $+ $did(18).seltext).title
  if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath(%_pdir $+ $did(18).seltext) }
  splay %_pdir $+ $did(18).seltext
  if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
  if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
  set %_inplayer =)
  .timer_toc 0 1 _toc_player
}
on *:dialog:mIRC_Player:sclick:23:{
  set %_pdir $sdir($sound(mp3),Informe aqui em qual diretório a música será procurada)
  did -ra mIRC_Player 21 %_pdir
}
on *:dialog:mIRC_Player:sclick:53:{ 
  if (%_cadir == $null) {
    did -u mIRC_Player 53
    return $input(Selecione primeiro a pasta a ser carregada, uoi, Aviso)
  }
  if (%_cadir != $null) {
    if ($did(53).state == 1) { set %_selmp1 on } | { else set %_selmp1 off }
  }
}
on *:dialog:mIRC_Player:sclick:54:{
  if ($did(54).state == 1) { set %_selmp2 on } | { else set %_selmp2 off }
}
on *:dialog:mIRC_Player:sclick:58:{
  if ($did(58).state == 1) { set %_selmp3 on } | { else set %_selmp3 off }
}
on *:dialog:mIRC_Player:sclick:59:{
  if ($did(58).state == 1) { set %_selmp4 on } | { else set %_selmp4 off }
}
on *:dialog:mIRC_Player:sclick:55:{ 
  set %_cadir $sdir($sound(mp3),Informe aqui em qual diretório será automaticamente aberto ao iniciar)
  var %_1 = 1
  var %_catotal = $findfile(%_cadir,*.mp3;*.wma;*.ogg;*.wav;*.mid,0)
  if (%_cadir != $null) {
    write -c " $+ $scriptdirtotal.txt $+ "
    while (%_1 <= %_catotal) {
      write " $+ $scriptdirtotal.txt $+ " $remove($findfile(%_cadir,*.mp3;*.wma;*.ogg;*.wav;*.mid,$v1),%_cadir)
      inc %_1
    }
  }
  did -ra mIRC_Player 56 %_cadir
}
on *:dialog:mIRC_Player:sclick:36:{
  var %_tpassar $calc(%_plpassar - 1)
  if (1 <= %_tpassar) {
    set %_plpassar $calc(%_plpassar - 1)
    splay stop
    splay $read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)
    did -s mIRC_Player 27 %_plpassar
    did -ra mIRC_Player 1 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist - $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)) }
    did -ra mIRC_Player 43 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    did -ra mIRC_Player 45 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist
    did -ra mIRC_Player 47 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album
    did -ra mIRC_Player 49 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre
    did -ra mIRC_Player 51 $gmt($calc($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).length /1000),nn:ss)
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    set %_inplayer =)
    if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
    if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
    .timer_toc 0 1 _toc_player
  }
}
on *:dialog:mIRC_Player:sclick:37:{
  if ($did(27).seltext == $null) && ($insong.pause == $false) {
    return $input(Selecione uma música para tocar, uoi, Aviso)
  }
  if ($insong.pause == $false) {
    set %_modo playlist
    set %_plpassar $did(27).sel
    splay stop
    splay " $+ $read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar) $+ "
    did -s mIRC_Player 27 %_plpassar
    did -ra mIRC_Player 1 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist - $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)) }
    did -ra mIRC_Player 43 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    did -ra mIRC_Player 45 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist
    did -ra mIRC_Player 47 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album
    did -ra mIRC_Player 49 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre
    did -ra mIRC_Player 51 $gmt($calc($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).length /1000),nn:ss)
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
    if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
    set %_inplayer =)
    .timer_toc 0 1 _toc_player
  }
  if ($insong.pause == $true) {
    splay resume
    did -s mIRC_Player 27 %_plpassar
    did -ra mIRC_Player 1 $sound($insong.fname).artist - $sound($insong.fname).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($insong.fname) }
    did -ra mIRC_Player 43 $sound($insong.fname).title
    did -ra mIRC_Player 45 $sound($insong.fname).artist
    did -ra mIRC_Player 47 $sound($insong.fname).album
    did -ra mIRC_Player 49 $sound($insong.fname).genre
    did -ra mIRC_Player 51 $gmt($calc($sound($insong.fname).length /1000),nn:ss)
    if ($insong.pause == $false) && ($sound($insong.fname).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if ($insong.pause == $false) && ($sound($insong.fname).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if ($insong.pause == $false) && ($sound($insong.fname).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if ($insong.pause == $false) && ($sound($insong.fname).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    set %_inplayer =)
    .timer_toc 0 1 _toc_player
  }
}
on *:dialog:mIRC_Player:sclick:38:{
  if ($insong.fname == $null) {
    return $input(Nenhuma música a ser pausada, uoi, Aviso)
  }
  splay pause
  set %_inplayer =/
  .timer_toc off
  did -ra mIRC_Player 11 Pausado
}
on *:dialog:mIRC_Player:sclick:39:{
  splay stop
  did -ra mIRC_Player 1 StandBy
  set %_inplayer =/
  .timer_toc off
  did -ra mIRC_Player 11 Parado
}
on *:dialog:mIRC_Player:sclick:40:{
  var %_tpassar $calc(%_plpassar + 1)
  if ($did(27).lines >= %_tpassar) {
    set %_plpassar $calc(%_plpassar + 1)
    splay stop
    splay $read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)
    did -s mIRC_Player 27 %_plpassar
    did -ra mIRC_Player 1 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist - $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)) }
    did -ra mIRC_Player 43 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
    did -ra mIRC_Player 45 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist
    did -ra mIRC_Player 47 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album
    did -ra mIRC_Player 49 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre
    did -ra mIRC_Player 51 $gmt($calc($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).length /1000),nn:ss)
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title == $null) { did -ra mIRC_Player 43 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album == $null) { did -ra mIRC_Player 47 Desconhecido }
    if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
    set %_inplayer =)
    if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
    if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
    .timer_toc 0 1 _toc_player
  }
}
on *:dialog:mIRC_Player:sclick:30:{
  vol -v $calc($vol(master) + 2000)
}
on *:dialog:mIRC_Player:sclick:31:{
  vol -v $calc($vol(master) - 2000)
}
on *:dialog:mIRC_Player:sclick:28:{
  var %_pfile = $sfile($sound(mp3) $+ *.mp3, Escolha um arquivo para adicionar à playlist)
  write " $+ $scriptdira-playlist.txt $+ " $nopath(%_pfile)
  write " $+ $scriptdird-playlist.txt $+ " $nofile(%_pfile)
  loadbuf -ro mIRC_Player 27 " $+ $scriptdira-playlist.txt $+ "
  did -s mIRC_Player 27 %_plpassar
}
on *:dialog:mIRC_Player:sclick:29:{
  write -dl $+ $did(27).sel " $+ $scriptdird-playlist.txt $+ "
  write -dl $+ $did(27).sel " $+ $scriptdira-playlist.txt $+ "
  loadbuf -ro mIRC_Player 27 " $+ $scriptdira-playlist.txt $+ "
  did -s mIRC_Player 27 %_plpassar
}
on *:dialog:mIRC_Player:dclick:27:{
  set %_modo playlist
  set %_plpassar $did(27).sel
  splay stop
  splay " $+ $read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar) $+ "
  did -ra mIRC_Player 1 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist - $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
  if ($did(1).text == -) { did -ra mIRC_Player 1 $nopath($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar) }
  did -ra mIRC_Player 43 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title
  did -ra mIRC_Player 45 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist
  did -ra mIRC_Player 47 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album
  did -ra mIRC_Player 49 $sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre
  did -ra mIRC_Player 51 $gmt($calc($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).length /1000),nn:ss)
  if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).title == $null) { did -ra mIRC_Player 43 Desconhecido }
  if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).artist == $null) { did -ra mIRC_Player 45 Desconhecido }
  if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).album == $null) { did -ra mIRC_Player 47 Desconhecido }
  if ($insong.pause == $false) && ($sound($read($scriptdird-playlist.txt, %_plpassar) $+ $read($scriptdira-playlist.txt, %_plpassar)).genre == $null) { did -ra mIRC_Player 49 Desconhecido }
  if (%_selmp4 == on) && (%_anuciar != $null) { ame %_anunciar_ }
  if (%_selmp4 == on) && (%_anuciar == $null) { ame Ao som de $sound($insong.fname).title }
  set %_inplayer =)
  .timer_toc 0 1 _toc_player
}
on *:dialog:mIRC_Player:close:*:{
  if (%_selmp2 == on) { splay stop }
  if (%_selmp1 == on) { set %_dir %_cadir }
  .timer_toc off
  unset %_toc
  unset %_inplayer
}
on *:dialog:mIRC_Player:sclick:12:{
  if (%_modo == musicas) {
    did -s mIRC_Player 5 %_plpassar
    did -l mIRC_Player 27
    did -l mIRC_Player 18
  }
}
on *:dialog:mIRC_Player:sclick:13:{
  if (%_modo == playlist) {
    did -s mIRC_Player 27 %_plpassar
    did -l mIRC_Player 5
    did -l mIRC_Player 18
  }
}
on *:dialog:mIRC_Player:sclick:14:{
  if (%_modo == procura) {
    did -s mIRC_Player 18 %_plpassar
    did -l mIRC_Player 27
    did -l mIRC_Player 5
  }
}
on *:dialog:mIRC_Player:edit:60:{
  set %_aparecer_ $did(60)
  set %_anunciar_ $replace($did(60),<nome>,$!+ $!sound($insong.fname).title $!+,<artista>,$!+ $!sound($insong.fname).artist $!+,<album>,$!+ $!sound($insong.fname).album $!+,<genero,$!+ $!sound($insong.fname).genre $!+,<tempo>,$!+ $!gmt($calc($sound($insong.fname).length /1000),nn:ss) $!+,<bitrate>,$!+ $!sound($insong.fname).bitrate $!+,<ano>, $!+ $!sound($insong.fname).year $!+,<faixa>,$!+ $!sound($insong.fname).track $!+,<formato>,$!+ $!sound($insong.fname).mode $!+)
}
menu menubar {
  .»» !.mIRC Player.! ««
  .Abrir: mIRC_Player
  .Leia-me: run $scriptdirLeia-me.txt
  .-
  .Descarregar: unload -rs " $+ $script $+ "
}
on *:load:{
  set %_dir
  set %_pdir
  set %_cadir
  set %_selmp1 off
  set %_selmp2 off
  set %_selmp3 on
  set %_selmp4 off
  set %_modo
  set %_passar
  echo -a 3>10>1> 2Addon Carregado com sucesso! 
  echo -a 3>10>1> 2Autor: Henrique Vitoi
  echo -a 3>10>1> 2Nick: Hav_gt_sdw / HenriqueVitoi
  echo -a 3>10>1> 2Redes Que Frequento: Irc-Gate, BRLink, BrasIRC
  echo -a 3>10>1> 2Qualquer dúvida ou sugestões, contactar nas redes
  echo -a 3>10>1> 2Digite /mIRC_Player para abrir ;)
}
on *:unload:{
  unset %_dir
  unset %_pdir
  unset %_cadir
  unset %_selmp1
  unset %_selmp2
  unset %_selmp3
  unset %_selmp4
  unset %_modo
  unset %_passar
  echo -a 3>10>1> 2Obrigador por usar meu Addon ;)
  echo -a 3>10>1> 2By Hav_gt_sdw
}
