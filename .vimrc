set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on

call plug#begin('~/.vim/plugged')
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'scrooloose/syntastic'  
  Plug 'Shougo/unite-outline'
  Plug 'Shougo/unite-session'
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimproc.vim'
  Plug 'ctrlp.vim'
  Plug 'dyng/ctrlsf.vim'
  Plug 'raimondi/delimitmate'
  Plug 'lambdalisue/unite-grep-vcs'
  Plug 'mxw/vim-jsx'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'pangloss/vim-javascript'
  Plug 'tpope/vim-sensible'
  Plug 'sgur/unite-qf'
  Plug 'tomtom/tComment_vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tsukkee/unite-help'
  Plug 'vim-airline/vim-airline'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'scrooloose/nerdtree'
  Plug 'lambdatoast/elm.vim'
  Plug 'zhaocai/GoldenView.Vim'
  Plug 'kana/vim-arpeggio'
  Plug 'kana/vim-operator-user'
  Plug 'kana/vim-textobj-fold'
  Plug 'kana/vim-textobj-function'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'
  Plug 'tmhedberg/matchit'
  Plug 'justinmk/vim-sneak'
  Plug 'tommcdo/vim-exchange'
  Plug 'Konfekt/FastFold'
  Plug 'thinca/vim-textobj-function-javascript'
  Plug 'rhysd/vim-textobj-anyblock'
  Plug 'Chiel92/vim-autoformat'
  Plug 'mileszs/ack.vim'
  Plug 'whatyouhide/vim-textobj-xmlattr'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'lambdalisue/unite-grep-vcs'
  Plug 'tsukkee/unite-help'
  Plug 'Shougo/echodoc.vim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'carlitux/deoplete-ternjs'
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
  Plug 'morhetz/gruvbox'
  Plug 'elzr/vim-json'
  Plug 'junegunn/vim-easy-align'
  Plug 'tpope/vim-sleuth'
  Plug 'groenewege/vim-less'
  Plug 'Slava/vim-spacebars'
  Plug 'djoshea/vim-autoread'
call plug#end()
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

set completeopt-=preview
" Use nerdtree instead of basic explorer
cabbrev E NERDTreeToggle

" Use gruvbox color scheme
colorscheme gruvbox
set background=dark    " Setting dark mode

" call arpeggio#map('icvx', '', 0, 'jk', '<Esc>')

" No paste mode
autocmd InsertLeave * set nopaste
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

autocmd FileType c,cpp,java,php,jsx,js,javascript,less,sass,css,json,txt,md autocmd BufWritePre <buffer> :%s/\s\+$//e

" Unite default sort order
call unite#filters#sorter_default#use(['sorter_length'])

" Fold settings
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
set fillchars+=vert: 

set shell=/bin/bash
" set noai

" Don't mind when changing buffer if its unsaved and modified
set hidden

let NERDSpaceDelims=1
set runtimepath^=~/.vim/bundle/ctrlp.vim

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

let g:deoplete#auto_complete_start_length = 1
" let g:jsx_ext_required = 0

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Navigate buffers easily
nnoremap <C-k> :bnext<CR>
nnoremap <C-j> :bprevious<CR>

" Visual mode: Select stuff with shift + arrows
nmap <S-Up> v<Up>
nmap <S-Down> v$
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

nnoremap <expr> gP '`[' . strpart(getregtype(), 0, 1) . '`]'
nnoremap J mzJ`z
nnoremap K i<cr><Esc>k$
nnoremap Y y$
nnoremap ` '
nnoremap gV `[v`]
nnoremap gj j
nnoremap gk k
nnoremap j gj
nnoremap k gk
nnoremap x "_x
vnoremap x "_x
nnoremap <silent><space>p :Unite file_rec/git<cr>
nnoremap <silent><space>o :Unite -silent buffer<cr>
nnoremap <silent><space>f m':Unite outline<cr>
nnoremap ° :'<,'>g/^/norm 
vnoremap ° :g/^/norm
map ® :set rnu!<cr>
map › <ESC>bi
imap ƒ <ESC><Right>wi
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Remap non-breaking space char to normal space
imap   <SPACE>
nnoremap <C-W>m :only<ESC>
" Ctrl right --> end of word
nnoremap <M-F> e
" Alt bindings
nnoremap ‘ :noh<CR>
nnoremap • :bd<CR>
nnoremap •! :bd!<CR>

" Navigating in completion popup menu
inoremap <expr> <Down> pumvisible() ? "\<Down>" : "<Down>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <Cr> pumvisible() ? "\<C-y>" : "\<Cr>"

nnoremap <C-s><C-f> :CtrlSF 
nnoremap ı :IndentGuidesToggle<CR>

" Better manual indent
vnoremap < <gv
vnoremap > >gv

vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap ø i<CR><ESC>

let g:vim_json_syntax_conceal = 0
let g:airline#extensions#tabline#enabled = 1
let g:NERDTreeQuitOnOpen=1
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
" let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
let g:goldenview__enable_default_mapping=0
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--vimgrep -i --silent'
let g:unite_enable_ignore_case = 1
let g:unite_enable_start_insert = 1
let g:unite_prompt = '» '
let g:unite_source_history_yank_enable =1
let g:unite_split_rule = 'bot'
let g:unite_winheight = 15
let g:ack_qhandler = 'Unite qf'

let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Disable greedy pattern matching default
set nogdefault
set nogd

" Update automatically files that have changed (and not modified)
set autoread

" Show line numbers
set number

"
" Folding
"

set foldmethod=syntax           "fdm:   fold by the indentation by default
set foldnestmax=10              "fdn:   deepest fold is 10 levels
set nofoldenable                "nofen: don't fold by default
set foldlevel=1

"
" Search
"

set incsearch                   "is:    automatically begins searching as you type
set hlsearch                    "hls:   highlights search results; ctrl-n or :noh to unhighlight

"
" Programming
"

syntax on                       "syn:   syntax highlighting
set showmatch                   "sm:    flashes matching brackets or parenthasis
set matchtime=3                 "mat:   How long to flash brackets

"
" Tabs
"

set tabstop=2                   "ts:    number of spaces that a tab renders as
set shiftwidth=2                "sw:    number of spaces to use for autoindent
set softtabstop=2               "sts:   number of spaces that tabs insert
set smarttab                    "sta:   helps with backspacing because of expandtab
set expandtab                   "et:    uses spaces instead of tab characters

" Syntastic
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
autocmd FileType javascript,jsx let b:syntastic_checkers = findfile('.eslintrc', '.;') != '' ? ['eslint'] : ['standard']

" Show cursorline on insert mode
augroup CursorLine
  au!
  au InsertEnter * setlocal cursorline
  au InsertLeave * setlocal nocursorline
augroup END
