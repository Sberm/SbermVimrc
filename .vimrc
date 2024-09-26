" disable C-X for tmux
noremap <C-X> <Nop>

" easy-align plugin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quotation mark as delimiter
let g:easy_align_delimiters = {
\ 	'"': { 'pattern': '"', 'ignore_groups': ['Comment'] },
\ 	'\': { 'pattern': '\\', }
\ }

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

" quick h j k l
nnoremap <C-j> 4j
nnoremap <C-k> 4k
nnoremap <C-H> 2h
nnoremap <C-L> 2l

vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-H> 10h
vnoremap <C-L> 10l

" match parenthesis
set showmatch
set autoread

" map quick yank
noremap <S-Y> "+y

" set mouse toggle
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

" fzf

" ctrl-p to toggle preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden','ctrl-p']
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1, 'relative': v:true } }

" ctrl-e search file (Ctrl-Entry)
nnoremap <silent> <Leader>f :Files<CR>

" ctrl-s search
nnoremap <silent> <C-S> :RG<CR>

" Disable :Rg
command! -bang Rg call NoRg()
function! NoRg()
	echo "Don't use Rg, use RG instead!"
endfunction

" end fzf

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


" toggle undo tree
nnoremap <F5> :UndotreeToggle<CR>

" indenting while not losing visual selection
vnoremap < <gv
vnoremap > >gv

" quick comment

nmap <S-F> \ci
vmap <S-F> \cigv

" NERDTree
noremap <S-B> :NERDTreeToggle<CR>   

" don't know if this works or not. for scrolling
noremap <ScrollWheelDown><ScrollWheelUp> <ScrollWheelDown>
noremap <ScrollWheelUp><ScrollWheelUp> <ScrollWheelUp>

"vundle below:"

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let g:vim_markdown_folding_style_pythonic = 1
set conceallevel=2
let g:vim_markdown_new_list_item_indent = 2


call vundle#begin()

Plugin 'terryma/vim-expand-region'

Plugin 'morhetz/gruvbox'

Plugin 'preservim/nerdcommenter'

Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'

" auto noh
Plugin 'haya14busa/is.vim'

" search with visual selections
Plugin 'nelstrom/vim-visual-star-search'

" bookmark
Plugin 'MattesGroeger/vim-bookmarks'

" undotree
Plugin 'mbbill/undotree'

Plugin 'jonathanfilip/vim-lucius'

call vundle#end()

 "vim plug
call plug#begin()

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'

call plug#end()

filetype plugin indent on

" emacs key bindings (put at the bottom because of C-K)
noremap <C-P> <Up>
noremap <C-N> <Down>
noremap <C-B> <Left>
noremap <C-F> <Right>
noremap <C-E> $
noremap <C-A> ^
" no c-k and c-d for normal

inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-E> <Esc>A
inoremap <C-A> <Esc>I
inoremap <C-_> <Esc>ui "C-/
inoremap <C-R> <Esc><C-R>i
inoremap <C-K> <Esc>ld$i
inoremap <C-D> <Esc>lxi
inoremap <C-Y> <Esc>pi

" syntax highlighting 
syntax on

"colorscheme atlas
colorscheme lucius
