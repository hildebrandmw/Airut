set spelllang=en_us
set encoding=utf-8
syntax on
set nu

" Configure Tabs
set tabstop=4
set shiftwidth=4
set expandtab
set nosmartindent

let mapleader = "\<Space>"
let maplocalleader = ","

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Easy exit from insert mode to normal mode.
" 2. F7 to move to previous tab.
" 3. F8 to move to next tab.
" 4. Easy copy to clipboard.
" 5. Remove whitespace at end of line.
inoremap jk <ESC>
noremap <F7> :tabp<CR>
noremap <F8> :tabn<CR>
map <localleader>cc :w !pbcopy<CR><CR>
nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>"

" Macros
" 1. Julia docstring macro
let @d = 'wy%O"""    p/funcOi"""O'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up Vundle Package Manager
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here
Plugin 'JuliaEditorSupport/julia-vim'
Plugin 'Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lervag/vimtex'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Vundle Package Manger
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off auto indenting because it never works right.
let b:did_indent = 1

" Turn on Python pretty highlighting
let python_highlight_all = 1

" Options for the zenburn coloring scheme
let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
colorscheme zenburn

" Disable some unicode stuff
:let g:latex_to_unicode_tab = 0

" Set up matching for text blocks
runtime macros/matchit.vim

" Highlight a vertical bar at line 81 - change color so it's not red.
let &colorcolumn=93
highlight ColorColumn ctermbg=58

" Shortcut for activating/deactivating YCM
" turn off YCM
" nnoremap <leader>y :let g:ycm_auto_trigger=0<CR> 
" " turn on YCM
" nnoremap <leader>Y :let g:ycm_auto_trigger=1<CR> 

" open NERDTree
map <C-n> :NERDTreeToggle<CR>
" enable airline tabs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='zenburn'
