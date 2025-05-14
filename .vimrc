" =*=*=*=*=*=*= STABLE START =*=*=*=*=*=*=
nnoremap <C-L> zz

" half page centered
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

" 's' for speed up
nnoremap sj 5j
vnoremap sj 5j
nnoremap sk 5k
vnoremap sk 5k
nnoremap sh 9h
vnoremap sh 9h
nnoremap sl 9l
vnoremap sl 9l

" use vertical splitting when previewing files
let g:netrw_preview = 1

" autocomplete window navigation
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" light theme
set background=dark
colorscheme lucius

" c without copying the text
nnoremap c "_c
vnoremap c "_c

" for X forwarding of "+ register
set clipboard=unnamedplus

set jumpoptions=stack

" overwrite lazyvim's <leader> key setting of space
let mapleader = "\\"

" block for normal, line for insert
set gcr=n-v-c-sm-ve-r-cr-o:block-Cursor,ci-i:ver50-Cursor-blinkwait50-blinkoff100-blinkon100

" next match centered
nmap n nzz
nmap N Nzz

" syntax highlighting
syntax on

" paste without yanking the deleted text
vnoremap p P

" jump to line start/end
noremap <S-S> ^
noremap <S-D> $

" tab
nnoremap <C-T> :tabnew<CR>
inoremap <C-T> <C-O>:tabnew<CR>
nnoremap <C-Left> gT
nnoremap <C-Right> gt
inoremap <C-Left> gT
inoremap <C-Right> gt

" encoding
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" highlight current line
set cursorline

" use , to repeat commands (be used with normal)
nmap , @:

" fix backspace not working
set backspace=indent,eol,start

set hlsearch
set ignorecase
set ruler
set number

" indentations
set autoindent
set tabstop=4
set shiftwidth=4
autocmd FileType c setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=8
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

set wildmenu

" match parenthesis
set showmatch

" map quick copy
noremap <S-Y> "+y

" disable auto commenting
autocmd FileType * setlocal formatoptions-=cro

" indenting while not losing visual selection
vnoremap < <gv
vnoremap > >gv

" =*=*=*=*=*=*= FZF BINDINGS START =*=*=*=*=*=*=
" files
nnoremap <silent> <C-F> :Files<CR>
" grep
nnoremap <silent> <C-S> :RG<CR>
" custom rg arguments
command! -bang -nargs=* RG call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case .", 1, <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case .", 1, <bang>0)
" ctrl-p to toggle preview window
let g:fzf_vim = {}
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }
" =*=*=*=*=*=*= FZF BINDINGS END =*=*=*=*=*=*=

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quotation mark as delimiter
let g:easy_align_delimiters = {
\ 	'"': { 'pattern': '"', 'ignore_groups': ['Comment'] },
\ 	'\': { 'pattern': '\\', }
\ }

" =*=*=*=*=*=*= EMACS KEY BINDINGS START =*=*=*=*=*=*=

" on MacOS, use it with "Use Option as Meta Key" OFF, it breaks emacs bindings
" (placed at the bottom because of C-K)

" basic cursor navigation
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>

vnoremap <C-P> <Up>
vnoremap <C-N> <Down>
vnoremap <C-B> <Left>
vnoremap <C-F> <Right>

inoremap <C-E> <Esc>A
vnoremap <C-E> $
" ctrl + a and ctrl + k are too good, sorry
inoremap <C-A> <Esc>I
inoremap <C-K> <C-O>d$
nnoremap <C-K> dd
" go to the start of the command line
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

inoremap <C-D> <Right><backspace>

inoremap <M-f> <Esc>ea
vnoremap <M-f> e
inoremap <M-b> <C-O>b
vnoremap <M-b> b

" delete word
inoremap <M-d> <C-O>de

" undo and redo
" C-_ is actually C-/
inoremap <C-_> <C-O>u
inoremap <C-R> <C-O><C-R>

" scroll half page
inoremap <C-U> <C-O><C-U><C-O>zz
inoremap <C-D> <C-O><C-D><C-O>zz
vnoremap <C-U> <C-U>zz
vnoremap <C-D> <C-D>zz

" center
inoremap <C-L> <C-O>zz

" save
inoremap <C-X><C-S> <C-O>:w<CR>

" quit
inoremap <C-X>q <C-O>:q<CR>

" select
inoremap <C-SPACE> <C-O>v
" cut
vnoremap <C-W> d
vnoremap <Backspace> "_d
" copy
vnoremap <M-w> y
" yank / paste
inoremap <C-Y> <C-O>P
vnoremap <C-Y> P

" first & last line
inoremap <M->> <C-O>G
vnoremap <M->> G
inoremap <M-<> <C-O>gg
vnoremap <M-<> gg

" tabs
inoremap <C-Left> <C-O>:tabprevious<CR>
inoremap <C-Right> <C-O>:tabnext<CR>

" C-G as esc in visual mode
vnoremap <C-G> <Esc>

" incremental selection
imap <M-S> <C-O><C-L>
" =*=*=*=*=*=*= EMACS KEY BINDINGS END =*=*=*=*=*=*=

" ctrl + arrow keys are good
inoremap <C-Left> <C-O>b
inoremap <C-Right> <Esc>ea
" ctrl + backspace to delete words
inoremap <C-H> <C-W>

" now that C-W is available in Insert mode, map that to window ops
inoremap <C-W>h <C-O><C-W>h
inoremap <C-W>j <C-O><C-W>j
inoremap <C-W>k <C-O><C-W>k
inoremap <C-W>l <C-O><C-W>l
inoremap <C-W>v <C-O><C-W>v
inoremap <C-W>s <C-O><C-W>s

" =*=*=*=*=*=*= STABLE END =*=*=*=*=*=*=

" =*=*=*=*=*=*= LUASNIP START =*=*=*=*=*=*=
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" =*=*=*=*=*=*= LUASNIP END =*=*=*=*=*=*=
