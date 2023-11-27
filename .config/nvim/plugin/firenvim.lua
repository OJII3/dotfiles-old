vim.cmd [[
let g:firenvim_config = {
    \ 'localSettings': {
        \ '.*': {
            \ 'selector': '',
            \ 'priority': 0,
        \ },
        \ 'github\.com': {
            \ 'selector': 'textarea',
            \ 'priority': 1,
        \ },
        \ '*\.kibe\.la': {
            \ 'selector': 'textarea',
            \ 'priority': 1,
        \ },
    \ }
\ }
]]
