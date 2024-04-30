" options
set ignorecase
set smartcase
set iskeyword+=-

" mappings nvim
let mapleader = ' '

nnoremap db vb"_d
nnoremap <c-a> ggVG
nnoremap <esc> :nohl<cr>
nnoremap <tab> :bnext<cr>

" mappings vscode
nnoremap <leader><space> :call VSCodeNotify('workbench.action.quickOpen')<cr>
nnoremap <leader>ks :call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>
nnoremap <leader>, :call VSCodeNotify('workbench.action.openSettingsJson')<cr>
nnoremap <leader>w :call VSCodeNotify('workbench.action.closeActiveEditor')<cr>
nnoremap <leader>g :call VSCodeNotify('editor.action.revealDefinition')<cr>