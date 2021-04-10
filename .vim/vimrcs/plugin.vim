"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => call plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" complete plugin
Plug 'ycm-core/YouCompleteMe'

" plugin that beauties the title and bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" plugin that auto pairs () etc
Plug 'jiangmiao/auto-pairs'

" file tree
Plug 'preservim/nerdtree'

" quick comment
Plug 'preservim/nerdcommenter'

" check errors
Plug 'dense-analysis/ale'

" generate tags
" Plug 'ludovicchabant/vim-gutentags'

" run file in a colon
Plug 'skywind3000/asyncrun.vim'

" find things
Plug 'Yggdroot/LeaderF'

" show git difference
Plug 'mhinz/vim-signify'

" echo function in the command line
Plug 'Shougo/echodoc.vim'

" bindsym keys
" Plug 'liuchengxu/vim-which-key'

" show tags in a new window
Plug 'preservim/tagbar'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" system python path
let g:ycm_python_binary_path = '/usr/bin/python3'
" load ycm global ycm extra conf
let g:ycm_global_ycm_extra_conf = '~/.vim/vimrcs/.ycm_extra_conf.py' 
" close ycm global ycm extra conf notification
let g:ycm_confirm_extra_conf=0
" close YCM complete when leave insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" set server log
let g:ycm_server_log_level = 'info'
" YCM complete after two words
let g:ycm_min_num_identifier_candidate_chars = 2
" YCM collect from comments and strings
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" YCM collect form tags files
let g:ycm_collect_identifiers_from_tags_files=1
" YCM collect with index
let g:ycm_seed_identifiers_with_syntax=1
" YCM complete in comments and strings
let g:ycm_complete_in_strings=1
" YCM complete pararrel with IDE
set completeopt=longest,menu,menuone
" YCM delete cash and recollect data everytime
let g:ycm_cache_omnifunc=0
" YCM complete in comments
let g:ycm_complete_in_comments = 1
" YCM complete in strings
let g:ycm_complete_in_strings = 1
" close diagnostics
let g:ycm_show_diagnostics_ui = 0
" close preview
let g:ycm_add_preview_to_completeopt = 0
" complete from the second char
let g:ycm_min_num_of_chars_for_completion=2

" complete based on identifier
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
" the theme
highlight PMenu ctermfg=0 ctermbg=248 guifg=silver guibg=silver
highlight PMenuSel ctermfg=0 ctermbg=240 guifg=black guibg=silver
set completeopt=menu,menuone


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set airline theme
let g:airline_theme='angr'
" use powerline fonts
let g:airline_powerline_fonts = 1 
" enable airline buffer on the top
let g:airline#extensions#tabline#enabled = 1
" set the path tab show
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" close the show of blank char
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-pair
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ctrl as auto client
let g:AutoPairsMapCR = 1
let g:AutoPairsMapBS = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" open nerdtree with F1
nnoremap <F1> :NERDTreeToggle<CR>
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" set the width
let NERDTreeWinSize=22
" ignore the following file
let NERDTreeIgnore=['\.pyc','\~$','\.swp','\.git']
" show hidden fules
let NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" add space before commenter
let g:NERDSpaceDelims=1
" allow comment to change line
let g:NERDCommentEmptyLines = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters_explicit = 1
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1
" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" only run ale when leave insert mode
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
" run linter after 3 sec to save power
" let g:ale_lint_delay = 3
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
" theme to show error
let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
" check options
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" stop search when found these files
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" the file name generated
let g:gutentags_ctags_tagfile = '.tags'
" put tag files in certain directory
" let s:vim_tags = expand('~/.vim/cache/tags')
" let g:gutentags_cache_dir = s:vim_tags
" if tag direcotry dones't exist, touch it
" if !isdirectory(s:vim_tags)
   " silent! call mkdir(s:vim_tags, 'p')
" endif
" some args for gutentags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => asyncrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let asyncrun open a 6 line buffer to run 
let g:asyncrun_open = 6
" use <F6> to run command
nnoremap <F6> :AsyncRun
" use F3 to call asyncrun window
nnoremap <F3> :call asyncrun#quickfix_toggle(6)<cr>
" find all the project with these marks
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml']
" using F4 to generate Makefile using cmake
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
" complie all the project with <F5>
nnoremap <silent> <F5> :AsyncRun -cwd=<root> -raw make run <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default updatetime 4000ms is not good for async update
set updatetime=100
" let g:signcolumn='yes'
" select vcs
let g:signify_vcs_list = ['git','svn']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set leaderF pop mode
" let g:Lf_WindowPosition = 'popup'
" change the shortcuts of leaderf
" let g:Lf_ShortcutB = '<C-F>'
" changer the shortcuts of search functuons
nnoremap <C-F> :LeaderfBufTag<cr>
inoremap <C-F> <Esc>:LeaderfBufTag<cr>
" set root directory
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
" do not Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 0
" hide help
let g:Lf_HideHelp = 1
" do not use cache 
let g:Lf_UseCache = 0
" use vcs tools
let g:Lf_UseVersionControlTool = 1 " ignore current buffer name 
let g:Lf_IgnoreCurrentBufferName = 1
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
" set the hight of leaderF
let g:Lf_WindowHeight = 0.20
" set the theme
let g:Lf_StlColorscheme = 'default'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => echodoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" start echodoc at startup
let g:echodoc#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => whcih-key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trigger which-key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :TagbarToggle<CR>
imap <F2> <ESC>:TagbarToggle<CR>
autocmd VimEnter * nested :TagbarOpen
" set the width
let g:tagbar_width = 27
" set if show the help note
let g:tagbar_compact = 1
" the number of spaces each level indented
let g:tagbar_indent = 0
" show data type
let g:tagbar_show_data_type = 1
" show absolute line numbers
let g:tagbar_show_linenumbers = 1
