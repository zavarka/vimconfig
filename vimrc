execute pathogen#infect()
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#whitespace#enabled=0
let g:LargeFile=100
filetype plugin indent on
set number
set hlsearch
set linebreak
set breakat+=-
syntax enable
" set showbreak=>>>>
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
set noswapfile
" set clipboard=unnamed
set display=lastline
set guioptions-=T

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
"    colorscheme solarized
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
    autocmd BufNewFile,BufRead *.ds,*.wtl set filetype=xml
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
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-6> 6gt
map <M-7> 7gt
map <M-8> 8gt
map <M-9> 9gt
map <M-0> :tablast<CR>

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
    nmap <D-[> <M-[>
    nmap <D-]> <M-]>
    vmap <D-[> <M-[>
    vmap <D-]> <M-]>
    map <D-1> <M-1>
    map <D-2> <M-2>
    map <D-3> <M-3>
    map <D-4> <M-4>
    map <D-5> <M-5>
    map <D-6> <M-6>
    map <D-7> <M-7>
    map <D-8> <M-8>
    map <D-9> <M-9>
    map <D-0> <M-0>
endif

nmap <leader>q :qa<CR>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
