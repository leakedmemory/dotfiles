:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set expandtab
:set mouse=a
:set colorcolumn=80,120

:set t_Co=256

call plug#begin()

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ray-x/lsp_signature.nvim'

call plug#end()

syntax on
colorscheme onehalfdark

nnoremap <C-f> : NERDTreeFocus<CR>
nnoremap <C-t> : NERDTreeToggle<CR>

nmap <F8> : TagbarToggle<CR>

" make tab go through lsp options
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'

let g:airline_theme='onehalfdark'
