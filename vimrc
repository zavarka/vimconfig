execute pathogen#infect()
let g:airline#extensions#tabline#enabled=1
filetype plugin indent on
set number
set hlsearch
set linebreak
set breakat+=-
syntax enable
set showbreak=>>>>
set tabstop=4
set softtabstop=4
set expandtab
set shiftround
set shiftwidth=4
highlight ExtraWhitespace ctermbg=grey guibg=grey
highlight UnwantedTabs ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match UnwantedTabs /\t\+/
syntax on
set backspace=indent,eol,start
set splitbelow
set splitright
set listchars=tab:>\ ,eol:$
set laststatus=2
set wildmenu
set hidden
set ignorecase
set smartcase
set encoding=utf8
set autoindent
set smartindent
set history=700
set scrolloff=3
set whichwrap+=<,>
set incsearch

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

if has("gui_macvim")
    set guifont=Monaco:h15
elseif has("gui_win32")
    au GUIEnter * simalt ~x
    set lines=999 columns=999
    set guifont=Consolas:h10
endif

if has("gui_running")
    colorscheme desertEx
    highlight NonText guifg=maroon
    highlight SpecialKey guifg=maroon
endif

" Unicode chars: · ¶ ↲ « » ¬ ▸
set listchars=trail:·,precedes:«,extends:»,eol:¬,tab:▸\ 

nmap <leader>l :set list!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ==================================================
" Configure file type settings

if has("autocmd")
    autocmd BufNewFile,BufRead sources,*.inc,makefil* set filetype=make
endif

function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

nmap <silent><leader>$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap <leader>= :call Preserve("normal gg=G")<CR>

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <M-[> <<
nmap <M-]> >>
vmap <M-[> <gv
vmap <M-]> >gv

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
    nmap <D-[> <M-[>
    nmap <D-]> <M-]>
    vmap <D-[> <M-[>
    vmap <D-]> <M-]>
endif

nmap <leader>q :qa<CR>
