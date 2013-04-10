map <buffer> <F5> <F2>:!gcc -Wall -o %:r % && ./%:r<CR>
map <buffer> <C-F5> <F2>:!gcc -Wall -o %:r % && ./%:r
imap <buffer> <F5> <Esc><F5>
imap <buffer> <C-F5> <Esc><F5>
setlocal tags+=~/.vim/tags,
