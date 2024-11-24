" to match emacs key bindings' behaviors
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

" syntax highlighting
syntax on

" Add header automatically when a .c file is created
au BufNewFile *.c,*.h,*.cpp call Headerr()

" Insert function comment
function! FuncComment()
	:.-1read ~/.funccmt
endfunction
:command Fc :call FuncComment()

" Insert a comment template
function! Comment()
	:.-1read ~/.cmt
endfunction
:command C :call Comment()

" Insert license header
function! Hd()
	:.-1read ~/.headerr
endfunction
:command Headerr :call Headerr()

" All modes in block
" set guicursor=n-v-c-sm-i-ci-ve-r-cr-o:block

" \-g: rg the word under the cursor
nnoremap <leader>g :exe "RG " . expand("<cWORD>")<cr>

" next match centered
nmap n nzz
nmap N Nzz

" indent cpp with 2 spaces
autocmd FileType cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

" disable auto commenting
autocmd FileType * setlocal formatoptions-=cro

" quick yank all
nnoremap <C-Y> :%y*<CR>

" fuzzy suggest window navigate
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" arrow key to switch tab
nnoremap <C-Left> gT
nnoremap <C-Right> gt

" encoding
"set bomb
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" highlight current line
set cursorline

" use , to duplicate command-line commands (use it with normal)
nmap , @:

" fix backspace not working
set backspace=indent,eol,start

set hlsearch
set ignorecase
set ruler
set number

set nowrap

set mouse=a

" auto indentation
" a tab is <length of doing shiftwidth> % <tabstop>
set autoindent
set tabstop=8  " how many columns count as a tab(\t).
set shiftwidth=8 " how many columns to shift when a TAB key is pressed

set wildmenu

" match parenthesis
set showmatch
set autoread

" map quick yank
noremap <S-Y> "+y

nnoremap <S-W> :call ToggleMouse()<CR>
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
        echo "Mouse OFF"
    else
        set mouse=a
        echo "Mouse ON"
    endif
endfunction

nnoremap <C-W>w :call ToggleWrap()<CR>
function! ToggleWrap()
	if (&wrap == 1)
		set nowrap
		echo "Wrap OFF"
	else
		set wrap
		echo "Wrap ON"
	endif
endfunction

" find and replace (press * first)
nnoremap <Leader>r :%s///g<Left><Left>

" toggle auto command
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

" ==== FZF START ====

" ctrl-p to toggle preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden','ctrl-p']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }

" ctrl-e search file (Ctrl-Entry)
nnoremap <silent> <Leader>f :Files<CR>

" ctrl-s search
nnoremap <silent> <C-S> :RG<CR>
" <M-S> in insert mode
inoremap <silent> ß <C-O>:RG<CR>

" Disable :Rg
command! -bang Rg call NoRg()
function! NoRg()
	echo "Don't use Rg, use RG instead!"
endfunction
" ==== FZF END ====

" easy-align plugin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quotation mark as delimiter
let g:easy_align_delimiters = {
\ 	'"': { 'pattern': '"', 'ignore_groups': ['Comment'] },
\ 	'\': { 'pattern': '\\', }
\ }

" ==== EMACS KEY BINDINGS START ====

" (place at the bottom because of C-K)

" nmaps
noremap <C-P> <Up>
noremap <C-N> <Down>
noremap <C-B> <Left>
noremap <C-F> <Right>
noremap <C-E> $
noremap <C-A> ^

" imaps
" on mac, use it with "Use Option as Meta Key" OFF, unfortunately it breaks emacs
" <M-F>
inoremap ƒ <C-O>w
" <M-B>
inoremap ∫ <C-O>b
" <M-D>
inoremap ∂ <C-O>de
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-E> <Esc>A
inoremap <C-A> <Esc>I
inoremap <C-_> <C-O>u
inoremap <C-R> <C-O><C-R>
inoremap <C-K> <C-O>d$
inoremap <C-D> <Right><backspace>

" scroll half page
inoremap <C-U> <C-O><C-U><C-O>zz
" selection while scrolling
vnoremap <C-V> <C-D>
inoremap <C-V> <C-O><C-D><C-O>zz
" <M-V> to center a line
inoremap √ <C-O>zz

" save
inoremap <C-X>s <C-O>:w<CR>
inoremap <C-X><C-S> <C-O>:w<CR>
" quit
inoremap <C-X>q <C-O>:q<CR>

" copy & paste
inoremap <C-SPACE> <C-O>v
" cut
vnoremap <C-W> d
vnoremap <Backspace> "_d
" <M-W>
" copy
vnoremap ∑ y
" yank
inoremap <C-Y> <C-O>p

" <M->> <M-<> first line, last line
inoremap ˘ <C-O>G
inoremap ¯ <C-O>gg

" searching
inoremap <C-S> <C-O>/
" <M-N>
inoremap ˜ <C-O>n
" <M-M>
inoremap µ <C-O>N

" last / next position
" <M-O>
inoremap ø <C-O><C-O>
" <M-I>
inoremap ˆ <C-O><C-I>
" ==== EMACS KEY BINDINGS END ====
