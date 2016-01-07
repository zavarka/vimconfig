execute pathogen#infect()

" Airline customizations
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#show_buffers=1
let g:airline#extensions#tabline#tab_nr_type=1
let g:airline#extensions#tabline#show_tab_nr=1
let g:airline#extensions#tabline#buffer_idx_mode=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_close_button=1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" let g:airline_theme='solarized'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''
let g:LargeFile=100

" BufferExplorer customizations
let g:bufExplorerShowNoName=1
let g:bufExplorerDefaultHelp=1
let g:bufExplorerShowUnlisted=1
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
highlight ExtraWhiteSpace ctermbg=grey guibg=grey
highlight UnwantedTabs ctermbg=red guibg=red
match ExtraWhiteSpace /\s\+$/
match UnwantedTabs /\t\+/
syntax on
set backspace=indent,eol,start
set splitbelow
set splitright
set listchars=tab:>\ ,eol:$
set laststatus=2
set wildmenu
set wildmode=list:longest
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
set cursorline
" Unicode chars: · ¶ ↲ « » ¬ ▸
set listchars=trail:·,eol:┆,tab:▶\ 

if has("gui_macvim")
    set guifont=Source_Code_Pro:h14
elseif has("gui_win32")
    au GUIEnter * simalt ~x
    set lines=999 columns=999
    set guifont=Source_Code_Pro:h9
endif


" ==================================================
" Configure file type settings
if has("autocmd")
    autocmd BufNewFile,BufRead sources,dirs,*.inc,makefil* set filetype=make
    autocmd BufNewFile,BufRead *.wtl,*.wtq,*.man,*.mum,*.ds,*.dm,*.dc set filetype=xml
    autocmd FileType xml,html,xhtml set ts=2 sts=2 sw=2
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

function! FixColorscheme()
    if has("gui_running")
        highlight NonText guifg=maroon
        highlight SpecialKey guifg=maroon guibg=NONE
        " highlight VertSplit cterm=reverse guifg=#839496 guibg=#839496
        highlight CursorIM guibg=#ff3300

        if (g:colors_name =~ "lucius")
        endif
    endif
endfunction

if has("gui_running")
    " colorscheme desertEx
    " colorscheme solarized
    " colorscheme github
    colorscheme gruvbox
    set background=dark
    call FixColorscheme()
endif

augroup mycolorschemes
    au!
    au ColorScheme * call FixColorscheme()
augroup END

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap * :call VisualSelection('f')<CR>
"vnoremap # :call VisualSelection('b')<CR>

" Search using visual selection as pattern
vnoremap // y/<C-R>"<CR>
" Copy the current file's path to the clipboard
nmap <leader>cp :let @* = expand("%:p")<CR>
" Copy the current file's path to the unnamed register
nmap <leader>yp :let @" = expand("%:p")<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Remove trailing spaces
nmap <leader>r$ :call Preserve("%s/\\s\\+$//e")<CR>
" Reindent buffer
nmap <leader>r= :call Preserve("normal gg=G")<CR>
" Remove ^M characters
nmap <leader>rm :call Preserve("%s/\\r//ge")<CR>
" Shift lines
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" Indent using Tab
nmap <Tab> >>
vmap <Tab> >gv
" Unindent using Shift-Tab
nmap <S-Tab> <<
vmap <S-Tab> <gv
" Quit all windows
nmap <leader>qa :qa<CR>
" Close the current buffer
nmap <leader>bd :bd<CR>
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
map <leader>tt :tabnew<CR>
map <leader>te :tabedit
map <leader>tc :tabclose<CR>
map <leader>to :tabonly<CR>
map <leader>tm :tabmove

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
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

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

