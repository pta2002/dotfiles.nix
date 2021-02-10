" Functionality
set nocompatible		        " Don't attempt vi compatibility
set nobackup			          " Don't create annoying swap files
filetype plugin indent on	  " Use filetype indent

set cot=menuone,preview

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

set foldlevel=100           " Please please PLEASE don't start with stuff collapsed

" Mappings {{{
" Use , as leader
let mapleader=" "

" Keymaps for easier usage
noremap ç :
noremap - /

" k/j go down wrapped lines
nnoremap j gj
nnoremap k gk

" Mappings for vimscript and lua {{{
augroup vimgroup
  " Loads the buffer into the 0 register and executes it
  autocmd FileType vim nnoremap <buffer> <leader>sv <cmd>%y0<cr><cmd>@0<cr>
  " Loads the buffer as a table of lines, concatenates it with newlines, and
  " evals it
  autocmd FileType lua nnoremap <buffer> <leader>sv <cmd>lua load(table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n"))()<cr>
augroup END

augroup text
  autocmd FileType text,markdown setlocal textwidth=80
augroup END
" }}}

" Vim terraform
let g:terraform_align = 1
