set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()
syntax on
setlocal spell

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
"autocmd BufEnter *.tex colorscheme jellybeans
colorscheme jellybeans

set expandtab     " don't use actual tab character (ctrl-v)
set tabstop=4     " tabs are at proper location
set shiftwidth=4  " indenting is 4 spaces
set softtabstop=4 " something
set autoindent    " turns it on
set smartindent   " does the right thing (mostly) in programs
set cindent       " stricter rules for C programs

"set spell spelllang=en_us
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

autocmd FileType python setlocal tabstop=4

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
augroup END
