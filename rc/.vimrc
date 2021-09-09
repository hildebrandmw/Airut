" install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

set path+=**
set wildmenu

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Trim whitespce before write
autocmd BufWritePre * :call TrimWhitespace()

" Soft wrapping
command! -nargs=* Wrap set wrap linebreak nolist
:set showbreak=…

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <ESC>
noremap <F7> :tabp<CR>
noremap <F8> :tabn<CR>

nnoremap <silent> <F5> :call TrimWhitespace()<CR>

call plug#begin('~/.vim/plugged')
    Plug 'vim-scripts/Zenburn'
    Plug 'scrooloose/nerdtree'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lervag/vimtex'
    Plug 'tpope/vim-commentary'
    if has('nvim')
        Plug 'neovim/nvim-lspconfig'
    end
call plug#end()

" Add "!" to keywords
autocmd FileType julia :set iskeyword+=!

" Turn off auto indenting because it never works right.
let b:did_indent = 1

" Turn on Python pretty highlighting
let python_highlight_all = 1

" Options for the zenburn coloring scheme
let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
colorscheme zenburn

" Set up matching for text blocks
runtime macros/matchit.vim

" Highlight a vertical bar at line 81 - change color so it's not red.
let &colorcolumn=93
highlight ColorColumn ctermbg=58

" open NERDTree
map <C-n> :NERDTreeToggle<CR>
" enable airline tabs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='zenburn'
