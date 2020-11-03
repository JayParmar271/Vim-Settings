set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader = ","  "The default leader is \,but a comma is much better
let g:ctrlp_extensions = ['tag']
set nonumber "Let's activate line number.

"----------------Visuals---------------"
colorscheme atom-dark
set guifont=Fira_Code:h20
set macligatures "We want pretty symbols when available
set guioptions-=e "We don't want guitabs.
set linespace=15 "Line height specific to macvim

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

hi LineNr guibg=bg

"We fake a custom left padding for each window
set foldcolumn=2
hi foldcolumn guibg=bg
hi vertsplit guifg=bg guibg=bg

"--------------Searching-----------------"
set hlsearch
set incsearch


"--------------Split-----------------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>
nmap <C-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"----------------Mappings---------------"

"Make it easy to edit vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple heighlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make nerdtree easy to toggle.
nmap <D-1> :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

"----------------Plugins---------------"
"/
"/ CtrlP
"/
let g:ctrl_p_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

"/
"/ Greplace.vim
"/
set grepprg=ag "We want to use ag for search.

let g:grep_cmd_opts = '--line-numbers --noheading'

"----------------Auto commands---------------"

"Automatically source the vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

"----------------Laravel Specific---------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CtrlP<cr>app/Models/
nmap <Leader><Leader>v :e resources/views/<cr>

" Notes and Tips
"
"----------------Modes---------------"
" i - Insert mode
" v - Visual mode
" V - Visual mode select whole line
"
"---------------File Traversal----------------"
" j - Go down
" k - Go up
" h - Go left
" l - Go right
" 0 - Go to left side of line
" A - Go to right side of line with insert mode
" gg - Go to top of the file
" G - Go to down of the file
" zz - Center content of the file
"
" 
"
" - Press 'zz' to instantly center the line where the cursor is located. 

" Plugin Install
" 1. Open this file ~/.vim/plugins.vim
" 2. Add plugin : Save file
" 3. Come back to ~/.vimrc : Save file
" 4. Use 'PluginInstall' to install plugin
