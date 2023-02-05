" syntax highlighting 
syntax on

" 将工作目录移动到当前文件编辑的目录
" 慎用
"set autochdir

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
set wildoptions=pum

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"quick h j k l
nnoremap <C-j> 5j
nnoremap <C-k> 5k
nnoremap <C-H> 10h
nnoremap <C-L> 10l

vnoremap <C-j> 5j
vnoremap <C-k> 5k
vnoremap <C-H> 10h
vnoremap <C-L> 10l

" tab
nnoremap <S-t> :tabnew %<CR>
nnoremap <C-Z> gt

" S- for switch tab
"noremap <S-> gt



set showmatch   " 开启高亮显示匹配括号
set autoread    " 自动加载改动的文件

" map quick yank
noremap <S-Y> :%y+<CR>

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

" 第一行代表运行 CompileRunGcc 函数，第二行代表定义函数，三至五行代表函数运行内容，第六行代表函数结束。exec 表示执行命令；% 表示当前文件名；%< 表示当前文件名去掉后缀的名字；time 选项表示回显程序运行时间。
" F9 一键编译
nnoremap <F9> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec '!g++ -std=c++17 % -o %<'
    exec '!time ./%<'
endfunc

" F12 清屏
nnoremap <F12> :call Clss()<CR>
func! Clss()
    exec '!clear'
endfunc

" ycm 信息窗口toggle (很重要!)
nnoremap <C-I> <Plug>(YCMHover)

" using environment variable to toggle color theme
let $Dark=0
nnoremap <silent><F2> : call ChangeTheme()<CR>
function! ChangeTheme()
	if($Dark==0)
		set background=dark
		colorscheme gruvbox
		let $Dark=1
	else
		colorscheme sameditor
		let $Dark=0
	endif
endfunction




" Press * to search for the term under the cursor or a visual selection and
" then press a key to replace all instances of it in the current file
nnoremap <Leader>r :%s///g<Left><Left>
"nnoremap <Leader>rc :%s///g<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors)
nnoremap <silent> s* : let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" fzf

" fzf window and preview window
let g:fzf_layout = { 'down': '60%' }

" let g:fzf_preview_window = ['down,20%', 'ctrl-/']
" commented because preview window is set in .bash_profile

" \ + enter : buffer
nnoremap <silent> <Leader><CR> :Buffers<CR>

" ctrl + f: search file
nnoremap <silent> <C-F> :BLines<CR>

" \ + f: open file
nnoremap <silent> <Leader>f :Files<CR>

" ctrl + p: search in working directory
nnoremap <silent> <C-P> :RG<CR>



" Allow passing optional flags into the Rg command.
" Example :Rg myterm -g '*.md'
" Rg works like ripgrep
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

let g:fzf_tags_command = 'ctags -R'

" dynamicly changes Rg (type in :RG)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  " 可以在这里使用?来toggle preview window, 也可以在.bash_profile 里面改
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec,'right,60%','btab'), a:fullscreen) " cannot use (spec,'left','ctrl-/') , ctrl-/ doesn't work on mac
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" BD
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" end fzf



" indenting while not losing visual selection
vnoremap < <gv
vnoremap > >gv


"use c for quick comment
"if you don't use c in visual mode, it won't go restore visual selection
"but want the lines below to be recursive though because \ci is mapped to
"auto comment in plugin

nmap <S-F> \ci 
vmap <S-F> \cigv

"vscode theme
"set t_Co=256
"set t_ut=
"autocmd vimenter * ++nested colorscheme codedark

" sam editor theme
colorscheme sameditor

" another colorscheme
"colorscheme desert 


"gruvbox theme
"autocmd vimenter * ++nested colorscheme gruvbox
"set background=dark


" NERDTree
map <F10> :NERDTreeToggle<CR>   

" don't know if this works or not. for scrolling
noremap <ScrollWheelDown><ScrollWheelUp> <ScrollWheelDown>
noremap <ScrollWheelUp><ScrollWheelUp> <ScrollWheelUp>

" YouCompleteMe

" Python Semantic Completion
let g:ycm_python_binary_path = '/usr/bin/python3'
" C family Completion Path
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 跳转快捷键
nnoremap <C-X>k :YcmCompleter GoToDeclaration<CR>|
nnoremap <C-X>h :YcmCompleter GoToDefinition<CR>| 
nnoremap <C-X>j :YcmCompleter GoToDefinitionElseDeclaration<CR>|

" 停止提示是否载入本地ycm_extra_conf文件
let g:ycm_confirm_extra_conf = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files = 1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" YCM no diagnositic popup message
let g:ycm_echo_current_diagnostic = 0 

" YCM diagnostic signs and highlighting
" let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_error_symbol = 'ER'
let g:ycm_warning_symbol = 'WA'


" ycm plugin no auto preview window
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" Configuration file for vim set modelines=0		" CVE-2007-2438 " Normally we use vim-extensions. If you want true vi-compatibility " remove change the following statements set nocompatible	" Use Vim defaults instead of 100% vi compatibility set backspace=2		" more powerful backspacing " Don't write backup file if vim is being called by "crontab -e" au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

"vundle below:"

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

let g:vim_markdown_folding_style_pythonic = 1
set conceallevel=2
let g:vim_markdown_new_list_item_indent = 2



call vundle#begin()

Plugin 'morhetz/gruvbox'

Plugin 'preservim/nerdcommenter'

Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'

Plugin 'ycm-core/YouCompleteMe' 

" auto noh
Plugin 'haya14busa/is.vim'

" search with visual selections
Plugin 'nelstrom/vim-visual-star-search'

" bookmark
Plugin 'MattesGroeger/vim-bookmarks'

" undotree
Plugin 'mbbill/undotree'

call vundle#end()            " required

filetype plugin indent on    " required 这就是使得防止自动注释失效的命令

 "vim plug
call plug#begin()

Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

call plug#end()


" NERDTree's File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NERDTree mapping
let NERDTreeMapOpenInTabSilent='<C-T>'
let NERDTreeMapOpenSplit='<C-X>'
let NERDTreeMapOpenVSplit='<C-V>'

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" 关闭自动注释
" 将自动换行加上注释的行为，调整为默认关闭。但可以通过 Shift + x 开启.(下面14行的作用)

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" toggle auto comment
nnoremap <S-X> :call ToggleComment()<CR>
function! ToggleComment()
	if &formatoptions != 'ql'
		set formatoptions-=cro
		echo "Auto comment OFF"
	else
		set formatoptions+=cro
		echo "Auto comment ON"
	endif
endfunction


" toggle undo tree
nnoremap <F5> :UndotreeToggle<CR>

" auto c++ header (ctrl + s)
function AddTemplate(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = $USER
    let substDict["date"] = strftime("%Y %b %d %X")
    "exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

"autocmd BufNewFile *.c,*.cc,*.cpp,*.h call AddTemplate("~/tmpl/tmpl.cpp")
nnoremap <C-S> :call AddTemplate("~/tmpl/tmpl.cpp")<CR>


