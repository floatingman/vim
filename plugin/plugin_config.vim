"""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate
""""""""""""""""""""""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open = 1

""""""""""""""""""""""""""""""""""""""""""""""""""
" => mru
""""""""""""""""""""""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

