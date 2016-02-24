syntax on
filetype on
filetype indent on
filetype plugin on
set nocompatible

set number
" set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd BufWritePre * :%s/\s\+$//e

set autoindent

" Setup vundle
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

" Bundles
Plugin 'bling/vim-airline'
Plugin 'git@github.com:vim-scripts/netrw.vim.git'
Plugin 'SingleCompile'
Plugin 'Tagbar'
Plugin 'The-NERD-tree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'gmarik/vundle'
Plugin 'hlissner/vim-multiedit'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ekalinin/Dockerfile.vim'


call vundle#end()
filetype plugin indent on

" Code Folding
set foldlevelstart=20
set foldmethod=indent

" Disable gvim toolbars by default
set guioptions-=T
set guioptions-=m>

" Disable netrw
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Setup pathogen
execute pathogen#infect()

" Move lines with ctrl + j/k
nnoremap <C-J> :m .+1<CR>==
nnoremap <C-K> :m .-2<CR>==
vnoremap <C-J> :m '>+1<CR>gv=gv
vnoremap <C-K> :m '<-2<CR>gv=gv

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1

" NERDTree
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>

" Tagbar
let g:tagbar_compact = 1
let g:tagbar_autofocus = 1

" Use CTRL+S to save file changes
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

nnoremap <silent> <C-S> :<C-u>Update<CR>
inoremap <c-s> <c-o>:Update<CR>

" Colors
set  t_Co=256
colorscheme Tomorrow-Night
set cursorline
set colorcolumn=80
set hlsearch

" SimpleCompile
map <F8> :SCCompile<cr>
map <F9> :SCCompileRun<cr>
autocmd Filetype cpp map <buffer> <F8> :SCCompileAF -std=c++11 <CR>
autocmd Filetype cpp map <buffer> <F9> :SCCompileRunAF -std=c++11 <CR>

" Undo dir
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir

" Indentation
vnoremap > >gv
vnoremap < <gv

" Add cyrillic keymaping
set langmap+=чявертъуиопшщасдфгхйклзьцжбнмЧЯВЕРТЪУИОПШЩАСДФГХЙКЛЗѝЦЖБНМ;`qwertyuiop[]asdfghjklzxcvbnm~QWERTYUIOP{}ASDFGHJKLZXCVBNM,ю\\,Ю\|,
" }}}`

" Add shortcuts for copy and paste from the clipboard
nnoremap <Leader>p "+p
vnoremap <Leader>y "+y

" Disable Background Color Erase (BCE) so that color schemes
" work properly when Vim is used inside tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

" Mouse
set mouse=a

" ctrlp
let g:ctrlp_max_files = 0
" The Silver Searcher
if executable('ag')
	 " Use ag over grep
	 set grepprg=ag\ --nogroup\ --nocolor

	 " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 0

endif

" Search with Ag
noremap <leader>s :Ag

" bind K to search grep word under the cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
