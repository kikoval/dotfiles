
set nocompatible " use vim defaults

" Use Pathogen:
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" have syntax highlighting in terminals which can display colours:
if has('syntax') && ((&t_Co > 2) || has('gui_runing'))
  syntax on
    " Zvýrazňování výsledků hledání
    set hls
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Pathogen:
call pathogen#infect()

set autoindent

set expandtab
set shiftwidth=4
set softtabstop=4

" This setting will cause the cursor to very briefly jump to a
" brace/parenthese/bracket's 'match' whenever you type a closing or opening
" brace/parenthese/bracket
set showmatch

" do incremental searching
set incsearch

" Python indentation
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8 textwidth=79

" Zapnutí číslování řádků. Pro vypnutí nastavte "set nonu" 
set nu

" Zalamování řádků (místo pokračování v jednom dlouhém)
" set lbr

" Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" show a ruler
set ruler

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
    filetype plugin indent on

    " Autocomplete for CSS files
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
    autocmd BufNewFile,BufRead *.scss set ft=scss.css

    " When editing a file, always jump to the last known cursor position.
    " " Don't do it when the position is invalid or when inside an event handler
    " " (happens when dropping a file on gvim).
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd")
  
 command! Q q " Bind :Q to :q

 " Pasting raw text without indending, etc.
 set pastetoggle=<F2>

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset
