" sbz's .vimrc

" enable colors
syn on
colorscheme desert

" configure trailing whitespaces visualization
set nolist
set listchars=tab:>-,trail:.,precedes:<,extends:>,eol:$

" setup Vundle with command
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"

" requirement for using Vundle
set nocompatible
filetype off
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Vundle as plugin manager
Plugin 'VundleVim/Vundle.vim'

" Plugins installation using :PluginInstall
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Valloric/ListToggle'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'fatih/vim-go'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'nhooyr/neoman.vim'
Plugin 'saltstack/salt-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tweekmonster/braceless.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/forth.vim'

call vundle#end()

" highlight characters past column 80
autocmd FileType python highlight Excess ctermbg=red guibg=Black
autocmd FileType python match Excess /\%80v.*/
autocmd FileType python set nowrap

" pymode

" configure (doc, ident, linting, check on save, ...)
let g:pymode_rope = 0
let g:pymode_indent = 1
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = ["pylint", "pyflakes","pep8"]
" check on save
let g:pymode_lint_write = 1

" python 3.x ftw!
"let g:pymode_python = 'python3'

" enable virtualenv support
let g:pymode_virtualenv = 1

" enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" no autofold code
let g:pymode_folding = 0

" change window's cwd to file's dir
set autochdir

" YouCompleteMe

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
" do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./tags

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_symbols = {}
"let g:airline_symbols.branch = '?~N~G'
"let g:airline_symbols.readonly = '?~B?'
"let g:airline_symbols.linenr = '?~B?'
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
set laststatus=2

" syntastic
let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" NerdTree
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '+'

map <C-n> :NERDTreeToggle<CR>

" spaces instead tabs
set tabstop=4
set shiftwidth=4
set expandtab
set modeline
" wrap on 80
set textwidth=80
" be smart
set autoindent
set smartindent
set smarttab
set smartcase
" hilight search (eg: when using / and *)
set hlsearch
set incsearch
" set no*
set nobackup
set nowritebackup
set noundofile

" more subtle popup colors 
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold    
endif

" wrap git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" use \L to toggle display of whitespaces
nmap <leader>L :set list!<CR>

" GotoFile
nmap <silent> gf :GotoFile<CR>

" comment line
map <silent><ESC>k :s/^/# <CR>

" uncomment line
map <silent><ESC>K :s/^#\s\+/<CR>

" maximize size on split
noremap + :res<CR>:vertical res<CR>

" equalize size on split
noremap = <C-w>=

" refactor block using \rf
function! Refactor()
  let old = expand("<cword>")
  let new = input("New name to replace: ")
  execute '%s/' . old . '/' . new . '/gc'
endfunction

nmap <Leader>rf :call Refactor()<cr>

" vim python is harmful

if has('python')
    python <<EOF
def loutrage(module="paramiko", clazz="SFTPServerInterface"):
    import vim
    p = __import__(module)
    i = getattr(p, clazz)
 
    buffer = vim.current.buffer
 
    buffer.append('class %s (%s.%s):' % ('MyClass', p.__name__, i.__name__))
    buffer.append('\tdef __init__(%s ):' % ", ".join(         
        getattr(i, '__init__').im_func.func_code.co_varnames))
    buffer.append('\t\tpass')
    buffer.append('\n')
 
    for m in dir(i):                                           
        if '__' not in m and hasattr(getattr(i, m), 'im_func'):
            buffer.append('\tdef %s(%s):' % (m, ", ".join(    
                getattr(i, m).im_func.func_code.co_varnames)))
            buffer.append('\t\traise NotImplementedError()')
            buffer.append('\n')
EOF
endif

" vim: tw=80 ts=4 ft=vim
