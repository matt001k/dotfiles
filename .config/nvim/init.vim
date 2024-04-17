" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Set swapfiles to be sent to temp directory
set swapfile
set dir=/tmp

" Enable type file detection and load plugin for the detected file.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left hand side.
set number

" turn hybrid line numbers on
set number relativenumber
set nu rnu

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters
" as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set update time for vim
set updatetime=100

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Send temp files to temp directory
set swapfile
set dir=/tmp

" Allows custom .vimrc files in projects
set exrc
set secure

set omnifunc=syntaxcomplete#Complete

" PLUGINS ---------------------------------------------------------------- {{{
" Plugin code goes here.
call plug#begin('~/.vim/plugged')
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'dense-analysis/ale'
    Plug 'tpope/vim-fugitive'
    Plug 'kien/ctrlp.vim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
    Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
    " To install ripgrep on UBUNTU
    " $ curl -LO \
    " https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    " $ sudo dpkg -i ripgrep_13.0.0_amd64.deb
    Plug 'jremmen/vim-ripgrep'
    Plug 'stefandtw/quickfix-reflector.vim'
    " Requirements for auto-completion and LSP
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
    " Dev Icons
    Plug 'nvim-tree/nvim-web-devicons'
    " Git Plugins
    Plug 'airblade/vim-gitgutter'
    Plug 'NeogitOrg/neogit'
    Plug 'akinsho/git-conflict.nvim', {'tag' : '*'}
    Plug 'sindrets/diffview.nvim'
    " Harpoon
    Plug 'ThePrimeagen/harpoon', {'branch': 'harpoon2'}
    " UI Improvements
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'goolord/alpha-nvim'
call plug#end()
" }}}

" MAPPINGS --------------------------------------------------------------- {{{
" Mappings code goes here.
let mapleader = "\\"
" RipGrep
nnoremap <leader>f :Rg<Space>
" Center screen functionality
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <Leader>b :CtrlPBuffer<CR>
" No copy on delete
nnoremap <leader>d "_d
xnoremap <leader>d "_d
" No copy on pasted
xnoremap <leader>p "_dP
" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Move around highlighted text
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Set home directory
nnoremap <leader>cd :cd %:h<CR>
" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
        autocmd FileType vim setlocal foldmethod=marker
        augroup END
" This enables relative (normal) vs absolute (insert) mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END
" More Vimscripts code goes here.
" }}}

" STATUS LINE ------------------------------------------------------------ {{{
" Status bar code goes here.
" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2
" }}}

" GITGUTTER --------------------------------------------------------------- {{{
autocmd VimEnter * GitGutterEnable
autocmd VimEnter * GitGutterLineHighlightsEnable
" }}}

" DOXYGEN ---------------------------------------------------------------- {{{
let g:DoxygenToolkit_briefTag_pre="@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return "
let g:DoxygenToolkit_startCommentTag="/******************************************************************************"
let g:DoxygenToolkit_endCommentTag="*****************************************************************************/"
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="Matthew Krause"
let g:DoxygenToolkit_startCommentBlock=""
let g:DoxygenToolkit_endCommentBlock=""
" }}}

" ALE -------------------------------------------------------------------- {{{
let g:ale_lint_on_enter=1
let g:ale_linters={'c': ['all']}
let g:ale_enabled=1
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_insert_leave=0
let g:ale_lint_on_enter=0
let g:ale_lint_on_save=1
let g:ale_lint_on_filetype_changed=0
let g:ale_fixers={
    \'*': [
    \'remove_trailing_lines',
    \'trim_whitespace'
    \],
    \'c': [
    \'astyle'
    \]
\}
let g:ale_fix_on_save=1
let g:ale_completion_autoimport=1
let g:ale_c_astyle_project_options='.astylerc'
" }}}

" LUA -------------------------------------------------------------------- {{{
" Requires
lua require('_lsp')
lua require('_telescope')
lua require('_devicons')
lua require('_treesitter')
lua require('_gruvbox')
lua require('_toggleterm')
lua require('_git')
lua require('_lualine')
lua require('_harpoon')
lua require('_alpha')
" }}}

" THEMES -------------------------------------------------------------------- {{{
" Set the color scheme
set background=dark
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic='1'
colorscheme gruvbox
" }}}
