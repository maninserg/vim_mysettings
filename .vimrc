set nocompatible              " be iMproved, required
filetype off                  " required
set number                    " on number of string

"=================
"=================
" Install Plugins
"=================
"=================


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

Plugin 'preservim/nerdtree'

Plugin 'fisadev/FixedTaskList.vim'

Plugin 'majutsushi/tagbar'

Plugin 'davidhalter/jedi-vim'

packloadall                         " Plugin Supertab for jedi-vim

Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)


call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"================
"================
" Vim's settings
"================
"================


syntax on           " ON syntax highlighting
set enc=utf-8       " Choice of encoding
set ls=2
set incsearch
set hlsearch

"===============================================
" Create or don't create subsidiary files of vim
"===============================================
set nobackup                  " don't create backup's files
set noswapfile                " don't create swap's files
set undofile                  " create undo's files

set backupdir=/tmp//
set directory=/tmp//
set undodir=/tmp//


"=================
"=================
" Settings Plugins
"=================
"=================


"=====================
" Settings Vim-Airline
"=====================

set laststatus=2
let g:airline_theme='badwolf'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'


"====================
" NerdTree's Settings
"====================

map <F3> :NERDTreeToggle<CR>          " Show NERDTree for F3
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']


"====================
" TaskList's Settings
"====================

map <F2> :TaskList<CR> 	   " show list of tasks for F2


"==================
" TagBar's Settings
"==================

map <F4> :TagbarToggle<CR>   " show list of tasks for F4
"let g:tagbar_autofocus = 0  " autofocus on TagBar when open file 

"====================
" Hotkeys for buffers
"====================
map <C-q> :bd<CR> 	   " CTRL+q - close current buffer 
map <C-w> :bn<CR> 	   " CTRL+w - next buffer


"  When going over the 80-character boundary in Ruby / Python / js / C / C ++, highlight the text on a dark background
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,c,cpp set nowrap
augroup END


"====================
" jedi-vim's Settings
"====================

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_stubs_command = "<leader>s"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

let g:jedi#environment_path = "/usr/bin/python3.6"

let g:jedi#popup_select_first = 0


"=======================
" Python-mode's Settings
"=======================

" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

" call documention
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'


" check code
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" check code after save
let g:pymode_lint_write = 1

" using virtualenv
let g:pymode_virtualenv = 1

" put breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0
