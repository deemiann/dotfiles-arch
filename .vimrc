syntax on
inoremap jk <ESC>
set encoding=utf-8
set nocompatible

set number
set relativenumber
set background=dark
"colorscheme retrobox

" --- CONFIGURACIÓN DE COLORES PARA TTY Y TMUX ---
if &term == 'linux' || &term =~ 'screen' || &term =~ 'tmux'
    " Apagamos termguicolors porque True Color (24 bits) rompe la TTY física
    set notermguicolors
    " Forzamos a Vim a usar el modo de color compatible con la TTY
    set t_Co=16
    " Cargamos retrobox en su modo adaptado a TTY
    colorscheme retrobox
else
    " Esto se aplicará solo si alguna vez abres un entorno gráfico (GUI)
    set termguicolors
    colorscheme retrobox
    set cursorline
endif


set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set nobackup
set noswapfile

set incsearch
set ignorecase
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

set scrolloff=10

let mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>
inoremap jk <ESC>

set clipboard=unnamedplus
" Permite copiar al portapapeles con Ctrl + C en modo Visual
vnoremap <leader>c :w !xclip -i -sel clipboard<CR><CR>

" Permite pegar desde el portapapeles con Ctrl + V en modo Normal
nnoremap <leader>v :r !xclip -o -sel clipboard<CR>

set mouse=a
set splitbelow
set splitright
set nowrap

nnoremap <leader>e :Lex<CR>
