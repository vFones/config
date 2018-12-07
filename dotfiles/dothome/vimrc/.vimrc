set nocompatible
filetype on
filetype off
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Tree plugins
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'

"Syntax
Plug 'vim-syntastic/syntastic'

"Colorschemes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'

"Visual
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

"autocomplete plugin"
Plug 'davidhalter/jedi-vim'
call plug#end()

filetype plugin indent on
syntax on

"Set gruvbox or dracula colorscheme
"let g:gruvbox_italic=1
"let g:gruvbox_termcolors=256
"let g:gruvbox_contrast_dark='dark'
"set background=dark
"set t_Co=256
let g:dracula_italic = 0
colorscheme dracula 
highlight Normal ctermbg=None

let g:limelight_conceal_ctermfg='grey'

"set tabstop=2 "impostazioni
"set softtabstop=2 " per
"set noexpandtab " i tab
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

set number " visualizza i numeri ai lati
set showcmd " visualizza il comando in basso a destra

filetype indent on " cercare i file indent

set wildmenu " autocomplete grafico
set lazyredraw
set showmatch " evidenzia parentesi
set cursorline
set incsearch " migliora ricerca
set hlsearch " evidenzia ricerca
set mouse=a " abilita puntatore

let mapleader=","
imap CapsLock <ESC>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>l :Limelight<CR>
nnoremap <leader>k :Limelight!<CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:goyo_width = 80
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
