" add header automatically when a .c file is created
au BufNewFile *.c,*.h,*.cpp call Headerr()

"/** @brief
 "*  
 "*  
 "*  
 "*  @param
 "*  @param
 "*  @return
 "*/
" insert function comment
function! Funcc()
	:.-1read ~/.funccmt
endfunction
:command Funcc :call Funcc()


"/*-*- coding:utf-8                                                          -*-│
"│vi: set net ft=c ts=2 sts=2 sw=2 fenc=utf-8                                :vi│
"╞══════════════════════════════════════════════════════════════════════════════╡
"│ Copyright 2023 Howard Chu                                                    │
"│                                                                              │
"│ Permission to use, copy, modify, and/or distribute this software for         │
"│ any purpose with or without fee is hereby granted, provided that the         │
"│ above copyright notice and this permission notice appear in all copies.      │
"│                                                                              │
"│ THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL                │
"│ WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED                │
"│ WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE             │
"│ AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL         │
"│ DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR        │
"│ PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER               │
"│ TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR             │
"│ PERFORMANCE OF THIS SOFTWARE.                                                │
"╚─────────────────────────────────────────────────────────────────────────────*/
" insert code header
function! Headerr()
	:.-1read ~/.headerr
endfunction
:command Headerr :call Headerr()


" crap that I don't understand
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
