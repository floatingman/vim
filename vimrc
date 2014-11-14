if !1 | finish |endif

if has('vim_starting')
  " don't bother with vi compatibility
  set nocompatible

  " Required
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \		'windows' : 'tools\\update-dll-mingw',
      \		'cygwin' : 'make -f make_cygwin.mak',
      \		'mac'		: 'make -f make_mac.mak',
      \		'linux' : 'make',
      \		'unix' : 'gmake',
      \		},
      \ }
NeoBundle 'jlanzarotta/bufexplorer'
NeoBundle 'vim-scripts/Gundo'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/vim-coffee-script'
NeoBundle 'vimwiki/vimwiki'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'c9s/perlomni.vim'
NeoBundle 'Shougo/vimshell.vim'

"Unite bundles
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/unite-help'
NeoBundle 'Shougo/unite-session'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'mileszs/ack.vim'

"Snippets
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'

"Comments
NeoBundle 'scrooloose/nerdcommenter'

"git plugins
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

"Web Dev
NeoBundle 'psykidellic/vim-jekyll'

" Status line
NeoBundle 'bling/vim-airline'

" Misc
NeoBundle 'Raimondi/delimitMate'

call neobundle#end()

" Enable filetype plugins
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them
NeoBundleCheck

"==============================================================
" Local Settings
"==============================================================
try
  source ~/.vimrc.local
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set augroup
augroup MyAutoCmd
  autocmd!
augroup END

" Sets how many lines of history VIM has to remember
set history=10000

" set to reload file if changed outside of vim
set autoread

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

" Set 3 lines to the cursor - when moving vertically using j/k
set scrolloff=3

" Lower the time that Vim waits to look for matching keymaps (ms)
set timeoutlen=400

" Easy movement between buffers
let g:buftabs_only_basename=1
noremap <C-p> :bprev<CR>
"noremap <C-n> :bnext<CR>

" Configure backspace to work as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Set sensible heights for splits
set winheight=50

" Turn off highlights
"nmap <leader>q :nohlsearch<CR>

" Don't remove indentation when adding '#' comments
inoremap # X#

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

" Always splits to the right and below
set splitright
set splitbelow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on

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
" Tab settings
set expandtab
set shiftwidth=2
set tabstop=8
set softtabstop=2
set smarttab


" Text display settings 
set linebreak
set textwidth=80
set autoindent
set nowrap
set whichwrap+=h,l,<,>,[,]


" Don't show linenumbers by default
set nonumber


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"===============================================================================
"Leader key bindings
"===============================================================================

" With a map leader it's possible to do extra key combinations
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ","
let g:maplocalleader = ","

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<CR> 
map <leader>]  :tabnext<CR>
map <leader>[  :tabprev<CR>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Search for the word under the cursor within the current file and display
" results in the quickfix
map <leader>g :execute "vimgrep /" . expand("<cword>") . "/j %" <Bar> cw<CR>
" Same as above, but do it recursively for all files under the CWD.
map <leader>gr :execute "vimgrep /" . expand("<cword") . "/j **" <Bar> cw<CR>
" Same as above, but use Ack.
map <leader>ga :execute "Ack " . expand("<cword>")<CR>

" <Leader>s: Spell checking shortcuts
nnoremap <Leader>ss :setlocal spell!<cr>
nnoremap <Leader>sj ]s
nnoremap <Leader>sk [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=

" quick editing and reloading of vimrc
map <leader>e :e! ~/.vim/vimrc<cr>

" indent the whole file and return to original position
:nmap <leader>= mzgg=G\`z

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

map <leader>h :call ToggleHex()<CR>

" Close the quickfix window
map <leader>cw :cclose<CR>
"Open the quickfix window
map <leader>co :copen<CR>
"Clear the quickfix window
map <leader>cc :call setqflist([])<CR>

" QFN (mnemonic: 'a' for annotate)
map <leader>an :QFNAddQ<CR>
map <leader>as :QFNSave annotations.txt<CR>

" Toggle on diff mode for the current buffer.
nmap <leader>d :call DiffToggle()<CR>

"Fugitive
nnoremap <Leader>gb :Gblame<cr>
nnoremap <Leader>gc :Gcommit<cr>
nnoremap <Leader>gd :Gdiff<cr>
nnoremap <Leader>gp :Git push<cr>
"nnoremap <Leader>gr :Gremove<cr>
nnoremap <Leader>gs :Gstatus<cr>
nnoremap <Leader>gw :Gwrite<cr>
" Quickly stage, commit, and push the current file, Useful for editing .vimrc
nnoremap <Leader>gg :Gwrite<cr>:Gcommit -m 'update'<cr>:Git push<cr>

"Fast force quiting
nnoremap <Leader>`` :qa!<cr>

"leader 1: toggle paste mode
nnoremap <silent> <Leader>1 :set paste!<cr>

"leader 2:  Toggle Tagbar
nnoremap <silent> <Leader>2 :TagbarToggle<cr>

"<Leader>q: Quit all, useful in vimdiff
nnoremap <Leader>q :qa<cr>

" <Leader>f: Open Quickfix
nnoremap <silent> <Leader>f :botright copen<CR>
"===============================================================================
" Normal Mode Shift Key Mappings
"===============================================================================

" Shift-Tab: NERDTree
nnoremap <silent> <S-Tab> :NERDTreeToggle<CR>


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
let &stl=""
if exists('*StatuslineColor')
  let &stl.="%{StatuslineColor()}"
else
  hi StatusLine ctermfg=237 ctermbg=250
  hi User1 ctermfg=015 ctermbg=237
  hi User2 ctermfg=232 ctermbg=237
  hi User3 ctermfg=184 ctermbg=237
  hi User4 ctermfg=184 ctermbg=237
  hi User5 ctermfg=184 ctermbg=237
endif
let &stl.="%1*%f"												" filename
let &stl.="%="													" everything after this is right-aligned
let &stl.="%3*%{&modified?'[+]\ ':''}"	" modified flag
let &stl.="%4*%{&readonly?'[R]\ ':''}"	" read-only flag
let &stl.="%5*%{&paste?'[P]\ ':''}"			" paste mode
let &stl.="%<"													" truncate here if we run out of space
let &stl.="%2*\|\ %1*\%{&ff}\ %2*\|"		" file format
let &stl.="%1*\ %{strlen(&fenc)?&fenc:'none'}\ %2*\|" " file encoding
let &stl.="%1*\ %{tolower(&ft)}\ %2*\|"	" filetype, lowercase without surrounding square brackets
let &stl.="%1*\ %l,%c\ %2*\|"						" line, col position
let &stl.="%1*\ %p%%"										" total lines, % of file
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
  set ttymouse=xterm2
endif

let &colorcolumn="80,".join(range(120,999), ",")

" Highlight trailing whitespace
if hlexists("TrailingWhitespace")
  match TrailingWhitespace /\s\+$/
endif

" Visually indicate when I'm over 80-cols on line length, at add the ability
" to turn it on/off. Show text with a dark-red background, but show regular
" syntax highlighting.
if hlexists("OverLength")
  map <leader>k :call ToggleOverLength()<CR>
  function! ToggleOverLength()
    if exists('w:m1')
      call matchdelete(w:m1)
      unlet w:m1
    else
      let w:m1=matchadd('OverLength', '\%81v.\+', 11)
    endif
  endfunction
  "call ToggleOverLength()
else
  map <leader>k :echo "No 'OverLength' highlight group in color settings."<CR>
endif


autocmd MyAutoCmd BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc
      \ so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif

try
  lang en_US
catch
endtry

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

" List characters use a less-noisy pipe to show tabs, instead of ^I
" Don't bother showing EOL characters either.
set listchars=tab:\|.,trail:.,extends:>,precedes:<,eol:\

" When using tab completion for filenames, only complete as far
" as the match goes
set completeopt=longest,menuone

set wildmode=list:longest,full
set wildmenu "turn on wild menu
set wildignore=*.o,*.obj,*~ "Stuff to ignore when tab completing
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/Library/**,*/rbenv/**
set wildignore+=*/.nx/**,*.app

function! ToggleHex()
  if exists('w:hex')
    unlet w:hex
    exec ':%!xxd -r'
  else
    exec ':%!xxd'
    let w:hex=1
  endif
endfunction

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

" vimwiki
let g:vimwiki_list = [{'path': '~/work/personal/vimwiki/', 'path_html': '~/work/personal/vimwiki/html'}]

" Easy Motion: Search for character
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s)
nmap S <Plug>(easymotion-s2)

" NERDTree 
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\~$','\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']

"Close vim if the only window open is nerdtree
autocmd MyAutoCmd BufEnter *
      \ if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"NERDComment
let NERDSpaceDelims=1

" I don't even know how to use Ex mode.
nnoremap Q <nop>
" Toggle on diff mode for the current buffer.
function! DiffToggle()
  if &diff
    diffoff
  else
    diffthis
  end
endfunction

"NeoComplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" " Use smartcase.
let g:neocomplete#enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"F Key mappings
nmap <F1> [unite]h

"<F3>: Gundo
nnoremap <F3> :<C-u>GundoToggle<CR>

"Shift key mappings
"Q closes windows
nnoremap Q :q<cr>

"W: Save
nnoremap W :w<cr>

"redo
nnoremap U :redo<cr>

"H: Go to beginning of line
noremap H ^

"REINDENT file
nnoremap R mqHmwgg=G`wzt`q

" Quick horizontal splits
nnoremap _ :sp<cr>

" Quick vertical splits
nnoremap <bar> :vsp<cr>

" :: Remap to ,. After all the remapping, ; goes to command mode, . repeats
" fFtT, : repeats it bacward, and , is the leader
"noremap : ,

nmap <c-e> [unite]f
nnoremap <c-s><c-f> [unite]l

"===============================================================================
" Unite
"===============================================================================
" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
" call unite#filters#sorter_default#use(['sorter_rank'])
" Set up some custom ignores
call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
\ 'ignore_pattern', join([
\ '\.git/',
\ 'git5/.*/review/',
\ 'google/obj/',
\ 'tmp/',
\ '.sass-cache',
\ 'node_modules/',
\ 'bower_components/',
\ 'dist/',
\ '.git5_specs/',
\ '.pyc',
\ ], '\|'))
" Map space to the prefix for Unite
nnoremap [unite] <Nop>
nmap <space> [unite]
" General fuzzy search
nnoremap <silent> [unite]<space> :<C-u>Unite
\ -buffer-name=files buffer file_mru bookmark file_rec/async<CR>
" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]u :<C-u>Unite -buffer-name=buffers file_mru buffer<CR>
" Quick buffer and mru
" Quick yank history
nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<CR>
" Quick outline
nnoremap <silent> [unite]o :<C-u>Unite -buffer-name=outline -vertical outline<CR>
" Quick sessions (projects)
nnoremap <silent> [unite]p :<C-u>Unite -buffer-name=sessions session<CR>
" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -buffer-name=sources source<CR>
" Quick snippet
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=snippets snippet<CR>
" Quickly switch lcd
nnoremap <silent> [unite]d
\ :<C-u>Unite -buffer-name=change-cwd -default-action=cd directory_mru directory_rec/async<CR>
" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/async file/new<CR>
" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -buffer-name=grep grep:.<CR>
" Quick help
nnoremap <silent> [unite]h :<C-u>Unite -buffer-name=help help<CR>
" Quick line using the word under cursor
" nnoremap <silent> [unite]l :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>
" Quick line
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>
" Quick find
nnoremap <silent> [unite]n :<C-u>Unite -buffer-name=find find:.<CR>
" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>
" Quick bookmarks
nnoremap <silent> [unite]b :<C-u>Unite -buffer-name=bookmarks bookmark<CR>
" Fuzzy search from current buffer
" nnoremap <silent> [unite]b :<C-u>UniteWithBufferDir
" \ -buffer-name=files -prompt=%\ buffer file_mru bookmark file<CR>
" Quick commands
nnoremap <silent> [unite]; :<C-u>Unite -buffer-name=history -default-action=edit history/command command<CR>


" Custom Unite settings
autocmd MyAutoCmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nmap <buffer> <ESC> <Plug>(unite_insert_enter)
  imap <buffer> <ESC> <Plug>(unite_exit)
  " imap <buffer> <c-j> <Plug>(unite_select_next_line)
  imap <buffer> <c-j> <Plug>(unite_insert_leave)
  nmap <buffer> <c-j> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <c-k> <Plug>(unite_loop_cursor_up)
  nmap <buffer> <tab> <Plug>(unite_loop_cursor_down)
  nmap <buffer> <s-tab> <Plug>(unite_loop_cursor_up)
  imap <buffer> <c-a> <Plug>(unite_choose_action)
  imap <buffer> <Tab> <Plug>(unite_insert_leave)
  imap <buffer> jj <Plug>(unite_insert_leave)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_word)
  imap <buffer> <C-u> <Plug>(unite_delete_backward_path)
  imap <buffer> ' <Plug>(unite_quick_match_default_action)
  nmap <buffer> ' <Plug>(unite_quick_match_default_action)
  nmap <buffer> <C-r> <Plug>(unite_redraw)
  imap <buffer> <C-r> <Plug>(unite_redraw)
  inoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-s> unite#do_action('split')
  inoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  let unite = unite#get_current_unite()
  if unite.buffer_name =~# '^search'
    nnoremap <silent><buffer><expr> r unite#do_action('replace')
  else
    nnoremap <silent><buffer><expr> r unite#do_action('rename')
  endif
  nnoremap <silent><buffer><expr> cd unite#do_action('lcd')
  " Using Ctrl-\ to trigger outline, so close it using the same keystroke
  if unite.buffer_name =~# '^outline'
    imap <buffer> <C-\> <Plug>(unite_exit)
  endif
  " Using Ctrl-/ to trigger line, close it using same keystroke
  if unite.buffer_name =~# '^search_file'
    imap <buffer> <C-_> <Plug>(unite_exit)
  endif
endfunction
" Start in insert mode
let g:unite_enable_start_insert = 1
let g:unite_data_directory = "~/.unite"
" Enable short source name in window
" let g:unite_enable_short_source_names = 1
" Enable history yank source
let g:unite_source_history_yank_enable = 1
" Open in bottom right
let g:unite_split_rule = "botright"
" Shorten the default update date of 500ms
let g:unite_update_time = 200
let g:unite_source_file_mru_limit = 1000
let g:unite_cursor_line_highlight = 'TabLineSel'
" let g:unite_abbr_highlight = 'TabLine'
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''
" For ack.
if executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  " Match whole word only. This might/might not be a good idea
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
  let g:unite_source_grep_command = 'ack'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a -w'
  let g:unite_source_grep_recursive_opt = ''
endif
let g:unite_source_rec_max_cache_files = 99999


"===============================================================================
" Unite Sessions
"===============================================================================
" Save session automatically.
let g:unite_source_session_enable_auto_save = 1
" Pop up session selection if no file is specified
" TODO: Why does this not work when Vim isn't run from tmux???!
autocmd MyAutoCmd VimEnter * call s:unite_session_on_enter()
function! s:unite_session_on_enter()
  if !argc() && !exists("g:start_session_from_cmdline")
    Unite -buffer-name=sessions session
  endif
endfunction

"==============================================================================
"Autocommands
"==============================================================================

"Turn on cursorline only on active window
"Cursorline makes things REALLY slow for me. Especially moving left and right
"on the same line when syntax higlight is on

function! CursorPing()
  set cursorline cursorcolumn
  redraw
  sleep 200m
  set nocursorline nocursorcolumn
endfunction

" q quits in certain page types
autocmd MyAutoCmd FileType help,quickrun
      \ if (!&modifiable || &ft==#'quickrun') |
      \ nnoremap <silent> <buffer> q :q<cr>|
      \ nnoremap <silent> <buffer> <esc><esc> :q<cr>|
      \ endif
autocmd MyAutoCmd FileType qf nnoremap <silent> <buffer> q :q<CR>

"===============================================================================
" DelimitMate
"===============================================================================
autocmd MyAutoCmd FileType vim let b:delimitMate_quotes = "'"
let delimitMate_expand_cr = 1
