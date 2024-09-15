let mapleader=" "

set belloff=all
set clipboard=unnamedplus
set so=999

sethandler <C-C> n-v:ide i:vim
sethandler <C-F> n-v-i:ide

inoremap ii <ESC>
inoremap <ESC> <NOP>
vnoremap ii <ESC>
vnoremap <ESC> <NOP>
cnoremap ii <ESC

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'dbakker/vim-paragraph-motion'
Plug 'preservim/nerdtree'

call plug#end()

