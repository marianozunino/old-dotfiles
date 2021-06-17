call plug#begin('~/.config/vim/plugged')

" SYNTAX

Plug 'vim-test/vim-test'

"
Plug 'mhinz/vim-signify', { 'branch': 'legacy' } 
Plug 'samoshkin/vim-mergetool'
Plug 'tpope/vim-commentary'
Plug 'ciaranm/securemodelines'
Plug 'machakann/vim-highlightedyank'

Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'


" =============
"    THEME
" =============
Plug 'gruvbox-community/gruvbox'
Plug 'endel/vim-github-colorscheme'


" =============
"       FZF
" =============
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" ==========
" LightLine
" ==========
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
"
"=====
" LATEX
" =====
Plug 'lervag/vimtex'

" =====
"  GIT
" =====
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
" =========
" NERDTREE
" =========
Plug 'scrooloose/nerdtree'


" ====
" WIKI
" ====
Plug 'vimwiki/vimwiki'

"==========
" SYNTAX
"==========
Plug 'sheerun/vim-polyglot'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'flowtype/vim-flow'

" autocomplete
Plug 'sirver/ultisnips'
Plug 'neoclide/coc.nvim', {'bracn':'release'}

Plug 'ryanoasis/vim-devicons'
Plug 'mg979/vim-visual-multi'

call plug#end()

