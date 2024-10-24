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
function! Headerr()
	:.-1read ~/.headerr
endfunction
:command Hd :call Headerr()

" Crap that I don't understand
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" All modes in block
set guicursor=n-v-c-sm-i-ci-ve-r-cr-o:block

let g:python_recommended_style=0
