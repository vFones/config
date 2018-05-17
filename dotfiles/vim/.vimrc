set nocompatible
filetype on
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'c.vim'

call vundle#end()
filetype plugin indent on
syntax on


let g:gruvbox_italic=1
let g:gruvbox_termcolors=256
set background=dark
let g:gruvbox_contrast_dark='dark'
set t_Co=256
colorscheme gruvbox

let g:limelight_conceal_ctermfg='grey'

set tabstop=2 "impostazioni
set softtabstop=2 " per
set noexpandtab " i tab

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
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>g :Goyo<CR>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

			
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

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
