vim.cmd([[
function! Search(pattern)
  let @/ = a:pattern
  normal! n
endfunction
]])
