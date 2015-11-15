" Neovim-visor for toggling a terminal buffer at the top of the vim window
" with Alt-t

if exists('g:loaded_neovim_visor') || &cp
  finish
endif
let g:loaded_neovim_visor = 1

if !exists('g:neovim_visor_key')
    let g:neovim_visor_key = '<A-t>'
endif

let s:neovim_visor_termbuf = 0
function! NeovimTerminalToggleTerm()
    topleft 15 split
    try
        exe s:neovim_visor_termbuf . 'buffer' 
        startinsert
    catch
        terminal
        let s:neovim_visor_termbuf=bufnr('%')
        execute 'tnoremap <silent> <buffer>' . g:neovim_visor_key . '  <C-\><C-n>:hide<CR>'
    endtry
endfunction

com! NeovimTerminalToggleTerm call NeovimTerminalToggleTerm()
execute 'nnoremap <silent> ' . g:neovim_visor_key . ' :NeovimTerminalToggleTerm<CR>'
