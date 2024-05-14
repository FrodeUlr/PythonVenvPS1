call plug#begin()
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion
	Plug 'tpope/vim-fugitive'                   " Git integration in to nvim
	Plug 'Yggdroot/indentLine'                  " Line Indentations
	Plug 'farmergreg/vim-lastplace'             " Continue from where you left last time
	Plug 'raimondi/delimitmate'                 " Provides insert mode auto-completion for special-characters
	Plug 'tpope/vim-markdown'                   " Markdown runtime files
	Plug 'tpope/vim-surround'                   " Change paranthesis and quotes into other forms quickly
	Plug 'scrooloose/nerdtree'                  " File navigator
	Plug 'vim-scripts/indentpython.vim'         " Indentation script for python
	Plug 'alvan/vim-closetag'                   " Makes a close tag for html quickly
	Plug 'luochen1990/rainbow'                  " Provides different colors to different paranthesis
	Plug 'airblade/vim-gitgutter'               " Shows git diffs in the sign columns
	Plug 'lilydjwg/colorizer'                   " Provides color for the #rrggbb or #rgb color format in files
	Plug 'vim-airline/vim-airline'              " Powerline Theme / Status line
	Plug 'vim-airline/vim-airline-themes'       " Themes for vim-airline
	Plug 'rafi/awesome-vim-colorschemes'        " Change colorschemes on the fly for vim and nvim
	Plug 'ryanoasis/vim-devicons'               " Icons
	Plug 'SirVer/ultisnips'                     " Code completion using snippets from vim-snippets and custom snippets
	Plug 'honza/vim-snippets'                   " Provides snippets for ultisnips
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ludovicchabant/vim-gutentags'        " Automatically update tags file
    Plug 'tadmccorkle/markdown.nvim'            " Markdown preview
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
call plug#end()

:set number
:set relativenumber
:set autoindent
:set expandtab
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <A-h> :vsplit<CR>
nnoremap <A-k> :split<CR>
nnoremap <C-s> :w<CR>
nnoremap <C-q> :q<CR>
" Find files using Telescope command-line sugar.
nnoremap ff :Telescope find_files<CR>
nnoremap fg :Telescope live_grep<CR>
nnoremap fb :Telescope buffers<CR>
nnoremap fh :Telescope help_tags<CR>
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> ci <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)
nmap <silent> ca <Plug>(coc-codeaction)
nmap <silent> cp <Plug>(coc-diagnostic-prev)
nmap <silent> cn <Plug>(coc-diagnostic-next)
nmap <silent> re <Plug>(coc-rename)
nnoremap <C-z> :tag <C-r><C-w><CR>
nnoremap <C-x> :pop<CR>
nmap <leader>aa <Plug>(coc-codeaction-selected)
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
" colorscheme stellarized 
colorscheme afterglow
" colorscheme happy_hacking
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_theme='base16'
let g:indentLine_fileTypeExclude = ["help", "nerdtree", "diff"]
let g:indentLine_fileTypeExclude = ["help", "nerdtree", "diff", "markdown"]
let g:indentLine_bufTypeExclude = ["help", "terminal"]
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_indentLevel = 7
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:python3_host_prog = 'D:\00_Privat_Git\PythonVenvPS1\01_Venv\default\Scripts\python.exe'
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'markdown', 'powershell', 'bash=sh', 'yaml', 'json', 'javascript', 'typescript', 'css', 'scss', 'less', 'java', 'c', 'cpp', 'rust', 'go', 'lua', 'sql', 'dockerfile', 'plaintext']
lua << EOF
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", --[[ other parsers you need ]] },
  markdown = {
    enable = true,
    -- configuration here or nothing for defaults
  },
})
EOF
lua << EOF
require('lspconfig').ruff_lsp.setup {
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}
EOF
