set nu rnu
syntax on

" All stuff for adding plugin manager, vundle
set nocompatible
filetype off

"Set the runtime path to include Vundle and initialize
" Remember to run below command, and then PluginInstall
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'dylanaraps/wal'
Plugin 'neoclide/coc.nvim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdtree'
Plugin 'jiangmiao/auto-pairs'

" Remember to run :PluginInstall whenever you get a new plugin 
" all plugins must be added before the following line
call vundle#end()
filetype plugin indent on

" This plugin/colorscheme combo ensures that vim has the same 
" colorscheme as whatever terminal is being run
colorscheme nord
" Ensures airline is using raven theme
let g:airline_theme='raven'

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('vim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" mapping F5 to compile and run whatever code I need based on file type
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype java nnoremap <F5> :w <bar> exec '!javac '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
nnoremap <silent> <F5> :!clear;gcc % -o % && ./%<CR>

