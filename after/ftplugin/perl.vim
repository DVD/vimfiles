map <buffer> <F5> :!perl ./%<CR>
map <buffer> <C-F5> :!perl ./%
imap <buffer> <F5> <Esc><F5>
imap <buffer> <C-F5> <Esc><F5>
setlocal tags=""
setlocal complete=.,w,b,u,t
"setlocal equalprg=perltidy
setlocal keywordprg=bash\ -c\ 'perldoc\ -f\ $0\ \|\|\ cpandoc\ $0'

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" Tidy selected lines (or entire file) with _t:
nnoremap <silent> <leader>t :%!perltidy -q<Enter>
vnoremap <silent> <leader>t :!perltidy -q<Enter>

" Deparse obfuscated code
"nnoremap <silent> <leader>d :!perl -MO=Deparse 2>/dev/null<cr>
"vnoremap <silent> <leader>d :!perl -MO=Deparse 2>/dev/null<cr>

let g:syntastic_perl_checkers=['perlcritic']
