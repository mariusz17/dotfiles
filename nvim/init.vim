" I dont remember for what this is:
" set nocompatible
" let g:polyglot_disabled = ['markdown']
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'
"syntax coloring polyglot
Plug 'sheerun/vim-polyglot'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'davidhalter/jedi-vim'
"Plug 'davidhalter/jedi'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'vim-scripts/AutoComplPop'
Plug 'cormacrelf/vim-colors-github'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'RRethy/vim-illuminate' "for highlighting the same words
call plug#end()

let g:prettier#autoformat_require_pragma = 0

" colorscheme gruvbox
" colorscheme dracula
" colorscheme github
colorscheme onedark
" set background=dark
" set background=light
" highlight Normal ctermbg=none
" autocmd ColorScheme * highlight Normal ctermbg=None

syntax on
set hidden
set nowrap
set number
autocmd FileType * setlocal ts=2
autocmd FileType * setlocal sts=2
autocmd FileType * setlocal sw=2
autocmd FileType * setlocal noexpandtab

filetype indent on
set smartindent
set autoindent
set spelllang=pl
setlocal spell spelllang=pl
set nospell
set splitbelow splitright
set encoding=utf-8
set laststatus=2
set autoread
set clipboard=unnamedplus
"set nohlsearch
set hlsearch!
set incsearch
set ignorecase
set belloff=all
set relativenumber
set guifont=Consolas:h12
set scrolloff=8
set signcolumn=yes
set guicursor=
set guicursor+=a:blinkon0
" set statusline+=%F

"hi Normal guibg=NONE ctermbg=NONE
hi SpellBad cterm=none ctermbg=238
"set cursorline
hi CursorLine ctermbg=237
hi Visual cterm=none ctermbg=240

nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-b> <cmd>Telescope buffers<cr>
" paste in visual mode withouth yanking selected text (buggy with last
" word/character
vnoremap p "_dP
nnoremap Y y$
nnoremap x "_x
vnoremap x "_x

language messages en_US.UTF-8

let mapleader = "\<space>"

nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>h :set hls!<cr>
" nmap <leader>f :vs<cr>:Ex<cr><C-W><S-H>:vertical resize 35<cr>
nmap <leader>e :Lexplore<cr>

nmap <leader>ch :r ~/.config/nvim/my-snippets/html<cr>
nmap <leader>rfce :r ~/.config/nvim/my-snippets/rfce<cr>

lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"node_modules"} } }
require("nvim-lsp-installer").setup{}
require'lspconfig'.tsserver.setup{}
EOF
