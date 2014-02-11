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

""""""""""""""""""""""""""""""""""""""""""""""""""
" => GitGutter
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>g :GitGutterToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => whitespace.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader><space> :call whitespace#strip_trailing()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>] :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => RenameFile
""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>n :RenameFile<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" => RagTag
""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <M-o> <Esc>o
inoremap <C-j> <Down>
let g:ragtag_global_maps = 1

" ---------------
" startify
" ---------------
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_show_sessions = 1
let g:startify_show_files = 1
let g:startify_show_files_number = 10
let g:startify_bookmarks = [ '~/.vimrc' ]

" ---------------
" unite.vim
" ---------------
let g:unite_data_directory = '~/.vim/cache/unite'
let g:unite_enable_start_insert = 1
let g:unite_source_history_yank_enable = 1
let g:unite_source_rec_max_cache_files = 1000
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '» '
let g:unite_source_grep_command = 'ack'
let g:unite_source_grep_default_opts = '-H --nocolor --nogroup'
let g:unite_source_grep_recursive_opt = ''
nnoremap <C-p> :Unite buffer file_rec/async file_mru<CR>
nnoremap <C-\> :Unite file<CR>
nnoremap <C-g> :Unite grep:.<CR>

" ---------------
" vimshell
" ---------------
let g:vimshell_temporary_directory = expand('~/.vim/cache/vimshell')
let g:vimshell_force_overwrite_statusline = 0

" ---------------
" vimfiler
" ---------------
let g:vimfiler_data_directory = '~/.vim/cache/vimfiler'
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_force_overwrite_statusline = 0
nnoremap <C-n> :VimFilerExplorer<CR>


" ---------------
" airline
" ---------------
let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
let g:airline_linecolumn_prefix = '¶ '
let g:airline#extensions#branch#symbol = '⎇ '
let g:airline#extensions#paste#symbol = 'Þ'
let g:airline#extensions#whitespace#symbol = 'Ξ'

" ---------------
" neocomplete.vim
" ---------------
let g:neocomplete#data_directory = '~/.vim/cache/neocomplete'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#enable_auto_close_preview = 1
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 0
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#max_list = 100
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#sources#tags#cache_limit_size = 8192000
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#dictionary#dictionaries = {}
let g:neocomplete#sources#vim#complete_functions = {
      \ 'Ref' : 'ref#complete',
      \ 'Unite' : 'unite#complete_source',
      \ 'VimFiler' : 'vimfiler#complete',
      \ 'Vinarise' : 'vinarise#complete',
      \ 'VimShell' : 'vimshell#complete',
      \ 'VimShellExecute' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellTerminal' : 'vimshell#vimshell_execute_complete',
      \ 'VimShellInteractive' : 'vimshell#vimshell_execute_complete',
      \}
let g:neocomplete#keyword_patterns = {
      \ '_' : '[0-9a-zA-Z:#_]\+',
      \}
inoremap <expr><C-f> pumvisible() ? "\<PageDown>" : "\<Right>"
inoremap <expr><C-b> pumvisible() ? "\<PageUp>" : "\<Left>"
inoremap <expr><C-y> pumvisible() ? neocomplete#close_popup() : "\<C-r>\""
inoremap <expr><C-e> pumvisible() ? neocomplete#cancel_popup() : "\<End>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-n> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
inoremap <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"
inoremap <expr><C-x><C-f> neocomplete#start_manual_complete('file')
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete()
function! s:check_back_space()
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~ '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" neosnippet.vim"
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'
imap <silent><C-k> <Plug>(neosnippet_expand_or_jump)
smap <silent><C-k> <Plug>(neosnippet_expand_or_jump)

" ---------------
" gundo.vim
" ---------------
let g:gundo_width = 32
let g:gundo_preview_height = 16

" ---------------
" indent-guides
" ---------------
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=0
let g:indent_guides_color_change_percent=5
let g:indent_guides_guide_size=1
nmap <silent> <leader>i :IndentGuidesToggle<CR>

" ---------------
" Tabular
" ---------------
nmap <leader>t= :Tabularize /=<CR>
vmap <leader>t= :Tabularize /=<CR>
nmap <leader>t: :Tabularize /:\zs<CR>
vmap <leader>t: :Tabularize /:\zs<CR>
nmap <leader>t, :Tabularize /,\zs<CR>
vmap <leader>t, :Tabularize /,\zs<CR>
nmap <leader>t> :Tabularize /=>\zs<CR>
vmap <leader>t> :Tabularize /=>\zs<CR>

" ---------------
" zencoding
" ---------------
let g:user_zen_settings = {
      \  'php' : {
      \    'extends' : 'html',
      \    'filters' : 'c',
      \  },
      \  'xml' : {
      \    'extends' : 'html',
      \  },
      \  'haml' : {
      \    'extends' : 'html',
      \  },
      \  'eruby' : {
      \    'extends' : 'html',
      \  },
      \}

" ---------------
" vim-javascript
" ---------------
let g:html_indent_inctags = "body,head,tbody"
let g:html_indent_autotags = "th,td,tr,tfoot,thead"
let g:html_indent_sciript1 = "inc"
let g:html_indent_style1 = "inc"

" ---------------
" slimv
" mit-scheme
" ---------------
let g:slimv_impl = 'mit'
let g:slimv_disable_clojure = 1
let g:slimv_disable_lisp = 1
let g:scheme_builtin_swank = 1

" ---------------
" vim2hs
" ---------------
let g:haskell_hsp = 0

" --------------
" syntastic
" --------------
let g:syntastic_ignore_files = ['^/usr/include/']
let g:syntastic_c_config_file = '.syntastic_c_config'
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c99 -Wall'
