"Plugins
call plug#begin('~/.vim/plugged')
"Plug 'sainnhe/sonokai' 
"Plug 'vim-airline/vim-airline'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-system-copy'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
Plug 'jez/vim-better-sml'
Plug 'juansegaes/vim-qdpython'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'kmonad/kmonad-vim'
Plug 'lervag/vimtex'
Plug 'mhartington/oceanic-next'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'plasticboy/vim-markdown'
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'svermeulen/vim-easyclip'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'ycm-core/YouCompleteMe'
call plug#end()

"call plug#begin('~/Documents')
"Plug 'vim-qdpython'
"call plug#end()
"
"configuration for Julia language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, env_path, "");
\       server.runlinter = true;
\       run(server);
\   ']
\ }




"Status bar
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
"To avoid vim showing --INSERT-- when it is in insert mode:
set noshowmode
"To ensure that every command is executed from the relative directory
cd %:p:h
"Number the lines around the current line relatively to it
set number
set rnu

set tabstop=2
set shiftwidth=2

set termguicolors   " enable true colors support
set background=dark " dark theme
"Turn on syntax highlighting
syntax on
"To select the YouCompleteme options
let g:ycm_key_list_select_completion = ['<Down>']
"The location of the UltiSnips Directory
let g:UltiSnipsSnippetDirectories = ['~/.vim/ultisnips']
"The following two wlines set the keybindings to engage snips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
"The following two lines  show every tab character as ▸----
set list
set listchars=tab:▸-
"Enable autoindentation
"set autoindent 
"Choose the Tex compiler
let g:tex_flavor = 'latex'
"Reduce the size of the quickfix tab 
let g:vimtex_quickfix_mode=0
"Set the following line to 1 to render some special LaTex syimbols in vim
set conceallevel=1
let g:tex_conceal='abdmg'

"To set the cursor to '|' instead of a block, this is not necessary in Neovim
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

"You Complete me Configuration
set omnifunc=syntaxcomplete#Complete
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif

"defines autocommands that'll get executed when a file matching a given pattern is opened.
filetype plugin on

"Set  YouCompleteMe semantic triggers
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
" Avoids YouCompleteMe from completing random words
autocmd FileType tex let g:ycm_min_num_of_chars_for_completion = 1000000
"Prevents vim from braking words when wraping lines
autocmd FileType tex set linebreak
"Sets the maximum amount of characters in a single line
autocmd FileType tex set textwidth=70
autocmd FileType markdown set textwidth=70
"Sets the amount of spaces that the tab character displays
"autocmd Filetype julia setlocal tabstop=4
"autocmd Filetype tex setlocal tabstop=2
"autocmd Filetype tex setlocal shiftwidth=2
""autocmd Filetype tex setlocal expandtab=2
"autocmd Filetype gdscript setlocal tabstop=4

"Color Sheme
" Important!!
if has('termguicolors')
  set termguicolors
endif

"sets the cholorscheme
"colorscheme nord
colorscheme OceanicNext
"Disables beeping
set belloff=all
"Set working directory to the current file
set autochdir
"Removes some unwanted autoindenting
filetype indent off
"Sets the F1 key in normalmode to open the file explorer NERDTree
nnoremap <F1> :NERDTreeFind<CR>
nnoremap <F5> :Files %:p:h<CR>
nnoremap <F7> :Files<CR>
"To preview markdown
"let sur = 0
"if sur == 0
"	autocmd FileType nnoremap <C-Q> :! ~/Documents/Scripts/markdown/makrdown.sh % > %:r.html <CR> <CR> && surf_monitor %:r.html %:p:h &
"	let sur =1
"endif
"if sur ==1
"	autocmd FileType nnoremap <C-Q> :! ~/Documents/Scripts/markdown/makrdown.sh % > %:r.html <CR> <CR>
"endif

autocmd FileType markdown nnoremap <C-Q> :! ~/Documents/Scripts/markdown/makrdown.sh % > %:r.html  &&  surf_monitor %:r.html  ./ > /dev/null  & <CR> <CR>

autocmd FileType markdown nnoremap <C-P> :! ~/Documents/Scripts/markdown/makrdown.sh % > %:r.html  <CR> <CR>
"nnoremap <C-P> :! echo %:p:h
"latex conceal:
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
autocmd FileType tex  setlocal spell
autocmd FileType tex  set spelllang=es_mx,en_gb
autocmd FileType tex  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"Inkscape figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR> :! python3 ~/Documents/Scripts/inkscape-shortcut-manager/main.py & <CR> <CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR> :! python3 ~/Documents/Scripts/inkscape-shortcut-manager/main.py & <CR> <CR>

"Map f3 to open a terinal in vsplit
nnoremap <F3> :vsplit term://bash<CR>i

"Compile options
tnoremap <Esc> <C-\><C-n>
let g:ale_linters = {'rust': ['rust-analyzer','rustc'],'julia': ['languageserver']}
"if has('nvim-0.5')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = { "python", "cpp", "python3" , "julia" , "rust" }, -- Add more lannguages as needed
    additional_vim_regex_highlighting = vim.bo.filetype == "latex",
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}
EOF
"endif
"Copilot accept with Crl-J
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
