"Stop running in vi-compatible mode.
set nocompatible

" Just in case default configuration says something else
colorscheme default

"Use light font colors
set background=dark

"Do not run in paste mode. It is for PASTING only
set nopaste

"Set indentation rules
set shiftwidth=4
set ts=4

"Show the current mode on the last line
set showmode

""Write changes in the buffer to the hard drive when 25 new chars are typed.
set updatecount=0

"Hide the mouse when writing
set mousehide

"Use the mouse everywhere
set mouse=a

"Highlight all matches to the current search
set hlsearch

"Search as the search expression is being typed
set incsearch

"Use smart case search
set ignorecase
set smartcase

"Enable syntax highlighting
syntax on

"Display current line and char numbers
set ruler

"Display line numbers
set number

"Only for GUI version
if has('gui_running')
	"Set default color scheme
	colorscheme torte
	"Do not display the menu in GUI
	set guioptions-=m
	set guioptions-=T

	"Paste with Shift+Insert and Ctrl+V
	nnoremap <S-Insert> <MiddleMouse>
	inoremap <S-Insert> <MiddleMouse>
	inoremap <C-v> "+p
	inoremap <C-v> <C-O>"+p

	"Auto complete with Ctrl+Space
	"imap <c-space> <c-x><c-o><c-p>
endif

"Highlight cursor line
set cursorline
hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=NONE guibg=#2d2d2d guifg=NONE

"Start spell checking
set spell spelllang=bg,en_us
"Fix spell check error highlight
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"Be quiet :)
set noerrorbells

"Complete partial commands
set wildmenu
set wildmode=list:longest

"Start filetype plugin
filetype plugin indent on

"load pathogen managed plugins
call pathogen#infect()

"Set the window status line and make it always visible.
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}

function! ToggleCopyMode()
	if &mouse =~ "a"
		set mouse=""
	else
		set mouse=a
	endif
	set nu!
endfunction

"Save with F2
nmap <F2> :update!<CR>
imap <F2> <C-O>:update!<CR>

map <C-F11> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Toggle the taglist
nnoremap <silent> <F8> :TlistToggle<CR>

"Toggle copy mode
map <F9> :call ToggleCopyMode()<CR>
imap <F9> <Esc><F9>

"Remove highlight from last search
nohl
nmap <F12> :nohl<CR>
imap <F12> <C-O><F12>

set pastetoggle=<F7>

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC><F3>

let mapleader=','
vnoremap <Leader>s :sort<CR>
nnoremap <Leader>o :CtrlP<CR>

" Friendlier indentation
vnoremap < <gv
vnoremap > >gv

nmap sj :SplitjoinSplit<cr>
nmap sk :SplitjoinJoin<cr>

" Fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gD <c-w>h<c-w>c:diffoff<CR>
nnoremap <Leader>gc :Gcommit<CR>

" YankRing
nmap <silent> <C-F12> :YRShow<CR>
imap <silent> <C-F12> <Esc><C-F12>

"if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
"endif

nmap <F6> :1000sp ~/todo.tasks<CR>:1<CR>

"au BufNewFile,BufRead *.plpgsql set filetype=pgsql
"au BufNewFile,BufRead *.pgsql set filetype=pgsql
au BufNewFile,BufRead *.plpgsql set filetype=plsql
au BufNewFile,BufRead *.pgsql set filetype=plsql
au BufRead,BufNewFile *.wiki                set filetype=mediawiki

" Uncomment the following to have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif

au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

highlight RedundantWhitespace ctermbg=red guibg=red
match RedundantWhitespace /\s\+$\| \+\ze\t/

" Always open and focus the quickfix list after a grep
autocmd QuickFixCmdPost *grep* if getqflist() != [] | copen | endif

" CtrlP plugin settings
let g:ctrlp_max_files=0
