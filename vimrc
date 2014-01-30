set nocompatible " use vim defaults

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This setting will cause the cursor to very briefly jump to a
" brace/parenthese/bracket's 'match' whenever you type a closing or opening
" brace/parenthese/bracket
set showmatch

" do incremental searching
set incsearch

" show a ruler
set ruler

" Nice statusbar
set laststatus=2
set statusline=
set statusline+=%f\                    " file name
set statusline+=%h%1*%m%r%w%0*         " flags
set statusline+=%=                     " right align
set statusline+=%-14.(%l,%c%V%)\ %<%P  " offset

" No annoying sound on errors
set noerrorbells

" Zapnutí číslování řádků. Pro vypnutí nastavte "set nonu" 
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
execute pathogen#infect()

set autoindent

set expandtab
set shiftwidth=4
set softtabstop=4

" Python indentation
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=8 textwidth=79

" Linebreak on 500 characters
set lbr
set tw=500

" Highlight character on 81-th column
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 vmap  <expr>  <LEFT>   DVB_Drag('left')
 vmap  <expr>  <RIGHT>  DVB_Drag('right')
 vmap  <expr>  <S-DOWN>   DVB_Drag('down')
 vmap  <expr>  <S-UP>     DVB_Drag('up')
 vmap  <expr>  D        DVB_Duplicate()

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Addons
set runtimepath+=~/.vim/vim-addon-manager
call vam#ActivateAddons(["vim-twig", "surround"])
