" Some common variables
let plugin_path="~/.vim/bundle"

" Configuration file for vim
set modelines=0         " CVE-2007-2438
set nomodeline
set tabpagemax=100

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible        " Use Vim defaults instead of 100% vi compatibility
set backspace=2         " more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"Set terminal windowsize
set termwinsize=15x0
set splitbelow
" Nor a great idea, it breaks Termdebug
" tnoremap <Esc> <C-\><C-n>:q!<ENTER>

"True-color terminal
set termguicolors

set mouse=a

"Set tree style as default for exploring folders
let g:netrw_liststyle=3

"Allow to chnage buffer without saving
set hidden

"Infinite recursion for find
set path+=**

"Set system clipboard as default
set clipboard=unnamed

"Test string for plugins install script

" Plugins
let &runtimepath.="," . plugin_path . "/vim-commentary"
let &runtimepath.="," . plugin_path . "/vim-airline"
let &runtimepath.="," . plugin_path . "/vim-indent-object"
let &runtimepath.="," . plugin_path . "/gruvbox"
let &runtimepath.="," . plugin_path . "/onedark.vim"
let &runtimepath.="," . plugin_path . "/nord-vim"
let &runtimepath.="," . plugin_path . "/vim-colors-solarized"
let &runtimepath.="," . plugin_path . "/vim-hybrid-master"
let &runtimepath.="," . plugin_path . "/vim-cpp-enhanced-highlight-master/after"
let &runtimepath.="," . plugin_path . "/YouCompleteMe"
" let &runtimepah+="," . plugin_path . "/syntastic"
let &runtimepath.="," . plugin_path . "/ale"
packadd termdebug

" Ale
let b:ale_linters=['flake8']
let g:ale_fixers=['black']
let g:ale_python_flake8_options='--ignore=E128,E127,E126,W504,E203,E501,E251'
" Only run linters named in ale_linters settings.
" For some reason this one prevents ALE to lint new tabs
" let g:ale_linters_explicit = 1
let g:ale_enabled = 0
autocmd FileType python :ALEToggle

" Debug mode
nnoremap <leader>debug <Esc>:Termdebug<Enter><C-W><C-W><C-W>L<C-W><C-W>

" Syntastic
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_flake8_args='--ignore=E128,E126,E501,W504'
" let g:syntastic_mode_map = { 'mode': 'passive' }

"Cpp Syntax highlight options
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

"Commentary plugin
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType cc setlocal commentstring=//\ %s
autocmd FileType C setlocal commentstring=//\ %s

" Themes and syntax
set background=dark
set hlsearch
colorscheme nord

filetype plugin indent on
syntax on

set laststatus=2

" Manual Tabs and spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Functions for tabs and spaces
function! UseTabs()
    set tabstop=2     " Size of a hard tabstop (ts).
    set shiftwidth=2  " Size of an indentation (sw).
    set noexpandtab   " Always uses tabs instead of space characters (noet).
    set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
    set tabstop=2     " Size of a hard tabstop (ts).
    set shiftwidth=2  " Size of an indentation (sw).
    set expandtab     " Always uses spaces instead of tab characters (et).
    set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
    set autoindent    " Copy indent from current line when starting a new line.
    set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

" call UseSpaces()

" au BufNewFile,BufRead *.py,*.pyx,*.pxd,Makefile call UseTabs()


set number relativenumber
set cursorline

" YCM stuff
set encoding=utf-8

let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_global_ycm_extra_conf = plugin_path . '/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 1

" Mappings
map <space> <leader>

" Common
map <leader>., <esc>:wq<Enter>
nnoremap <C-j> :bn<Enter>
nnoremap <C-k> :bp<Enter>
nnoremap <C-l> gt
nnoremap <C-h> gT
inoremap jj <esc>
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i
nnoremap K $
nnoremap ,, ,
nnoremap <leader>l /
noremap <leader>dir :30vs .<Enter>

" YCM
map <leader>ac :YcmCompleter FixIt<CR>
map <leader>gt :YcmCompleter GoTo<CR>
map <leader>gtd :YcmCompleter GoToDefinition<CR>
map <leader>ty :YcmCompleter GetType<CR>

" ALE
map <leader>cd :ALEDisable<CR>
map <leader>cc :ALEEnable<CR>

" Yaml stuff
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Latex stuff

autocmd Filetype tex inoremap ,mm <Esc>:wa <bar> !pdflatex tesi.tex<ENTER>
autocmd Filetype tex inoremap ,kk <Esc>:wa <bar> !pdflatex % && open %:r.pdf<ENTER>
autocmd Filetype tex noremap ,mm <Esc>:wa <bar> !pdflatex tesi.tex<ENTER>
autocmd Filetype tex noremap ,kk <Esc>:wa <bar> !pdflatex % && open %:r.pdf<ENTER>
autocmd Filetype tex inoremap ,e \begin{equation}<Enter><Enter>\end{equation}<Esc>ki
autocmd Filetype tex inoremap ,emp \emph{}<Esc>i
autocmd Filetype tex inoremap ,bf \textbf{}<Esc>i
autocmd Filetype tex inoremap ,it \textit{}<Esc>i
autocmd Filetype tex inoremap ,ee $$<Esc>i
autocmd Filetype tex inoremap ,lab \label{}<Esc>i
autocmd Filetype tex inoremap ,beg \begin{}<Esc>i
autocmd Filetype tex inoremap ,end \end{}<Esc>i
autocmd Filetype tex inoremap ,sec \section{}<Esc>i
autocmd Filetype tex inoremap ,ssec \subsection{}<Esc>i
autocmd Filetype tex inoremap ,sssec \subsubsection{}<Esc>i
autocmd Filetype tex inoremap ,cha \chapter{}<Esc>i
autocmd Filetype tex inoremap ,fig \begin{figure}[ht]<Enter>\centering<Enter>\makebox[\textwidth][c]{\includegraphics[width=12cm]{Immagini/.jpg}}<Enter>\caption{<Space>}<Enter>\label{<Space>}<Enter>\end{figure}<Esc>3k$5hi
autocmd Filetype tex inoremap ,item \begin{itemize}<Enter>\itemsep-1mm<Enter>\item<Space><Enter>\end{itemize}<Esc>kA
autocmd Filetype tex inoremap ,flalign \begin{flalign}<Enter><Space>&&<Enter>\end{flalign}<Esc>kI
autocmd Filetype tex inoremap ,ffig \begin{figure}[ht]<Enter>\centering<Enter>\begin{subfigure}{.5\textwidth}<Enter><Space>\centering<Enter><Space><Space>\includegraphics[width=1.\linewidth]{Immagini/.jpg}<Enter><Space><Space>\caption{<Space>}<Enter><Space><Space>\label{<Space>}<Enter>\end{subfigure}%<Enter>\begin{subfigure}{.5\textwidth}<Enter><Space><Space>\centering<Enter><Space><Space>\includegraphics[width=1.\linewidth]{Immagini/.jpg}<Enter><Space><Space>\caption{<Space>}<Enter><Space><Space>\label{<Space>}<Enter>\end{subfigure}<Enter>\caption{<Space>}<Enter>\label{<Space>}<Enter>\end{figure}<Esc>12k$4hi

