setlocal expandtab

" On writing a python file always call flake8 to check it.
autocmd BufWritePost *.py call Flake8()
