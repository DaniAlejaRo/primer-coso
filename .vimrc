call plug#begin('~/.vim/plugged')
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-system-copy'
Plug 'ycm-core/YouCompleteMe'
Plug 'plasticboy/vim-markdown'
"Plug 'sainnhe/sonokai'
Plug 'arcticicestudio/nord-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'habamax/vim-godot'
call plug#end()

set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
set noshowmode
colo delek
cd %:p:h
set number
set termguicolors   " enable true colors support
set background=dark " dark theme
syntax on
"colorscheme modified
set rnu
let g:ycm_key_list_select_completion = ['<Down>']
let g:UltiSnipsSnippetDirectories = ['/home/juans/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
set list
set listchars=tab:▸-
set autoindent 
let g:tex_flavor = 'latex'
"Para cambiar el cursor"
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
"Pdf viewer for forward and backward search
let g:latex_view_general_viewer = 'zathura'
let g:vimtex_view_method = "zathura"
filetype plugin on
"You Complete me Configuration
set omnifunc=syntaxcomplete#Complete
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
au VimEnter * let g:ycm_semantic_triggers.markdown=g:vimtex#re#youcompleteme
au VimEnter * let g:ycm_semantic_triggers.md=g:vimtex#re#youcompleteme
autocmd FileType tex let g:ycm_min_num_of_chars_for_completion = 1000
autocmd FileType tex set linebreak
autocmd FileType tex set textwidth=74
autocmd FileType markdown set textwidth=74
autocmd Filetype julia setlocal tabstop=4
autocmd Filetype tex setlocal tabstop=4
autocmd Filetype gdscript setlocal tabstop=4

"Color Sheme
" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
"let g:sonokai_style = 'andromeda'
"let g:sonokai_enable_italic = 1
"let g:sonokai_disable_italic_comment = 1
"let g:vimfiler_as_default_explorer =1
"
colorscheme nord
set belloff=all
set autochdir
filetype indent off
