" vi:ft=vim
" Neovim configuration with vim-plug
" Ported from old .vim.rc by Grok
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include vim-plug and initialize
call plug#begin('~/.local/share/nvim/plugged')

" Let vim-plug manage plugins
Plug 'junegunn/vim-plug'                       " vim-plug itself (optional, for help)
Plug 'tmhedberg/SimpylFold'                    " For folding (collapsing) code blocks
Plug 'vim-scripts/indentpython.vim'            " For Python auto-indents
Plug 'vim-syntastic/syntastic'                 " For syntax highlighting
Plug 'connorholyday/vim-snazzy'                " Color scheme
Plug 'scrooloose/nerdtree'                     " For file browsing
Plug 'tpope/vim-fugitive'                      " For Git integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " For fuzzy finding
Plug 'junegunn/fzf.vim'                        " Enhanced fzf integration

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on  " required

" Brief help
" :PlugInstall  - installs plugins; append `!` to update or just :PlugUpdate
" :PlugClean    - confirms removal of unused plugins; append `!` to auto-approve removal
" :PlugStatus   - check the status of plugins
" See `:help plug` for more details

" General preferences
" Disable bell sounds
set belloff=all

" Show line numbers
set number

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" Configure desired tab behavior, max line width, auto indents, and file format, when editing python files
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" Show error when unnecessary newlines are found
" au BufRead,BufNewFile *.py match BadWhitespace /\s\+$/

" Configure the same for frontend files
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set noexpandtab |
    \ set autoindent |
    \ set fileformat=unix

" Set encoding
set encoding=utf-8

" Enable Python syntax highlighting
let python_highlight_all=1
syntax on

" Make snazzy color scheme background transparent
let g:SnazzyTransparent = 1
" Use snazzy color scheme
colorscheme snazzy

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Open the existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Automatically save dotfiles changes when editing chezmoi-managed files
autocmd BufWritePost $HOME/.local/share/chezmoi/* ! chezmoi apply --source-path "%"

" Optional fzf.vim key bindings
nnoremap <C-p> :Files<CR>
nnoremap <C-g> :Rg<CR>
