set nocompatible              " be iMproved, required
"filetype plugin on                  " required
"filetype off <- Prev settings
filetype plugin indent on

syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/opt/homebrew/opt/fzf
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
" Plugin 'itchyny/lightline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arcticicestudio/nord-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'dense-analysis/ale'
"Plugin 'ycm-core/YouCompleteMe'
Plugin 'tabnine/YouCompleteMe'
Plugin 'soywod/himalaya', {'rtp': 'vim'}
Plugin 'preservim/nerdtree'
Plugin 'beautify-web/js-beautify'
Plugin 'junegunn/fzf.vim'
Plugin 'lervag/vimtex'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'frazrepo/vim-rainbow'
Plugin 'taglist.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rust-lang/rust.vim'
"Plugin 'Konfekt/FastFold'
"Plugin 'tmhedberg/SimpylFold'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:airline#extensions#tabline#enabled = 1
set showcmd
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
" #####################################################################
"  Provider
" #####################################################################
let g:python3_host_prog = '/Library/Developer/CommandLineTools/usr/bin/python3'
" #####################################################################
" Styles
" #####################################################################
" Line number display
set number relativenumber
set nu rnu
set laststatus=2
set tabstop=4
set shiftwidth=4
set expandtab
set wildmenu
set fdm=manual
"################################################################################ 
"Colors
"################################################################################ 
colorscheme nord
set bg=dark
hi Normal guibg=NONE 
"ctermbg=NONE ctermfg=7
hi Visual ctermbg=7 ctermfg=0

"################################################################################ 
"   Rainbow
"################################################################################ 
let g:rainbow_active = 1

let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"################################################################################ 
"Compiler Settings
"################################################################################ 
" Use homebrew's clangd
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
"################################################################################
" Tex Settings
"################################################################################
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'
" removed -pvc
let g:vimtex_compiler_latexmk_engines = ''
let g:vimtex_compiler_latexmk = {
        \ 'executable' : 'latexmk',
        \ 'options' : [
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
        \ ],
        \}
    let g:vimtex_compiler_latexmk_engines = {
        \ '_'                : '-xelatex',
        \ 'pdflatex'         : '-pdf',
        \ 'dvipdfex'         : '-pdfdvi',
        \ 'lualatex'         : '-lualatex',
        \ 'xelatex'          : '-xelatex',
        \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
        \ 'context (luatex)' : '-pdf -pdflatex=context',
        \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
        \}
"################################################################################
" NerdTree
"################################################################################
let NERDTreeQuitOnOpen=1
nnoremap <C-n> :NERDTreeToggle<CR>
"################################################################################
" Vimwiki
"################################################################################
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++':'cpp', 'javascript':'javascript'}
let g:vimwiki_list = [wiki]
autocmd FileType vimwiki inoremap <silent><buffer> <CR> <C-]><Esc>:VimwikiReturn 3 3<CR>
autocmd FileType vimwiki inoremap <silent><buffer> <S-CR> <Esc>:VimwikiReturn 2 2<CR>
"################################################################################
"Custom Key Maps
"################################################################################
noremap H gT
noremap L gt
" fzf
nnoremap / /\v
nnoremap <c-p> :Files<CR>
nnoremap <c-f> :Rg<CR>
" run in current buffer
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd filetype cpp nnoremap <F9> <esc>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp inoremap <F9> <esc>:w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype sh nnoremap <F9> <esc>:w<CR>:!%:p<CR>
autocmd filetype sh inoremap <F9> <esc>:w<CR>:!%:p<CR>
autocmd filetype rust nnoremap <F9> <esc>:w<CR>:!cargo build<CR>
autocmd filetype rust inoremap <F9> <esc>:w<CR>:!cargo build<CR>
" Navigate split pane
nmap <silent> <c-k> <C-W>k
nmap <silent> <c-j> <C-W>j
nmap <silent> <c-h> <C-W>h
nmap <silent> <c-l> <C-W>l
nmap <C-Right> :wincmd l<CR>:vertical resize-1<CR>:wincmd p<CR>
nmap <c-Left> :wincmd h<CR>:vertical resize-1<CR>:wincmd p<CR>
nmap <C-Up> :wincmd k<CR>:resize-1<CR>:wincmd p<CR>
nmap <C-Down> :wincmd j<CR>:resize-1<CR>:wincmd p<CR>
nmap <leader>wh :wincmd K<CR>
nmap <leader>wv :wincmd H<CR>
" C''lose matching braces 'and' quotations''
"inoremap { '{<CR>}'<Esc>ko(kj)
"inoremap ( ()<Esc>i
"inoremap { {}<Esc>i
"inoremap [ []<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
""vnoremap ' :s/\%V\(\_.*\)\%V\_./'\1'/<CR>
vnoremap "" :s/\%V\(.*\)\%V\(.\)/"\1\2"/<CR><C-o>
vnoremap '' :s/\%V\(.*\)\%V\(.\)/'\1\2'/<CR><C-o>
vnoremap (( :s/\%V\(.*\)\%V\(.\)/(\1\2)/<CR><C-o>
vnoremap {{ :s/\%V\(.*\)\%V\(.\)/{\1\2}/<CR><C-o>
 "Rustfmt
let g:rust_clip_command = 'pbcopy'
"vnoremap || :s/\%V\(.*\)\%V\(.\)/[\1\2]/<CR><C-o>
"nmap <silent> <c-U> : resize+10
"nmap <silent> <c-D> : resize-10

" let g:himalaya_mailbox_picker = 'native' | 'fzf'
" Ale
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
nnoremap <C-z> :ALEGoToDefinition<CR>
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
