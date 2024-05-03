" easy-align plugin
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" quotation mark as delimiter
let g:easy_align_delimiters = {
\ 	'"': { 'pattern': '"', 'ignore_groups': ['Comment'] },
\ 	'\': { 'pattern': '\\', }
\ }

" 行首行尾
noremap <S-S> ^
noremap <S-D> $

" 关闭自动注释
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" <C-X>被tmux吃掉了, <C-D>代替
vnoremap <C-D> <C-X>

" quick yank all
nnoremap <C-Y> :%y*<CR>

" suggestion window navigate
inoremap <C-J> <C-N>
inoremap <C-K> <C-P>

" arrow key to switch tab
nnoremap <C-Left> gT
nnoremap <C-Right> gt

"colorscheme atlas
colorscheme lucius

" vim 退出时不清空剪贴板
" autocmd VimLeave * call system("xsel -ib", getreg('+'))

" encoding
"set bomb
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" syntax highlighting 
syntax on

" 高亮当前行
set cursorline

" ,重复命令行命令(和normal结合使用)
nmap , @:

" fix backspace not working
set backspace=indent,eol,start

set hlsearch
" 搜索时不区分大小写
set ignorecase
set ruler
set number

" 单行无限延伸
set nowrap

" 使用鼠标
set mouse=a

" auto indentation
" a tab is <length of doing shiftwidth> % <tabstop>
set autoindent
set tabstop=8  " how many columns count as a tab(\t).
set shiftwidth=8 " how many columns to shift when a TAB key is pressed

" 命令菜单
set wildmenu
" set wildoptions=pum

"quick h j k l
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-H> 2h
nnoremap <C-L> 2l

vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-H> 10h
vnoremap <C-L> 10l

set showmatch   " 开启高亮显示匹配括号
set autoread    " 自动加载改动的文件

" map quick yank
noremap <S-Y> "+y<CR>

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

" 查找替换(先按*)
nnoremap <Leader>r :%s///g<Left><Left>

" fzf

" ctrl-p切换preview window
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden','ctrl-p'] " 默认关闭, ctrl-p切换
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" open file
nnoremap <silent> <C-P> :Files<CR>

" search file
" nnoremap <silent> <C-F> :BLines<CR>

" ctrl-f grep
nnoremap <silent> <C-F> :RG<CR>

" 不使用Rg(会grep文件名，不好用)
command! -bang Rg call NoRg()
function! NoRg()
	echo "Don't use Rg, use RG instead!"
endfunction

" end fzf

" toggle自动注释
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
map <C-B> :NERDTreeToggle<CR>   

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

call vundle#end()

 "vim plug
call plug#begin()

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/vim-easy-align'

call plug#end()

filetype plugin indent on    " required 

" emacs key bindings (put at the bottom because of C-K)
inoremap <C-P> <Up>
inoremap <C-N> <Down>
inoremap <C-B> <Left>
inoremap <C-F> <Right>
inoremap <C-E> <Esc>A
inoremap <C-A> <Esc>I
inoremap <C-_> <Esc>ui "C-/
inoremap <C-R> <Esc><C-R>i
inoremap <C-K> <Esc>d$i
inoremap <C-D> <Esc>lxi
inoremap <C-Y> <Esc>pi
