set nocompatible

let mapleader=","



" GESTION DES PLUGINS {{{
runtime! autoload/pathogen.vim
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()
" }}}


""""""""""""""""""""""""""""""""
" EDITION
""""""""""""""""""""""""""""""""
set encoding=UTF-8
set fileencoding=UTF-8

set hidden
set virtualedit=all

" la commande c(hange) affiche un $ à la fin de la partie à éditer
set cpoptions+=ces$

"Enregistrer la session avec <F2>
"map <F2> :mksession! ~/vim_session <cr>
"Rappeler la session avec <F3>
"map <F3> :source ~/vim_session <cr>



""""""""""""""""""""""""""""""""
" AFFICHAGE
""""""""""""""""""""""""""""""""

" souligner la ligne en cours d'édition lorsqu'on est en mode insertion
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" Commencer la ligne suivante au même niveau d'indentation
set autoindent
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'

" montrer la commande en cours de frappe dans la barre d'état
set showcmd

" Voir les numéros de ligne
set number

" Copier/coller depuis le presse papier de windows
set clipboard=unnamed

" Make command line two lines high                       	
set ch=2

" set visual bell -- i hate that damned beeping
set vb

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" montrer les résultats de recherche en cours de saisie d'un motif
set pastetoggle=<F2>
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
"set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,

" Toggle paste Mode
nmap <silent> ,n :set invhls<CR>:set hls?<CR>
" Set filetype stuff to on
filetype on
filetype plugin on
filetype indent on
syntax on

" Activation omnicomplete et paramétrage pour comportement IDE-like
set ofu=syntaxcomplete#Complete                                    
set completeopt=longest,menuone

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set showmatch     " set show matching parenthesis
"    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
"    shiftwidth, not tabstop

set history=1000             						" remember more commands and search history
set undolevels=1000      	   						" use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class 			" 
set title                							" change the terminal's title

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
set ch=2

set clipboard=unnamed

""""""""""""""""""""""""""""""""
" GUI
""""""""""""""""""""""""""""""""

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

" no toolbars
set guioptions=ac

if !has("gui_running") 
	set t_Co=256
endif
if has("win32")
	set guifont=Consolas:h9
endif
if has("gui_running")
	set lines=999 columns=999
endif
colorscheme xoria256

"""""""""""""""""""""""""""""""
" IDE LIKE
"""""""""""""""""""""""""""""""

" http://vim.wikia.com/wiki/VimTip1386
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Raccourci vers NERDTree
nmap <F7> :NERDTreeToggle<CR>
nmap <S-F7> :NERDTreeClose<CR>



"""""""""""""""""""""""""""""""
" RACCOURCIS
"""""""""""""""""""""""""""""""

" Changer le curseur de fenêtre 
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Fermer une fenêtre 
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>
noremap <silent> ,cw :close<cr>

" Bouger une fenêtre 
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Echanger buffer courant avec l'alternate
nmap <silent> <leader>a :b#<cr>

" Parcourir les buffers avec ,b puis tab
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nmap <silent> <leader>b :buffers<cr>:b<space>


"indentation du document et retour du curseur à sa position avant indentation,
"avec ,=
fun! IndentFileAndSetCursorPosition()
	let save_cursor = getpos(".")
	execute "normal 1GVG=<CR>"
	call setpos('.', save_cursor)
endfun
nmap <silent> ,= :call IndentFileAndSetCursorPosition()<CR>

"sélection de tout le document
nmap <c-a> 1GVG

"w!! pour enregistrement root quand RO
cmap w!! w !sudo tee % >/dev/null

"Edition rapide de .vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Remap j and k to act as expected when used on long, wrapped, lines
"nnoremap j gj
"nnoremap k gk     

" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yanked stack (also, in visual mode)
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Quick alignment of text
" map <leader>al :left<CR>
" nmap <leader>ar :right<CR>
" nmap <leader>ac :center<CR>

" Commencer à scroller dès qu'il reste 3 lignes (en haut et en bas)
set scrolloff=3


"Configuration de minibufexplorer
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 
