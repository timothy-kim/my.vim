set nocompatible

"Vundle
filetype off

"vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
""" required! 
Bundle 'gmarik/vundle'

" My Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'pangloss/vim-javascript'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'derekwyatt/vim-scala'

filetype plugin indent on

set number
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround
set expandtab
set smartindent
set autoindent
set showmatch
set vb t_vb= "no beeping
set ruler
set cmdheight=2
set hlsearch

"window movement, get rid of ctrl+w
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


"precision cursor movement using cursor keys
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj



if has("gui_running")
    set guioptions-=T "no toolbar for gui
    set antialias

    "autocmd vimenter * if argc() | set lines=50 | set columns=85 | else | set lines=999 | set columns=999 | endif

    set lines=50
    set columns=85

    colorscheme wombat
    if has("gui_gtk2")
        "linux
    elseif has("gui_win32")
        "windows
        set guifont=Consolas:h10
    else
        "mac
        set transparency=10
        set guifont=Consolas:h10
    endif
endif


" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Open vimrc in the new tab
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>


"Don't open nerdtree on startup
let g:nerdtree_tabs_open_on_gui_startup=0 

" MACROS
"trim all lines
map <F3> :%s/^\s\+//g<CR>
map <F4> :%s/\s\+$//g<CR>
map <F5> :%s/^\s\+//g<CR>:%s/\s\+$//g<CR>

"Latex stuff
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:Tex_ViewRule_pdf='open'
let g:Tex_ViewRule_ps='open'
let g:Tex_ViewRule_dvi='open'


" Use the same symbols as TextMate for tabstops and EOLs
set list!
set listchars=tab:▸\ ,eol:¬

"some of the settings are from http://www.stripey.com/vim/vimrc.html

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
  syntax on
endif

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,slang set cindent

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro

" for Perl programming, have things in braces indenting themselves:
autocmd FileType perl set smartindent

" for CSS, also have things in braces indented:
autocmd FileType css set smartindent

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for both CSS and HTML, use genuine tab characters for indentation, to make files a few bytes smaller:
" No longer needed, because we are minifying them anyways.
"autocmd FileType html,css set shiftwidth=2
"autocmd FileType html,css set softtabstop=2
"autocmd FileType html,css set tabstop=2

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

" show the `best match so far' as search strings are typed:
set incsearch

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" allow <BkSpc> to delete line breaks, beyond the start of the current
" insertion, and over indentations:
set backspace=eol,start,indent

" have <Tab> (and <Shift>+<Tab> where it works) change the level of
" indentation:
inoremap <Tab> <C-T>
inoremap <S-Tab> <C-D>
" [<Ctrl>+V <Tab> still inserts an actual tab character.]

" check spelling for html, xml, tex and mail files
autocmd FileType html,xml,tex,mail set spell

"lilypond
set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim

