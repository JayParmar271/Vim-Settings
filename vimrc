set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

syntax enable

set backspace=indent,eol,start
let mapleader = ","  "The default leader is \,but a comma is much better
let g:ctrlp_extensions = ['tag']
set nonumber "Let's activate line number.
set noerrorbells visualbell t_vb= "No damn bells!
set autowriteall "Automatically writing files when switching buffers
set complete=.,w,b,u "Set our desired autocompletion
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

let @a="yiw/}
O$this->pikr = $pikr;?__const
Oprotected $pa;
/__construct
/\"
, "  

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
nmap <Leader>es :e ~/.vim/snippets/php.snippets<cr>
nmap <Leader>eus :UltiSnipsEdit<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>

"Add simple heighlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Make nerdtree easy to toggle.
nmap <D-1> :NERDTreeToggle<cr>

nmap <Leader>f :tag<space>

"----------------Reload----------------"
nmap <Leader>rp :call ReloadAllSnippets()

"----------------Plugins---------------"
"/
"/ CtrlP
"/
let g:ctrl_p_custom_ignore = 'node_modules\DS_Store\git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ Ultisnips
"/
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


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

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>


"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"----------------Laravel Specific---------------"
nmap <Leader>lr :e routes/web.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :CtrlP<cr>app/Http/Controllers/
nmap <Leader><Leader>m :CtrlP<cr>app/Models/
nmap <Leader><Leader>v :e resources/views/<cr>

" Notes and Tips
"
" CtrlPBufTag not working, Need to install brew install ctags
" Use ctags -R : Add directory for searching - Call from webhook 'ctags -R' for each commit
" ctags -R --exclude=node_modules|vendor
"
"
"----------------Modes & Copy Paste---------------"
" i - Insert mode
" v - Visual mode
" V - Visual mode select whole line
" yy - To Copy
" p - Paste
" c - Cut
" yiw - copy inner word
" yyp - yank the line
" . - Repeat last operation
" O - Go to up line + Insert mode
" o - Go to down side + Insert mode
" vat - visual select tag <style> </style> tag
" dat - delete tag
" dd - delete line

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
" cmd + 1 - Open left menu
" Use '-' Traverse in project
" d - Create new directory
" D - Delete directory or file
" % - Create new file
" ctrl + p = Search file in project
" ctrl + r = Search function in file
" ,f - Search method in project (:tag)
" :tn - Next method if same method in multiple files
" :tp - Search in previous file
" :ts - select all tags
" ctrl + ] = Go to inside method: ProjectController.php -> $project->isCreated();
" ctrl + 6 = Go back
" :Ag 'keywords' = Search in all files - Traverse using J,K


"---------------Greplace----------------"
" 1. :GSearch 
" 2. Select content you want to change
" 3. Use :s/Jay Patel/Jay Parmar
" 4. Use :Greplace
" 5. Select a
" 6. Use :wa to write all files


" - Press 'zz' to instantly center the line where the cursor is located. 


"---------------Tabs----------------"
" tabe - To open new tab
" tabc - Close tab


"---------------Surronding----------------"
" di - di( = Delete inside (
" di - di{ = Delete inside {
" ci - ci( = Change inside (
" vi - vi{ = Select inside {
" va - va{ = Select with {
" cs ` " - Single quote to double quote
" dst - <p>Test</p> - Delete surrounding tag
" cst - <p>Test</p> to <span>Test</span> - change surrounding tag 
" S - select and capital S to add new tag

"---------------Split----------------"
" :vsp - Vertical split
" :sp - Horizontal split
" control + w + j - Go down
" control + w + k - Go up
" control + w + w - Toggle

"---------------Buffer----------------"
" :bd - Buffer delete
" :bp - Go to previous location

" To run shell script command use !: !pwd , !ls

" Download theme for vim:
" https://github.com/gosukiwi/vim-atom-dark/blob/master/colors/atom-dark.vim

" Plugin Install
" 1. Open this file ~/.vim/plugins.vim
" 2. Add plugin : Save file
" 3. Come back to ~/.vimrc : Save file
" 4. Use 'PluginInstall' to install plugin

"---------------Php optimization----------------"
" ,pf - Formatting using php cs fixer
" ,su - Select then use ',su' to sort namespace by length
" ,n - To add namespace at top
" ,nf - Add namespace with line


"---------------Marks----------------"
" Capital letter work - Around multiple files 
" Create mark: m + use any alphabet
" Go to mark: ‘ + use marked alphabet
" Exact to mark position : ` + use marked alphabet
" d’M - M is marked alphabet - c'M - Change - d'M - delete - v'M - Visual
" When close and reopen vim - use ‘0 to go last location


"---------------Macros----------------"
" q + q -> Start recording with q register
" q -> stop recording
" @ + q -> Perform macro
" :reg to get macro details
