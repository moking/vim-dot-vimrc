set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
filetype plugin indent on    " required
syntax on
set tabstop=4
set shiftwidth=4
nmap w <C-w>
set cc=80
"set cursorline
"set cursorcolumn
set textwidth=0
set wrapmargin=0
set wrap
set linebreak 
set listchars=tab:\|-,space:.
set listchars=tab:>·,trail:~,extends:>,precedes:<,space:␣


set expandtab
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

"hi cursorline cterm=none term=none
"hi cursorcolumn cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
"highlight CursorLine guibg=#303000 ctermbg=244
"highlight CursorColumn guibg=#303000 ctermbg=244
syntax enable

set spelllang=en_gb
set spellfile=~/.vim/spell.en.utf-8.add

nmap ff <c-]>
nmap <space> <c-t>
nmap t <c-\>
nmap cs <esc>:cs find 
imap sx <esc>:w<return>
map <C-x>2 <esc>:split<return>
map <C-x>3 <esc>:vsplit<return>
map <C-x>0 <esc>:q<return>
map <c-x>1 <esc>:only<return>
nmap rb o<enter>Reviewed-by: Fan Ni <fan.ni@samsung.com><enter><esc>
nmap tb o<enter>Tested-by: Fan Ni <fan.ni@samsung.com><enter><esc>
nmap <f2> <esc>:w<return>
imap <f2> <right><esc>:w<return>
nmap e* $a /*  */<esc>hh
nmap e/ $a //<esc>a<space>

nmap c* ^a/*  */<esc>hh==ll
nmap c/ ^a//<esc>a<space><esc>==ll
nmap <F3> <esc>:set list!<return>
nmap <F1> <esc>:q<cr>
nmap q :q<cr>
nmap <F4> <esc>:set expandtab!<return>
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
map <C-x>f <esc>:MRU<return>
nmap ; <esc>:
tnoremap <Esc> <C-\><C-n>
nmap <F5> <esc>:GitGutterQuickFix \| copen <return>
nmap <F12> <esc>:source %<return>

" set the runtime path to include Vundle and initialize
"Plugin 'VundleVim/Vundle.vim'
set rtp+=~/.vim/Vundle.vim
call vundle#begin('~/.vim/bundles')
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'vim-scripts/OmniCppComplete'
Plugin 'supertab'
Plugin 'taglist.vim'
Plugin 'Colour-Sampler-Pack'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'The-NERD-Commenter'
Plugin 'cscope_macros.vim'
Plugin 'echofunc.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'AutoClose'
Plugin 'vim-dict'
Plugin 'gelguy/wilder.nvim'
Plugin 'skywind3000/vim-auto-popmenu'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'
call vundle#end()            " required

call wilder#setup({'modes': [':', '/', '?']})


let g:apc_enable_ft = {'*':1}
"let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

set cpt=.,k,w,b
set completeopt=menu,menuone,noselect
set shortmess+=c

filetype plugin on
set omnifunc=syntaxcomplete#Complete

au BufNewFile,BufRead /tmp/mutt*  setf mail
au BufNewFile,BufRead /tmp/mutt*  set ai et tw=68 spell

set spell spelllang=en_gb

let g:vimwiki_list = [{'path': '~/vimwiki/src/',
			\ 'syntax': 'markdown', 'ext': '.md',
			\ 'path_html': '~/vimwiki/html/'}]

let g:vimwiki_custom_wiki2html='~/.vim/bundles/vimwiki/autoload/vimwiki/customwiki2html.sh'
"colorscheme gruvbox
