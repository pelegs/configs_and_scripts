set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
syntax on
"setlocal spell

" Vim-LaTeX stuff
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" End of Vim-LaTeX stuff

set t_Co=256 " <-- apparantly only for Vim <= 7?
"set termguicolors

let python_highlight_all=1
syntax enable           " enable syntax processing
set cursorline
autocmd BufEnter *.py set nospell
autocmd BufEnter *.pyx set nospell
autocmd BufEnter *.tex set nospell "spelllang=en_us
" autocmd BufEnter *.tex colorscheme jellybeans
colorscheme jellybeans

" set auto and smart indentation
set autoindent smartindent

" use 4 spaces for tabs
set tabstop=4 softtabstop=4 shiftwidth=4

" display indentation guides
set list listchars=tab:❘-,trail:·,extends:»,precedes:«,nbsp:×

" convert spaces to tabs when reading file
autocmd! bufreadpost * set noexpandtab | retab! 4

" convert tabs to spaces before writing file
autocmd! bufwritepre * set expandtab | retab! 4

" convert spaces to tabs after writing file (to show guides again)
autocmd! bufwritepost * set noexpandtab | retab! 4

" stricter rules for C programs
set cindent

" cursor row and column highlight
set cursorcolumn cursorline

" set relative line numbers
set relativenumber

imap <f12> <c-o>:call ToggleHebrew()<cr>
map <f12> :call ToggleHebrew()<cr>

func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc

autocmd FileType python setlocal tabstop=4 colorcolumn=79

set number          " show line numbers
set showcmd         " show command in bottom bar
set cursorline      " highlight current line
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
"set paste           " paste normaly
set foldenable      " enable folding
set foldnestmax=10  " 10 nested fold max
nnoremap <space> za " space open/closes folds

nnoremap B ^
nnoremap E $

:cd %:p:h
let g:Tex_Env_answer = "\\if\\withsol1{\<CR>\\begin{answer}\<CR><++>\<CR>\\end{answer}\<CR>}\\fi"
let g:Tex_Env_frame = "\\begin{frame}\<CR>\\frametitle{<++>}\<CR>\\end{frame}"
let g:Tex_SmartKeyQuote = 0
let g:Tex_SmartKeyDot = 0

autocmd FileType tex :setlocal sw=2 ts=2 sts=2

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl># -*- coding: iso-8859-15 -*-\<nl>\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/usr/bin/env zsh\"|$
augroup END

" vim-airline
set laststatus=2

" python highlight in L
"call SyntaxRange#IncludeEx('start="\\begin{pycode\}$" end="\\end{pycode\}$"', 'python')

vnoremap <F2> :s/^/#/g <CR>
nnoremap <F3> :let @/="" <CR>
