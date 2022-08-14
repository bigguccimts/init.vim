"     ________________   _    ____  ________
"    / ____/  _/_  __/  | |  / / / / /_  __/
"   / /_   / /  / /     | | / / / / / / /
"  / __/ _/ /  / /      | |/ / /_/ / / /
" /_/   /___/ /_/       |___/\____/ /_/
"
" config by xduric06
" github.com/bigguccimts

" Basic VIM stuff
:set number
:syntax on
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set encoding=utf-8
:set background=dark

" Keymaps
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <S-M-f> :Neoformat<CR>
nnoremap <C-n> :TerminalSplit bash<CR>

" Plugin Installs
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tc50cal/vim-terminal'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sbdchd/neoformat'
Plug 'safv12/andromeda.vim'

call plug#end()

" Colorscheme
":colorscheme jellybeans
:colorscheme andromeda

" Nerdtree config
" Script for automatic closing of nerdtree buffer when nvim is exited
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Airline config
let g:airline_powerline_fonts = 1

" Terminal config
let g:Terminal_InsertOnEnter = 1
let g:Terminal_CloseOnEnd = 1
let g:Terminal_CWInsert = 1
let g:Terminal_StartMessages = 0

" Formatter config
let g:neoformat_c_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-style=Microsoft'],
            \ }
let g:shfmt_opt="-ci"
let g:neoformat_only_msg_on_error = 1

" Formatting on save
augroup fmt
  autocmd!
  autocmd BufWrite * undojoin | :Neoformat
augroup END

" Coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Indent config
set termguicolors
" For jellybeans
"highlight IndentBlanklineIndent1 guibg=#151515 blend=nocombine
"highlight IndentBlanklineIndent2 guibg=#222222 blend=nocombine
" For andromeda
highlight IndentBlanklineIndent1 guibg=#23262e blend=nocombine
highlight IndentBlanklineIndent2 guibg=#2a2c33 blend=nocombine

let g:indent_blankline_char = ""
let g:indent_blankline_char_highlight_list = ["IndentBlanklineIndent1", "IndentBlanklineIndent2"]
let g:indent_blankline_space_char_highlight_list = ["IndentBlanklineIndent1", "IndentBlanklineIndent2"]
let g:indent_blankline_show_trailing_blankline_indent = v:false
