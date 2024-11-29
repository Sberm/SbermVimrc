" to match emacs key bindings' behaviors
nnoremap <C-U> <C-U>zz
nnoremap <C-D> <C-D>zz

" next match centered
nmap n nzz
nmap N Nzz

" syntax highlighting
syntax on

" Add header automatically when a .c file is created
au BufNewFile *.c,*.h,*.cpp call Headerr()
" indent cpp with 2 spaces
autocmd FileType cpp setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

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

" fuzzy suggest window navigate
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" arrow key to switch tab
nnoremap <C-Left> gT
nnoremap <C-Right> gt

" encoding
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

" auto indentation
set autoindent
set tabstop=8
set shiftwidth=8

set wildmenu

" match parenthesis
set showmatch

" map quick copy
noremap <S-Y> "+y

set mouse=a
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

set nowrap
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

" ==== FZF START ====

" ctrl-p to toggle preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden','ctrl-p']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }

" ctrl-e search file (Ctrl-Entry)
nnoremap <silent> <Leader>f :Files<CR>
" <M-S>f in insert mode
inoremap <silent> ßf <C-O>:Files<CR>
inoremap <silent> <M-s>f <C-O>:Files<CR>

" ctrl-s search
nnoremap <silent> <C-S> :RG<CR>
" <M-S>s in insert mode
inoremap <silent> ßs <C-O>:RG<CR>
inoremap <silent> <M-s>s <C-O>:RG<CR>

" \-g: rg the word under the cursor
nnoremap <leader>g :exe "RG " . expand("<cWORD>")<cr>
inoremap <leader>g <C-O>:exe "RG " . expand("<cWORD>")<cr>

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
" <M-f>
inoremap ƒ <C-O>w
inoremap <M-f> <C-O>w
vnoremap ƒ w
vnoremap <M-f> w
" <M-b>
inoremap ∫ <C-O>b
inoremap <M-b> <C-O>b
vnoremap ∫ b
vnoremap <M-b> b
" <M-d>
inoremap ∂ <C-O>de
inoremap <M-d> <C-O>de

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
inoremap <C-V> <C-O><C-D><C-O>zz
vnoremap <C-U> <C-U>zz
vnoremap <C-V> <C-D>zz

" <M-v> to center a line
inoremap √ <C-O>zz
inoremap <M-v> <C-O>zz

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
" <M-w>
" copy
vnoremap ∑ y
vnoremap <M-w> y
" yank / paste
inoremap <C-Y> <C-O>p
vnoremap <C-Y> P

" <M->> <M-<> first line, last line
inoremap ˘ <C-O>G
inoremap <M->> <C-O>G
inoremap ¯ <C-O>gg
inoremap <M-<> <C-O>gg

" searching
inoremap <C-S> <C-O>/
" <M-n>
inoremap ˜ <C-O>n
inoremap <M-n> <C-O>n
" <M-m>
inoremap µ <C-O>N
inoremap <M-m> <C-O>N

" last / next position
" <M-o>
inoremap ø <C-O><C-O>
inoremap <M-o> <C-O><C-O>
" <M-i>
inoremap ˆ <C-O><C-I>
inoremap <M-i> <C-O><C-I>

" windows
" Nop C-W for it deletes a word
inoremap <C-W> <Nop>
inoremap <C-W>h <C-O><C-W>h
inoremap <C-W>j <C-O><C-W>j
inoremap <C-W>k <C-O><C-W>k
inoremap <C-W>l <C-O><C-W>l
inoremap <C-W>v <C-O><C-W>v
inoremap <C-W>s <C-O><C-W>s

" tabs
inoremap <C-Left> <C-O>:tabprevious<CR>
inoremap <C-Right> <C-O>:tabnext<CR>

" C-G as esc in visual mode
vnoremap <C-G> <Esc>

" treesitter's incremental selection
imap <C-L> <C-O><C-L>
" ==== EMACS KEY BINDINGS END ====

" starts VIM in insert mode
au BufRead,BufNewFile * startinsert
