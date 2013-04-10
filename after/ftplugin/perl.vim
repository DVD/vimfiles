map <buffer> <F5> :!perl ./%<CR>
map <buffer> <C-F5> :!perl ./%
imap <buffer> <F5> <Esc><F5>
imap <buffer> <C-F5> <Esc><F5>
setlocal tags=""
setlocal complete=.,w,b,u,t
"setlocal equalprg=perltidy
setlocal keywordprg=perldoc\ -f
