" add header automatically when a .c file is created
au BufNewFile *.c,*.h,*.cpp call Headerr()

" insert function comment
function! Funcc()
	:.-1read ~/.funccmt
endfunction
:command Funcc :call Funcc()

function! Headerr()
	:.-1read ~/.headerr
endfunction
:command Headerr :call Headerr()

" crap that I don't understand
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" all modes in block
set guicursor=n-v-c-sm-i-ci-ve-r-cr-o:block

let g:python_recommended_style=0
