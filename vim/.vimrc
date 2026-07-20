" Basic Settings set nocompatible      " Be iMproved, not Vi compatible
set autoindent        " Enable auto indentation
set smartindent       " Enable smart indentation
set tabstop=4         " Number of spaces a <Tab> counts for
set shiftwidth=4      " Number of spaces to use for each step of auto indent
set expandtab         " Use spaces instead of tabs
set number            " Show line numbers
set wrap              " Wrap long lines
set scrolloff=8       " Keep 8 lines above/below cursor when scrolling
set mouse=a           " Enable mouse support in all modes
set history=1000      " Remember 1000 commands in history
set undolevels=1000   " Remember 1000 changes for undo
set incsearch         " Highlight matching search patterns as you type
set hlsearch          " Highlight all matching search patterns
set ignorecase        " Ignore case in search patterns
set smartcase         " Override 'ignorecase' when search pattern contains uppercase letters
set backspace=indent,eol,start " Make backspace work like other editors
set clipboard=unnamedplus " All yank/delete operations use the system clipboard
set termguicolors
set cursorline


" Syntax Highlighting & Colors
syntax enable         " Enable syntax highlighting
set termguicolors     " Enable 24-bit RGB colors if your terminal supports it
set background=dark

"let g:everforest_transparent_background = 1 "Shows terminal bg colour rather than theme

filetype indent plugin on
let g:everforest_background = 'hard'
colorscheme everforest
let g:everforest_enable_italic = 1
