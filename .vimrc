" window
" C-W is available in Insert mode, map that to window ops. Set plain C-W to
" NOP so I don't need to worry about things getting deleted.
inoremap <C-W> <NOP>
inoremap <C-W>h <C-O><C-W>h
inoremap <C-W>j <C-O><C-W>j
inoremap <C-W>k <C-O><C-W>k
inoremap <C-W>l <C-O><C-W>l
inoremap <C-W>v <C-O><C-W>v
inoremap <C-W>s <C-O><C-W>s
" disable C-H in insert mode (because of C-W H)
inoremap <C-H> <NOP>
" disable S-L in normal mode (too surprising coming off of insert)
nnoremap <S-L> <NOP>

" jump to the matching angle bracket using '%'
set matchpairs+=<:>

" C-Left and C-Right in normal mode
nnoremap <C-Left> b
nnoremap <C-Right> e
" ctrl + arrow keys are good
inoremap <C-Left> <C-O>b
inoremap <C-Right> <C-O>e<C-O>a

" Same thing for meta as well
nnoremap <M-Left> b
nnoremap <M-Right> e
inoremap <M-BS> <C-W>
inoremap <M-Left> <C-O>b
inoremap <M-Right> <Esc>ea

" no wrapping
set nowrap

" C-L to center a line
nnoremap <C-L> zz
inoremap <C-L> <C-O>zz

" half page centered
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

" 's' for speed up
nnoremap sj 4j
vnoremap sj 4j
nnoremap sk 4k
vnoremap sk 4k
nnoremap sh 9h
vnoremap sh 9h
nnoremap sl 9l
vnoremap sl 9l

" use vertical splitting when previewing files
let g:netrw_preview = 1

" autocomplete window navigation
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" theme
set background=dark
colorscheme codedark
" change --INSERT-- mode text color
highlight ModeMsg ctermfg=Green

" c without copying the text
nnoremap c "_c
vnoremap c "_c

" for X forwarding of "+ register
set clipboard=unnamedplus

set jumpoptions=stack

" overwrite lazyvim's <leader> key setting of space
let mapleader = "\\"

set guicursor=n-v-c-sm-ve-r-cr-o:block-Cursor,ci-i:block-Cursor-blinkwait100-blinkon100-blinkoff100

" next match centered
nmap n nzz
nmap N Nzz

" syntax highlighting
syntax on

" paste without yanking the deleted text
vnoremap p P

" NOTE: questionable
" jump to line start/end
noremap <S-S> ^
noremap <S-D> $

" tab
nnoremap tt :tab split<CR>
nnoremap <C-T> :tab split<CR>
inoremap <C-T> <C-O>:tab split<CR>

nnoremap tn gt
nnoremap tp gT

" encoding
set fileencoding=utf-8
set encoding=utf-8

" highlight current line
set cursorline

" better backspace
set backspace=indent,eol,start

set hlsearch
set ignorecase
set ruler
set number
set wildmenu

" indentations
set autoindent
set tabstop=4
set shiftwidth=4
autocmd FileType c setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

" match parenthesis
set showmatch

" copy to clipboard
vnoremap <S-L> "+y

" disable auto commenting
autocmd FileType * setlocal formatoptions-=cro

" indenting while not losing visual selection
vnoremap < <gv
vnoremap > >gv

" =*=*=*=*=*=*= FZF BINDINGS START =*=*=*=*=*=*=
" files
nnoremap <silent> <C-F> :Files<CR>
" grep
nnoremap <silent> <C-G> :RG<CR>
" custom rg arguments
command! -bang -nargs=* RG call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case .", fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --line-number --no-heading --color=always --smart-case .", fzf#vim#with_preview(), <bang>0)
let g:fzf_vim = {}
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }
let g:fzf_vim.preview_window = ['hidden,up,50%', 'ctrl-p']
" =*=*=*=*=*=*= FZF BINDINGS END =*=*=*=*=*=*=

" =*=*=*=*=*=*= EASYALIGN BINDINGS START =*=*=*=*=*=*=
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quotation mark as delimiter
let g:easy_align_delimiters = {
\ 	'"': { 'pattern': '"', 'ignore_groups': ['Comment'] },
\ 	'\': { 'pattern': '\\', }
\ }
" =*=*=*=*=*=*= EASYALIGN BINDINGS END =*=*=*=*=*=*=

" =*=*=*=*=*=*= EMACS KEY BINDINGS START =*=*=*=*=*=*=
" on MacOS, use it with "Use Option as Meta Key" OFF, for it breaks emacs bindings
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

" command line navigation
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-F> <Right>

inoremap <M-f> <C-O>e<C-O>a
vnoremap <M-f> e
inoremap <M-b> <C-O>b
vnoremap <M-b> b

" delete a word forward
inoremap <M-d> <C-O>de

" undo and redo
" C-_ is C-/
inoremap <C-_> <C-O>u
inoremap <C-R> <C-O><C-R>

" scroll half page
inoremap <C-U> <C-O><C-U><C-O>zz
inoremap <C-D> <C-O><C-D><C-O>zz
vnoremap <C-U> <C-U>zz
vnoremap <C-D> <C-D>zz

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

" paste
" this makes C-Y behave like emacs
set virtualedit=onemore
inoremap <C-Y> <C-O>P
" in visual mode, P means it won't copy the deleted text, but in normal mode,
" P is different and it means paste before the cursor
vnoremap <C-Y> P

" C-G as esc in visual mode
vnoremap <C-G> <Esc>

" M-< M->
inoremap <M-<> <C-O>gg
inoremap <M->> <C-O>G
vnoremap <M-<> gg
vnoremap <M->> G

" quit
inoremap <C-Z> <C-O>:q<CR>
" disable C-Z in normal mode
nnoremap <C-Z> <NOP>
" =*=*=*=*=*=*= EMACS KEY BINDINGS END =*=*=*=*=*=*=
