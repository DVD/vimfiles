setlocal expandtab
setlocal softtabstop=4

" On writing a python file always call flake8 to check it.
"autocmd BufWritePost *.py call Flake8()
"let g:flake8_ignore="E501"
let g:syntastic_python_flake8_args='--ignore=E501'
