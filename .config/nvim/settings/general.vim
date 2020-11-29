set exrc
set secure

let mapleader = ","

" https://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set rnu

" https://thoughtbot.com/blog/how-to-copy-and-paste-with-tmux-on-mac-os-x
" set clipboard=unnamedplus
let g:clipboard = {
	  \   'name': 'xclip-custom',
	  \   'copy': {
	  \      '+': 'xclip -quiet -i -selection clipboard',
	  \      '*': 'xclip -quiet -i -selection primary',
	  \    },
	  \   'paste': {
	  \      '+': 'xclip -o -selection clipboard',
	  \      '*': 'xclip -o -selection primary',
	  \   },
	  \ }

set splitbelow
set splitright

set history=500

filetype plugin on
filetype indent on

set autoread

" Return to last edit position when opening files 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7
set path=**
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
set ruler
set cmdheight=2
set pumheight=10
set hid
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set mat=2
set foldcolumn=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable 
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
if !has('gui_running')
  set t_Co=256
endif
try
    let g:seoul256_background = 233
    colorscheme seoul256
catch
endtry
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"Syntax highlighting in Markdown
au BufNewFile,BufReadPost *.md set filetype=markdown

set termguicolors

" set terminal colors
if has('nvim')
  let g:terminal_color_0 = '#4E4E4E'
  let g:terminal_color_8 = '#626262'

  let g:terminal_color_1 = '#D68787'
  let g:terminal_color_9 = '#D75F87'

  let g:terminal_color_2 = '#5F865F'
  let g:terminal_color_10 = '#87AF87'

  let g:terminal_color_3 = '#D8AF5F'
  let g:terminal_color_11 = '#FFD787'

  let g:terminal_color_4 = '#85ADD4'
  let g:terminal_color_12 = '#ADD4FB'

  let g:terminal_color_5 = '#D7AFAF'
  let g:terminal_color_13 = '#FFAFAF'

  let g:terminal_color_6 = '#87AFAF'
  let g:terminal_color_14 = '#87D7D7'

  let g:terminal_color_7 = '#D0D0D0'
  let g:terminal_color_15 = '#E4E4E4'
endif

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType css setlocal ts=2 sts=2 sw=2
autocmd FileType html.twig setlocal ts=2 sts=2 sw=2
autocmd FileType markdown setlocal ts=2 sts=2 sw=2
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
set ai "Auto indent
set si "Smart indent
set nowrap

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


func! WordProcessorMode() 
    set textwidth=0
    set wrap linebreak nolist
    setlocal formatoptions=1 
    setlocal noexpandtab 
    nnoremap j gj 
    map k gk
    setlocal spell spelllang=en_us 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

command! MakeTags !ctags -R .

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use fzf
set rtp+=/usr/local/opt/fzf

" https://thoughtbot.com/blog/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
