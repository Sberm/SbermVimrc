" =*=*=*=*=*=*= stable =*=*=*=*=*=*=

" use verticle splitting when previewing files
let g:netrw_preview = 1

" autocomplete window navigation
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" light theme
set background=light
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

set relativenumber
nnoremap <silent> <S-L> :call ToggleRelativeNumber()<CR>
function! ToggleRelativeNumber()
    if &relativenumber == 1
	set norelativenumber
    else
	set relativenumber
    endif
endfunction

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

" indent
set autoindent
set tabstop=8
set shiftwidth=8
autocmd FileType c setlocal noexpandtab tabstop=8 shiftwidth=8 softtabstop=f8
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

set wildmenu

" match parenthesis
set showmatch

" map quick copy
noremap <S-Y> "+y

set mouse=a
nnoremap <S-M> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse OFF"
    else
        set mouse=a
        echo "Mouse ON"
    endif
endfunction

set nowrap
nnoremap <S-W>w :call ToggleWrap()<CR>
function! ToggleWrap()
	if (&wrap == 1)
		set nowrap
		echo "Wrap OFF"
	else
		set wrap
		echo "Wrap ON"
	endif
endfunction

" disable auto commenting
autocmd FileType * setlocal formatoptions-=cro

" toggle auto commenting
nnoremap <S-C> :call ToggleComment()<CR>
function! ToggleComment()
	if stridx(&formatoptions, 'c') != -1
		set formatoptions-=cro
		echo "Auto comment OFF"
	else
		set formatoptions+=cro
		echo "Auto comment ON"
	endif
endfunction

" indenting while not losing visual selection
vnoremap < <gv
vnoremap > >gv

" =*=*=*=*=*=*= FZF BINDINGS START =*=*=*=*=*=*=
" files
nnoremap <silent> <C-F> :Files<CR>
" grep
nnoremap <silent> <C-S> :RG<CR>

" ctrl-p to toggle preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden','ctrl-p']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }

" Disable :Rg
command! -bang Rg call NoRg()
function! NoRg()
	echo "Don't use Rg, use RG instead!"
endfunction
" =*=*=*=*=*=*= FZF BINDINGS END =*=*=*=*=*=*=

" easy-align plugin
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
inoremap <C-A> <Esc>I
vnoremap <C-A> ^

inoremap <C-D> <Right><backspace>

inoremap <M-f> <C-O>e
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
inoremap <M-v> <C-O><C-U><C-O>zz
inoremap <C-V> <C-O><C-D><C-O>zz
vnoremap <M-v> <C-U>zz
vnoremap <C-V> <C-D>zz

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
