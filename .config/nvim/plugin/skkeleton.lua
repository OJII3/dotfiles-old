vim.cmd([[
function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'globalDictionaries': [
      \ '/usr/share/skk/SKK-JISYO.L',
      \ '/usr/share/skk/SKK-JISYO.fullname',
      \ '~/.skk/SKK-JISYO.L',
      \ ],
    \ })
endfunction
augroup skkeleton-initialize-pre
  autocmd!
  autocmd User skkeleton-initialize-pre call s:skkeleton_init()
augroup END
]])
