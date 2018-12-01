function! s:ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

vnoremap @ :<c-u>call <SID>ExecuteMacroOverVisualRange()<cr>
