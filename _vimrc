let mapleader = ","

"Vundle
let g:vundle_default_git_proto = 'git'
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ctrlp
Plugin 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
let g:ctrlp_by_filename = 1 " 按文件名搜索（不包含路径）
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_working_path_mode='wr'
let g:ctrlp_root_markers = ['code.txt']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $PWD.'/.cache/ctrlp'
let g:ctrlp_show_hidden = 0
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_lazy_update = 1
let g:ctrlp_match_current_file = 0
let g:ctrlp_types = ['fil', 'mru', 'buf']
let g:ctrlp_mruf_max = 250
let g:ctrlp_follow_symlinks=1
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
map <leader>fb :CtrlPMRU<CR>
map <leader>ff :CtrlP<CR>

Plugin 'bling/vim-airline'
let g:airline_left_sep = ''
let g:airline_right_sep = ''

Plugin 'vim-scripts/grep.vim'
let Grep_Default_Filelist = '*.h *.cpp *.py'
let Grep_Skip_Files = '*.o *.pyc *.log tags cscope.* core.*'
let Grep_Default_Options='-i'
let Grep_Skip_Dirs='.svn .cache setting dat hotfix log python CMakeFiles'
nnoremap <silent> <F2> :Rgrep<CR><CR><CR><CR>
nnoremap <silent> <F3> :Grep<CR><CR><CR>
nnoremap <silent> <F4> :GrepBuffer<CR><CR>

Plugin 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column '
nnoremap <silent> <F2> :Ack<CR><CR><CR><CR>

Plugin 'vim-scripts/Mark'
nnoremap <leader>mc :MarkClear<CR>

Plugin 'scrooloose/nerdtree'
map <leader>t :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=31
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeShowBookmarks=1

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Bundle 'hduzh/vim-autotag'
" let g:autotagTagsFile="tags"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nu
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set relativenumber

syntax enable
set background=dark
"colorscheme desert

filetype on
filetype plugin indent on

set showmatch
set ruler
set whichwrap+=<,>,h,l
set nobackup
set noswapfile
set backspace=indent,eol,start
" set nowrap
" set sidescroll=10

set ff=unix
set ffs=unix
set tags=tags
set encoding=utf-8
set fileencoding=utf-8
let &termencoding=&encoding
" 解决console输出乱码
" language messages zh_CN.utf-8

highlight Search ctermbg=black ctermfg=yellow term=underline
highlight ToDo ctermbg=black ctermfg=yellow term=underline


" Set to auto read when a file is changed from the outside
set autoread

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" highlight 81 column
set colorcolumn=80
highlight ColorColumn ctermbg=magenta "set to whatever you like

" show tab and trail
set list
set listchars=tab:\|\ ,trail:-

" show whitespace eol
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
set viminfo^=%

" Remove trailing whitespace when writing a buffer, but not for diff fi
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//g
        silent! %s/$//g
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()

function! My_compile_command()
	let l:ext = expand("%:e")
	if (l:ext == "erl")
		let l:include_path="./"
		let l:output_path="./"
		let l:add_path="./"

		let l:fullpath = expand("%:p")
		let l:src_index = strridx(fullpath, "src/")
		if (src_index > 0)
			let l:server_path=strpart(fullpath, 0, src_index)
			let l:include_path=server_path."/include/"
			let l:output_path=server_path."/ebin/"
			let l:add_path=server_path."/ebin/"
		endif

		exec "!erlc -I ".include_path." -o ".output_path." -pa ".add_path." +debug_info ".expand("%:p")
	elseif (l:ext == "py")
		setlocal makeprg=pylint\ --reports=n\ --msg-template=\"{path}:{line}:\ {msg_id}\ {symbol},\ {obj}\ {msg}\"\ %:p
		setlocal errorformat=%f:%l:\ %m
		:wa|silent! make|cw|redraw!
	elseif (index(["h", "cpp", "hpp", "cxx"], l:ext) >= 0)
		setlocal makeprg=g++\ -o\ %:p:r\ %:p\ -std=c++11\ -W\ -Wall\ -lm
		:wa|silent! make|cw|redraw!
	endif
	" redraw
endfunction
nmap <F5> :call My_compile_command()<cr>

function! VisualSelection(direction)
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        execute "noautocmd vimgrep " . '/'. l:pattern . '/gj' . ' **/*.h **/*.cpp **/*.py'
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

"总是显示状态行
set laststatus=2

" Auto add head info
" .py file auto add header
function! HeaderPython()
	call append(0,"# -*- coding: utf-8 -*-")
	call append(1,"# $Id$")
	call append(2,"# @file")
	call append(3,"# @author hduzh")
	normal G
	normal o
endf
autocmd bufnewfile *.py call HeaderPython()
nmap <leader>hp :call HeaderPython()<CR>

function! UpdateCache()
	silent !sh ~/.vim/bin/bg_run.sh ~/.vim/bin/make_ctags.sh $PWD/
	redraw!
	redrawstatus!
endfunction
command! Update call UpdateCache()

autocmd FileType c,cpp  map <buffer> <leader><space> :w<cr>:make<cr>
autocmd FileType c,cpp  map <buffer> <leader>o :make run<cr><cr>
nmap <leader>cn :cn<cr>
nmap <leader>cp :cp<cr>
nmap <leader>cw :cw 10<cr>
