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
if has("gui_running")
  colorscheme desertEx
endif
set backspace=indent,eol,start
set splitbelow
set splitright
set listchars=tab:>\ ,eol:$
highlight NonText guifg=gray30
set laststatus=2
if has("gui_macvim")
  set guifont=Monaco:h15
else
  set guifont=Consolas:h10
  set fileformats=dos
endif
nmap <leader>l :set list!<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
