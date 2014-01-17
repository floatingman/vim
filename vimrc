" don't bother with vi compatibility
set nocompatible

filetype on
filetype off

" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
   echo "Installing Vundle.."
   echo ""
   silent !mkdir -p ~/.vim/bundle
   silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
   let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'airblade/vim-gitgutter'
Bundle 'juvenn/mustache.vim'
Bundle 'majutsushi/tagbar'
Bundle 'msanders/snipmate.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'vim-scripts/Zenburn'
Bundle 'Shougo/unite.vim'
Bundle 'pbrisbin/vim-rename-file'
Bundle 'pbrisbin/vim-restore-cursor'
Bundle 'pbrisbin/alt-ctags'
Bundle 'pbrisbin/vim-mkdir'
Bundle 'a.vim'
Bundle 'Command-T'
Bundle 'scratch.vim'
Bundle 'searchfold.vim'
Bundle 'ScrollColors'
Bundle 'Colour-Sampler-Pack'
Bundle 'CCTree'
Bundle 'clang-complete'
Bundle 'SuperTab'
Bundle 'vim-scripts/Align'
Bundle 'vim-scripts/greplace.vim'
Bundle 'vim-scripts/matchit.zip'

if iCanHazVundle == 0
   echo "Installing Bundles, please ignore key map error messages"
   echo ""
   :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

filetype plugin indent on

set autoindent
set autoread
set backspace=2
set backupcopy=yes
set clipboard=unnamed
set directory-=.
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:»·,trail:·
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set tabstop=8
set wildignore=log/**,node_modules/**,target/**,/tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
  set ttymouse=xterm2
endif

" make 81st column stand out
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)


let g:syntastic_check_on_open = 1
let g:ctags_command = "ctags -f '%f' -R --exclude='*.js'"
let g:ctags_excludes = ['~','~/.dotfiles/']
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:zenburn_alternate_Visual = 1
let g:zenburn_high_Contrast = 1
let g:zenburn_old_Visual = 1
let g:markdown_fenced_languages = ['c','haskell','ruby','sh','yaml','vim']

silent! colorscheme zenburn

" keyboard shortcuts
let mapleader = ','
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <leader>l :Align
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>t :CtrlP<CR>
nmap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nmap <leader>] :TagbarToggle<CR>
nmap <leader><space> :call whitespace#strip_trailing()<CR>
nmap <leader>g :GitGutterToggle<CR>
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>


map <Leader>n :RenameFile<CR>

nnoremap <C-l> :<C-u>nohlsearch<CR><C-l>

cmap w!! w !sudo tee % >/dev/null %

let &colorcolumn = join(range(81,400),',')

highlight ColorColumn ctermbg=235

augroup vimrc
  autocmd!
  autocmd BufEnter *.md,*.mkd setlocal filetype=markdown
  autocmd FileType gitcommit setlocal spell
  autocmd FileType haskell setlocal shiftwidth=4 | let b:ctags_command = 'hs-ctags %f'
  autocmd FileType mail setlocal spell nohlsearch
  autocmd FileType markdown setlocal formatoptions+=twn nosmartindent spell
  autocmd FileType html setlocal noshowmatch
augroup END
