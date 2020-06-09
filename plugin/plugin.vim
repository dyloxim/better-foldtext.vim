" {{{ BetterFoldText ❯
function! BetterFoldText()
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart
  let levels = ['······  ·  ', '·  ··  ·····', '···· ·   · ·']
  let l:depth_indicator = l:levels[v:foldlevel % (len(l:levels))]
  let endtext = " + " . printf('%2s', eval(foldedlinecount)) . " line"
  if l:foldedlinecount > 1 | let endtext = endtext . "s "
  else | let endtext = endtext . "  " | endif
  let start_text = ' >> '
  let line = strpart(l:line, 0, l:windowwidth - 2 - strdisplaywidth(l:endtext) - strdisplaywidth(l:start_text))
  let fillcharcount = windowwidth - strdisplaywidth(l:line) - strdisplaywidth(l:endtext) - strdisplaywidth(l:start_text)
  let fill = Better_reverse(Better_repeat(l:depth_indicator, l:fillcharcount))
  return line . l:start_text . l:fill . l:endtext
endfunction
" }}} BetterFoldText ❮

set foldtext=BetterFoldText()
