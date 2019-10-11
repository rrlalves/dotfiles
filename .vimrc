set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

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
"                        PLUGINS CONFIGURATIONS
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

"gerar o ctags
" function! RunCtags()
"   let workArea = $XIP_WORKAREA
"   execute "!" . "ctags -Re -f " . workArea . "/tags" . " " . workArea
"   execute "set tags+=" . workArea . "/tags"
" endfunction


"gerar o ctags
function! RunCtags()
  execute "!" . "ctags -R -f ./tags *"
  execute "!" . "set tags=./tags;"
endfunction

"gerar o cscope
function! RunCscope()
  execute "!" . "cscope -Rb"
endfunction

"---------------------------
" General Configurations
"---------------------------

set laststatus=2
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set expandtab
" set smartindent
" set autoindent
set mouse=n
set ruler
set wrap "Wrap lines
set hlsearch
set showmatch
syntax on
set spell spelllang=en_us
" set tags=./tags

let mapleader = "="
" set colorcolumn=120
" highlight ColorColumn ctermbg=darkgray

" Le o arquivo .vimrc do local executado
" set exrc
" set secure

"set foldmethod=syntax
":VerilogErrorFormat ncverilog 2


"---------------------------
" Gui options
"---------------------------

set t_Co=256
colorscheme molokai
highlight ColorColumn ctermbg=0 guibg=red


"---------------------------
"Keymap settings
"---------------------------
"Change between .cc and h
map <F3>   :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"Align the text
map <F4>   :!column -t<CR>

"Remove spaces from the end of the lines
map <F5>   :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"Enable Nerdtree
map <F6>   :NERDTreeToggle<CR>

" Enable and disable numbers
map <F7>   :set nonumber!<CR>

" Enable diff
map <F8>   :call DiffToggle()<CR>

" goto definition with F12
map <leader>] <C-]>
map <leader>t  <C-t>

map <C-j>   :m .+1<CR>
map <C-h>   :m .-2<CR>

map <Tab>   :tabn<CR>
map <S-Tab> :tabp<CR>
map <C-n>   :tabe<CR>
map <C-w>   :close<CR>
map <C-s>   :w!<CR>

map <C-Left>  :wincmd h<CR>
map <C-Down>  :wincmd j<CR>
map <C-Up>    :wincmd k<CR>
map <C-Right> :wincmd l<CR>

"Habilia o copy e paste
map <C-c> "+y<CR>

" System_Verilog_Plugin
" nnoremap <leader>i :VerilogFollowInstance<CR>
" nnoremap <leader>I :VerilogFollowPort<CR>
" nnoremap <leader>u :VerilogGotoInstanceStart<CR>

" Run Ctags
map <leader>q :call RunCtags()<CR>
" map <leader>F12 :call RunCscope()<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Plugin Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
        if filereadable("cscope.out")
                 cs add cscope.out
                         " else add database pointed to by environment
                             elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " Find this C symbol (variable name)
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>

    " Find this definition
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>

    " Find functions calling this function
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

    " Find this text string
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

    " Find this egrep pattern
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>

    " Find this file
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>

    " Find files #including this file
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

    " Find functions called by this function
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>
endif

set list
set listchars=tab:▸\ ,trail:␣,nbsp:⍽
set highlight+=8:WarningMsg  " Use a new highlight
