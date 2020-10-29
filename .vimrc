"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
"                                                                              "
"                       __   _ _ _ __ ___  _ __ ___                            "
"                       \ \ / / | '_ ` _ \| '__/ __|                           "
"                        \ V /| | | | | | | | | (__                            "
"                         \_/ |_|_| |_| |_|_|  \___|                           "
"                                                                              "
"                                                                              "
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
set nocompatible              " be iMproved, required
filetype off                  " required

"------------------------------------------------------------------------------
"                        Vundle Settings
"------------------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'scrooloose/nerdtree'
  Plugin 'vim-airline/vim-airline'
  Plugin 'tomtom/tcomment_vim'
  " Plugin 'morganp/vim-SystemVerilogUVM.vim'
  Plugin 'flazz/vim-colorschemes'
  Plugin 'vim-syntastic/syntastic'
  Plugin 'Valloric/YouCompleteMe'
  "-------------------=== Git ===--------------------------------------
  Plugin 'tpope/vim-fugitive'
  Plugin 'junegunn/gv.vim'
  " Plugin 'brookhong/cscope.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------------------------------------------------------------------------------
"                                CONFIGURATIONS
"------------------------------------------------------------------------------

"---------------------------
" Functions
"---------------------------

"Diff
function! DiffToggle()
  if &diff
    diffoff
  else
    diffthis
  endif
endfunction

" Gerar o ctags
function! RunCtags()
  execute "!" . "ctags -R -f ./tags *"
  execute "!" . "set tags=./tags;"
endfunction

"---------------------------
" General Configurations
"---------------------------
set splitbelow
set splitright
set laststatus=2
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
" set smartindent
" set autoindent
set mouse=n
set ruler
set wrap "Wrap lines
set hlsearch
set showmatch
set noswapfile
syntax on
set spell spelllang=en_us
set wildmode=longest,list:longest
set completeopt=menu,preview

set cscopetag

" set colorcolumn=120

" Le o arquivo .vimrc do local executado
" set exrc
" set secure

set path+=**
set wildignore+=**/build/**
set wildignore+=**/scripts/**
set wildignore+=**/cmake/**
set wildignore+=**/trd/**
set wildignore+=**/bsp/**
set wildignore+=**/topbuild/**

" Plugin Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set list
set listchars=tab:▸\ ,trail:␣,nbsp:⍽
set highlight+=8:WarningMsg  " Use a new highlight

"Don't loose selection when indent"
xnoremap <  <gv
xnoremap >  >gv

"---------------------------
" Gui options
"---------------------------
set t_Co=256
colorscheme molokai
highlight ColorColumn ctermbg=0 guibg=red

"---------------------------
"Keymap settings
"---------------------------
" Mapea tecla leader
let mapleader = "="

"Change between .cc and h
" map <F3>   :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Enable Nerdtree
map <F2>   :NERDTreeToggle<CR>

" Abre arquivo em um painel lateral
nnoremap <F3> :vertical wincmd f<CR>

" Align the text
map <F4>   :!column -t<CR>

" Remove spaces from the end of the lines
map <F5>   :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Enable and disable numbers
map <F7>   :set nonumber!<CR>

" Enable diff
map <F8>   :call DiffToggle()<CR>

" goto definition
map <leader>] <C-]>
map <leader>t  <C-t>

" Open a new tab interfere com o comando de copiar
" map <leader>m :tabnew<CR>

map <Tab>   :tabn<CR>
map <S-Tab> :tabp<CR>

map <C-j>   :m .+1<CR>
map <C-h>   :m .-2<CR>

nnoremap <C-f> :NERDTreeFind<CR>

" Enable copy to clipboard
map <C-c> "+y<CR>

" Run Ctags
map <leader>q :call RunCtags()<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"---------------------------
" Plugins Configurations
"---------------------------
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"NERDTREE config
" let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"let NERDTreeWinSize = 50

" You complete me config
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
