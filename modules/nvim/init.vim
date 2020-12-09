" Functionality
set nocompatible		        " Don't attempt vi compatibility
set nobackup			          " Don't create annoying swap files
filetype plugin indent on	  " Use filetype indent

set mouse=a			            " Allow mouse usage

" Spacing
set tabstop=2 shiftwidth=2	" Tab size is 2
set expandtab smarttab		  " Expand tabs to spaces
set autoindent cindent		  " Automatically indent on new lines
set linebreak			          " Wrap lines

" Visuals
set number

" Handy things
set wildmenu			          " Show a pop-up menu when autocompleting
set ignorecase			        " Case-insensitive search and tab complete

set hidden			            " Let me switch buffers without saving

" Keymaps for easier usage
map ç :
map - /

" Use , as leader
let mapleader=" "
