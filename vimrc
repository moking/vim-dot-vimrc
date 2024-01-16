set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-fugitive'
Plugin 'supertab'
Plugin 'taglist'
Plugin 'nerdcommenter'
Plugin 'chelper.vim'
Plugin 'taghelper.vim'
Plugin 'echofunc'
Plugin 'vimwiki'
Plugin 'awesome-vim-colorschemes-master'
Plugin 'vim-latex'
Plugin 'vim-gitgutter'
Plugin 'vim-autoclose'
Plugin 'vim-g'
Plugin 'mileszs/ack.vim'
Plugin 'conque-term-vim'
Plugin 'vim-helm'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
syntax on
set tabstop=4
set shiftwidth=4
nmap w <C-w>
set cc=80

set cursorline
set cursorcolumn
hi cursorline cterm=none term=none
hi cursorcolumn cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=15
highlight CursorColumn guibg=#303000 ctermbg=32

nmap ff <c-]>
nmap <space> <c-t>
nmap t <c-\>
nmap cs <esc>:cs find 
set laststatus=2
set statusline=%<%f\ %h%m%r\ %1*%{taghelper#curtag()}%*%=%-14.(%l,%c%V%)\ %P
set statusline+=%{EchoFuncGetStatusLine()}
highlight statusline ctermbg=red ctermfg=white
"set guioptions -=T
set guifont=Lucida\ Console\ Italic\ 11
nmap rb o<enter>Reviewed-by: Fan Ni <fan.ni@samsung.com><enter><esc>
nmap tb o<enter>Tested-by: Fan Ni <fan.ni@samsung.com><enter><esc>

syntax enable

set spelllang=en_gb
set spellfile=~/.vim/spell.en.utf-8.add

au BufNewFile,BufRead /tmp/mutt*  setf mail
au BufNewFile,BufRead /tmp/mutt*  set ai et tw=68 spell

set spell spelllang=en_gb

let g:vimwiki_list = [{'path': '~/vimwiki/src/',
			\ 'syntax': 'markdown', 'ext': '.md',
			\ 'path_html': '~/vimwiki/html/'}]

let g:vimwiki_custom_wiki2html='~/.vim/bundle/vimwiki/autoload/vimwiki/customwiki2html.sh'

"colorscheme default
"set fdm=syntax

imap sx <esc>:w<return>

"set number 
set textwidth=0
set wrapmargin=0
set wrap
set linebreak 

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"set clipboard+=unnamed  " use the clipboards of vim and win
"set paste               " Paste from a windows or from vim
"set go+=a               " Visual selection automatically copied to the clipboard
nmap <f2> <esc>:w<return>
imap <f2> <right><esc>:w<return>
nmap e* $a /*  */<esc>hh
nmap e/ $a //<esc>a<space>

nmap c* ^a/*  */<esc>hh==ll
nmap c/ ^a//<esc>a<space><esc>==ll

"set list
set listchars=tab:\|-,space:.
"set list
set expandtab
nmap <F3> <esc>:set list!<return>
"colorscheme darkblue
"colorscheme materialbox
colorscheme evening
nmap <F1> <esc>:q<cr>
nmap q :q<cr>
nmap <F4> <esc>:set expandtab!<return>

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nmap <F5> <esc>:GitGutterQuickFix \| copen <return>
tnoremap <Esc> <C-\><C-n>

"set editor='vim + -c "set textwidth=72" -c "set wrap" -c "set nocp" -c "?^$"'
"set pager="vim -R"
"bind editor <Tab> complete-query
"
nmap ; <esc>:

call plug#begin()

if has('nvim')
  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction

  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
else
  Plug 'gelguy/wilder.nvim'

  " To use Python remote plugin features in Vim, can be skipped
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

call wilder#setup({'modes': [':', '/', '?']})

