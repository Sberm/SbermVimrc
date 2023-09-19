colorscheme atlas

" vim 退出时不清空剪贴板
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" encoding
set bomb
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8

" quick safe
nnoremap S :w<CR>
nnoremap Q :q<CR>

" syntax highlighting 
syntax on

" 高亮当前行
set cursorline

" ,重复命令行命令(和normal结合使用)
nmap , @:

" fix backspace not working
set backspace=indent,eol,start

set hlsearch
set ruler
set number

" 单行无限延伸
set nowrap

" 使用鼠标
set mouse=a

" auto indentation
set autoindent
set tabstop=4
set shiftwidth=4

" 命令菜单
set wildmenu
" set wildoptions=pum

"quick h j k l
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-H> 10h
nnoremap <C-L> 10l

vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-H> 10h
vnoremap <C-L> 10l

set showmatch   " 开启高亮显示匹配括号
set autoread    " 自动加载改动的文件

" map quick yank
"noremap <S-Y> :%y*<CR>
"noremap <S-Y> "*y<CR>
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
let g:fzf_vim.preview_window = ['hidden', 'ctrl-p'] " 默认关闭, ctrl-p切换
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }

" open file
nnoremap <silent> <C-P> :Files<CR>

" search file
nnoremap <silent> <C-F> :BLines<CR>

" 不使用Rg(会grep文件名，不好用)
command! -bang Rg call NoRg()
function! NoRg()
	echo "Don't use Rg, use RG instead!"
endfunction


" end fzf

" toggle自动注释
nnoremap <S-C> :call ToggleComment()<CR>
function! ToggleComment()
	if &formatoptions != 'ql'
		set formatoptions-=cro
		echo "Auto comment OFF"
	else
		set formatoptions+=cro
		echo "Auto comment ON"
	endif
endfunction



" 关闭自动注释

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


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

call plug#end()

filetype plugin indent on    " required 
