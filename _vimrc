set nocompatible
source $VIMRUNTIME/mswin.vim
source ~/.vundle
behave mswin

syntax on
filetype plugin on

set exrc

"about tab
set autoindent
set smartindent
set smarttab
set expandtab

" encoding . utf-8 rules!
" let $LANG="zh_CN.UTF-8" " locales
" set fileencoding=utf-8 " prefer
set ambiwidth=double
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set encoding=utf-8
set term=screen-256color

" misc
set nu
set wildmenu
set wildignore+=*.o,*.obj,.git,*.pyc,*/venv/*
set ruler
set tags=./tags,./../tags,./../../tags
" set clipboard=unnamed

" ^c^V i don't know how these about
set laststatus=2
set scrolloff=4
set lbr
set fo+=mB
set showmatch
set cin
set cino=g0:0t0(sus
" set guifont=WenQuanYi\ Micro\ Hei\ Mono
set hls
set backspace=indent,eol,start
set shiftround
" set whichwrap=b,s,<,>,[,]
set bsdir=buffer
set smartcase

set nowrap
set autoread
set autowrite

" trade off the gnome maximized bug
set showtabline=2

set noswapfile
set nobackup
set nowritebackup

" this may help with NERDTree but bad with FuzzyFinder
" set autochdir
autocmd BufEnter * lcd %:p:h

set t_Co=256
color molokai

if !has('gui_running')
    au InsertEnter * set cursorline
    au InsertLeave * set nocursorline
endif

augroup BgHighlight
    autocmd!
    autocmd WinEnter * silent! set colorcolumn=80
    autocmd WinLeave * silent! set colorcolumn=0
augroup END

" toolbar sucks
set guioptions=ir

au BufEnter * checktime
au BufNewFile,BufRead *.tt,*.treetop setf treetop
au BufNewFile,BufRead *.slim set ft=slim
au BufNewFile,BufRead *.scss set ft=scss
au BufNewFile,BufRead *.sass set ft=sass
au BufNewFile,BufRead *.coffee set ft=coffee
au BufNewFile,BufRead *.md set ft=markdown
au BufNewFile,BufRead *vundle set ft=vim
au BufNewFile,BufRead Gemfile,Rakefile,rakefile set ft=ruby
au BufNewFile,BufRead .bash_aliases set ft=sh
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
au BufRead,BufNewFile *.avdl setlocal filetype=avro-idl

autocmd FileType * set shiftwidth=4
autocmd FileType * set tabstop=4
autocmd FileType ruby,haml,html,erb,slim,yaml,scss,sass,coffee,treetop set shiftwidth=2
autocmd FileType ruby,haml,html,erb,slim,yaml,scss,sass,coffee,treetop set tabstop=2
autocmd FileType python set suffixesadd=
autocmd FileType markdown set wrap

" trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" delete trailing blank on save
fun! DelTrailingBlank()
  let _s=@/
  let l = line(".")
  let c = col(".")
  :%s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfun

" au BufWritePre * :call DelTrailingBlank()

" change the annoying paren match
hi MatchParen cterm=bold ctermbg=none ctermfg=none

" key bindings
noremap <C-T>n :tabn<cr>
noremap <C-T>p :tabp<cr>

noremap <C-\> :vs<cr>
noremap vv <C-Q>

inoremap <PageUp> <esc>gka
inoremap <PageDown> <esc>gja

" windows
noremap <C-Up> <C-W>k<C-W>_
noremap <C-Down> <C-W>j<C-W>_

noremap <C-\> :vs<cr>

" v
noremap <UP> gk
noremap <Down> gj
noremap <LEFT> h
noremap <Right> l
" a workaround
nnoremap <Esc>A <up>
nnoremap <Esc>B <down>
nnoremap <Esc>C <right>
nnoremap <Esc>D <left>

inoremap <C-Backspace> <C-w>

noremap q :w<cr>

cnoreabbrev qt tabc

"
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" on plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NerdTree
let NERDTreeIgnore = ['\env','\.vim$', '\~$', '\.pyc$', '\.o$', '\.swp$', '\.egg-info$', '^dist$', '^build$']
let NERDTreeSortOrder = ['Makefile', '\/$', '\.py$', '\.rb$', '\.md$', '\.html$', '*', '^test_', '\.swp$', '\~$']
let NERDTreeShowBookmarks = 1
let NERDTreeHightlightCursorline = 1
let NERDTreeDirArrows = 0
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" Vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_camel_case = 0
let g:vimwiki_CJK_length = 1
let g:vimwiki_list = [{'path': '~/code/wiki/vimwiki/src/',
                    \ 'path_html': '~/code/wiki/vimwiki/',
                    \ 'html_header': '~/code/wiki/vimwiki/src/tpl/head.tpl',
                    \ 'html_footer': '~/code/wiki/vimwiki/src/tpl/foot.tpl'}
                    \ ]

" minibufexplorer

" CtrlP
let g:ctrlp_root_markers = ['.ctrlp', '.git']
let g:ctrlp_custom_ignore = {
            \ 'dir': '/venv/\|/tmp/cache/\|/coverage/\|/vendor/\|/eggs/\|/\.egg-info/\|/_site/\|/_workspace/\|/Godeps/',
            \ 'file': '\.exe$\|\.so$|\.egg$'
            \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <silent> <Leader>t :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

" for a.vim
noremap <Leader>a :A<cr>

" for taglist
noremap <Leader>s :Tlist<cr>

" for ack.vim
let g:ackprg="ack-grep -H --column"

" for Hammer.vim
let g:HAMMER_BROWSER = 'w3m'

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_disabled_filetypes=['js']
let g:syntastic_quiet_messages = { "level": "style" }
let g:syntastic_go_checkers = ['gofmt']
let g:syntastic_javascript_checkers = ['eslint']

" for vim-go
" let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au BufWritePost *.go :GoImports

" for jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 0

" for rainbow
au FileType c,go,cpp,objc,objcpp call rainbow#load()
