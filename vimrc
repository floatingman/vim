" don't bother with vi compatibility
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin indent on

" set to reload file if changed outside of vim
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ','
let g:mapleader = ','

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump 5 lines when running out of the screen
set scrolljump=5

" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3

" Lower the time that Vim waits to look for matching keymaps (ms)
set timeoutlen=400

" Easy movement between buffers
let g:buftabs_only_basename=1
noremap <C-p> :bprev<CR>
noremap <C-n> :bnext<CR>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.elc,log/**,node_modules/**,target/**,/tmp/**,*.rbc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace to work as it should
set backspace=start,eol
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Turn off highlights
nmap <leader>q :nohlsearch<CR>

" Don't remove indentation when adding '#' comments
inoremap # X#

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
set matchtime=2

set mousehide

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Folding
set foldmethod=indent

"Don't fold anything by default - I'll close the folds myself
set foldlevel=99

" Don't bother folding small blocks
set foldminlines=5

" Fold column
set foldcolumn=0



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable


"set colorscheme based on $VIMCOLOR or use dusk by default
if $VIMCOLOR == 'light'
	set background=light
	let g:solarized_termcolors=256
	color solarized
elseif $VIMCOLOR == 'dark'
	set background=dark
	let g:solarized_termcolors=256
	color solarized
elseif $VIMCOLOR == 'molokai'
	let g:molokai_original=1
	let g:rehash256=1
	color molokai
elseif $VIMCOLOR != ''
	color $VIMCOLOR
else
	color dusk
endif


if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
	set t_Co=256
endif

if has("mac") || has("macunix")
	set gfn=Menlo:h15
elsif has("win16") || has("win32")
set gfn=Bitstream\ Vera\ Sans\ Mono:h11
elsif has("linux")
set gfn=Monospace\ 11
endif


set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Be smart when using tabs ;)
set smarttab

set autoindent
set smartindent

" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically
set nowrap

" Don't show linenumbers by default
set nonumber

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
"set lbr
"set tw=72

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<CR> 
map <leader>]	 :tabnext<CR>
map <leader>[	 :tabprev<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif
" Remember info about open buffers on close
set viminfo^=% 

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
	nmap <D-j> <M-j>
	nmap <D-k> <M-k>
	vmap <D-j> <M-j>
	vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Show vimgrep matches in the quickfix window
command! -nargs=+ Grep execute 'silent grep! -r <args>' | copen 33
" Search for the word under the cursor within the current file and display
" results in the quickfix
map <leader>g :execute "vimgrep /" . expand("<cword>") . "/j %" <Bar> cw<CR>
" Same as above, but do it recursively for all files under the CWD.
map <leader>gr :execute "vimgrep /" . expand("<cword") . "/j **" <Bar> cw<CR>
" Same as above, but use Ack.
map <leader>ga :execute "Ack " . expand("<cword>")<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Toggle paste mode on and off
map <leader>p :setlocal paste!<cr>

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
	set ttymouse=xterm2
endif

" make 81st column stand out
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)
"let &colorcolumn = join(range(81,400),',')
"highlight ColorColumn ctermbg=235
set colorcolumn=81
set cursorline
set cursorcolumn


" quick editing and reloading of vimrc
map <leader>e :e! ~/.vim/vimrc<cr>
autocmd! bufwritepost vimrc source ~/.vim/vimrc

" indent the whole file and return to original position
:nmap <leader>= mzgg=G\`z


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
	exe "menu Foo.Bar :" . a:str
	emenu Foo.Bar
	unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
	let l:saved_reg = @"
	execute "normal! vgvy"

	let l:pattern = escape(@", '\\/.*$^~[]')
	let l:pattern = substitute(l:pattern, "\n$", "", "")

	if a:direction == 'b'
		execute "normal ?" . l:pattern . "^M"
	elseif a:direction == 'gv'
		call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
	elseif a:direction == 'replace'
		call CmdLine("%s" . '/'. l:pattern . '/')
	elseif a:direction == 'f'
		execute "normal /" . l:pattern . "^M"
	endif

	let @/ = l:pattern
	let @" = l:saved_reg
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")

	if buflisted(l:alternateBufNum)
		buffer #
	else
		bnext
	endif

	if bufnr("%") == l:currentBufNum
		new
	endif

	if buflisted(l:currentBufNum)
		execute("bdelete! ".l:currentBufNum)
	endif
endfunction

" Text bubbling (http://vimcasts.org/episodes/bubbling-text/)
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Set window size
nmap <leader>1 :set lines=40 columns=85<CR><C-w>o
nmap <leader>2 :set lines=50 columns=171<CR><C-w>v

" Per-file options
autocmd BufNewFile,BufRead *.py 	setlocal sw=4 ts=4 sts=4 et
autocmd BufNewFile,BufRead *.md 	setlocal noet tw=74 list
autocmd BufNewFile,BufRead *.wiki setlocal noet tw=74
autocmd BufNewFile,BufRead *.rst 	setlocal sw=4 ts=4 sts=4 tw=74 et

" Cheap/simple spreadsheets in Vim
autocmd BufNewFile,BufRead *.tsv 	setlocal ts=16 sts=16 noet number list

" Columnar movements
autocmd BufNewFile,BufRead *.tsv 	map L f 	W
autocmd BufNewFile,BufRead *.tsv 	map H F 	B

"Show tabs and line numbers when coding
autocmd BufNewFile,BufRead *.py 		setlocal list number
autocmd BufNewFile,BufRead *.php 		setlocal list number
autocmd BufNewFile,BufRead *.js 		setlocal list number
autocmd BufNewFile,BufRead *.go 		setlocal list number
autocmd BufNewFile,BufRead *.c 			setlocal list number
autocmd BufNewFile,BufRead *.cpp 		setlocal list number
autocmd BufNewFile,BufRead *.lua		setlocal list number
autocmd BufNewFile,BufRead *.html		setlocal list number
autocmd BufNewFile,BufRead *.coffee	setlocal list number

" Linters
autocmd BufNewFile,BufRead *.php map <leader>; :!php -l %<CR>
autocmd BufNewFile,BufRead *.js  map <leader>; :!jshint %<CR>
autocmd BufNewFile,BufRead *.py  map <leader>; :!pylint -r n -f colorized %<CR>

" Redraw
noremap <leader>r :redraw!<CR>

" Toggle visible tab characters
noremap <leader>l :set list!<CR>

" Toggle line numbers
noremap <leader>n :set number!<CR>

" List characters use a less-noisy pipe to show tabs, instead of ^I
" Don't bother showing EOL characters either.
set listchars=tab:\|.,trail:.,extends:>,precedes:<,eol:\

" Set window size
nmap <leader>1 :set lines=40 columns=85<CR><C-w>o
nmap <leader>2 :set lines=50 columns=171<CR><C-w>v

" Per-file options
autocmd BufNewFile,BufRead *.py 	setlocal sw=4 ts=4 sts=4 et
autocmd BufNewFile,BufRead *.md 	setlocal noet tw=74 list
autocmd BufNewFile,BufRead *.wiki setlocal noet tw=74
autocmd BufNewFile,BufRead *.rst 	setlocal sw=4 ts=4 sts=4 tw=74 et

" Cheap/simple spreadsheets in Vim
autocmd BufNewFile,BufRead *.tsv 	setlocal ts=16 sts=16 noet number list

" Columnar movements
autocmd BufNewFile,BufRead *.tsv 	map L f 	W
autocmd BufNewFile,BufRead *.tsv 	map H F 	B

"Show tabs and line numbers when coding
autocmd BufNewFile,BufRead *.py 		setlocal list number
autocmd BufNewFile,BufRead *.php 		setlocal list number
autocmd BufNewFile,BufRead *.js 		setlocal list number
autocmd BufNewFile,BufRead *.go 		setlocal list number
autocmd BufNewFile,BufRead *.c 			setlocal list number
autocmd BufNewFile,BufRead *.cpp 		setlocal list number
autocmd BufNewFile,BufRead *.lua		setlocal list number
autocmd BufNewFile,BufRead *.html		setlocal list number
autocmd BufNewFile,BufRead *.coffee	setlocal list number

" Linters
autocmd BufNewFile,BufRead *.php map <leader>; :!php -l %<CR>
autocmd BufNewFile,BufRead *.js  map <leader>; :!jshint %<CR>
autocmd BufNewFile,BufRead *.py  map <leader>; :!pylint -r n -f colorized %<CR>

" Redraw
noremap <leader>r :redraw!<CR>

" Toggle visible tab characters
noremap <leader>l :set list!<CR>

" Toggle line numbers
noremap <leader>n :set number!<CR>

" List characters use a less-noisy pipe to show tabs, instead of ^I
" Don't bother showing EOL characters either.
set listchars=tab:\|.,trail:.,extends:>,precedes:<,eol:\

" Switch CWD to the directory of the open buffer
" This (and more) inspired from http://amix.dk/vim/vimrc.html
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" When using tab completion for filenames, only complete as far
" as the match goes
set wildmode=longest:full
set wildmenu

map <leader>h :call ToggleHex()<CR>
function! ToggleHex()
	if exists('w:hex')
		unlet w:hex
		exec ':%!xxd -r'
	else
		exec ':%!xxd'
		let w:hex=1
	endif
endfunction

" Close the quickfix window
map <leader>cw :cclose<CR>
"Open the quickfix window
map <leader>co :copen<CR>
"Clear the quickfix window
map <leader>cc :call setqflist([])<CR>

" Quick AES encryption/decryption
command! Enc execute '%!openssl aes-256-cbc -salt'
command! Dec execute '%!openssl aes-256-cbc -d -salt'

" Auto encrypt/decrypt .aes files with AESCrypt
" (It's more portable than openssl on Android)
function! s:AESReadPre()
	set cmdheight=3
	set viminfo=
	set noswapfile
	set shell=/bin/sh
	set bin
endfunction
function! s:AESReadPost()
	let l:expr = "0,$!aescrypt -d -"

	silent! execute l:expr
	if v:shell_error
		silent! 0,$y
		silent! undo
		echo "COULD NOT DECRYPT USING EXPRESSION: " . expr
		echo "ERROR FROM AESCRYPT:"
		echo @"
		echo "COULD NOT DECRYPT"
		return
	endif
	set nobin
	set cmdheight&
	set shell&
	execute ":doautocmd BufReadPost ".expand("%:r")
	redraw!
endfunction
function! s:AESWritePre()
	set cmdheight=3
	set shell=/bin/sh
	set bin
	let l:expr = "0,$!aescrypt -e -"
	silent! execute l:expr
	if v:shell_error
		silent! 0,$y
		silent! undo
		echo "COULD NOT ENCRYPT USING EXPRESSION: " . expr
		echo "ERROR FROM AESCRYPT:"
		echo @"
		echo "COULD NOT ENCRYPT"
		return
	endif
endfunction
function! s:AESWritePost()
	silent! undo
	set nobin
	set shell&
	set cmdheight&
	redraw!
endfunction
autocmd BufReadPre,FileReadPre *.aescrypt call s:AESReadPre()
autocmd BufReadPost,FileReadPost *.aescrypt call s:AESReadPost()
autocmd BufWritePre,FileWritePre *.aescrypt call s:AESWritePre()
autocmd BufWritePost,FileWritePost *.aescrypt call s:AESWritePost()

" Wrap visual selections with chars
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap " "zdi"<C-R>z"<ESC>

" Activate pathogen
execute pathogen#infect()
