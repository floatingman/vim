set nocompatible
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
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/Zenburn'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Shougo/unite.vim'
Bundle 'Valloric/YouCompleteMe'

if iCanHazVundle == 0
   echo "Installing Bundles, please ignore key map error messages"
   echo ""
   :BundleInstall
endif
" Setting up Vundle - the vim plugin bundler end

syntax on
filetype plugin indent on

set autoindent
set autoread
set autowrite
set cursorline
set directory=/tmp
set expandtab
set foldmethod=marker
set formatoptions-=t
set formatoptions+=j
set history=500
set hlsearch
set incsearch
set laststatus=2
set list listchars=tab:»·,trail:·
set nobackup
set nojoinspaces
set nowrap
set number
set ruler
set scrolloff=999
set shiftwidth=2
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=5
set smartindent
set smarttab
set textwidth=72
set visualbell t_vb=
set wildmode=list:longest
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999
set mouse=a


let g:syntastic_check_on_open = 1


