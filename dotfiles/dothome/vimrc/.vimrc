set nocompatible
filetype on
filetype off
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'mbbill/undotree'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/limelight.vim'
Plug 'davidhalter/jedi-vim'
call plug#end()
filetype plugin indent on
syntax on

let g:gruvbox_italic=1
let g:gruvbox_termcolors=16
set termguicolors
set bg=dark
colorscheme gruvbox

highlight Normal ctermbg=None
filetype indent on 

set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set number showcmd wildmenu lazyredraw showmatch cursorline
set incsearch hlsearch mouse=a

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

let g:limelight_conceal_ctermfg='grey'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
