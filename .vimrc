let mapleader=","
scriptencoding utf-8

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'Quramy/tsuquyomi'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jtai/vim-githublink'
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'szw/vim-maximizer'
call plug#end()

" Incremental search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Easymotion trigger with enter
nmap <cr> <Plug>(easymotion-overwin-w)

" Update time for git gutter
set updatetime=250

" Allow backspacing over changes made in previous sessions
set backspace=indent,eol,start

set nowrap

" Open current file in nerd tree
map <leader>n :NERDTreeFind<cr>
map <C-n> :NERDTreeToggle<CR>

" FZF file finder
map <C-p> :Files!<cr>

set nowrap
set tabstop=2 shiftwidth=2 expandtab
syntax on
colorscheme vividchalk
set cursorline
" Show path of file
set laststatus=2
set statusline=%f

" Mas ctrl-c to copy visual selection to clipboard
map <C-c> "*y
" Use system keyboard instead of vim's buffer
set clipboard=unnamed

augroup SyntaxSettings
  autocmd!
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript
augroup END

" au BufNewFile,BufRead *.hql set filetype=hive expandtab

" The below sets it so that overwriting something in visual mode from a register won't rewrite it
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

"sets it so that current line is always line 0. leader-n to toggle
set relativenumber
set number



"leader-l to move vim view to the right 30 characters
map <leader>l 30zl

"leader-p to toggle paste mode
set pastetoggle=<leader>p

"arrow keys to resize vim panes
"nnoremap <Left> :vertical resize -5<cr>
"nnoremap <Right> :vertical resize +5<cr>
"nnoremap <Up> :resize +5<cr>
"nnoremap <Down> :resize -5<cr>

"ctrl-hjkl to move between vim panes
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k

"ctrl-u and ctrl-d to move the page up or down by 5 lines
nnoremap <C-u> 5<C-Y>M
nnoremap <C-d> 5<C-E>M

"vim in hard mode
"HardTimeOn
map <leader>h :HardTimeToggle<cr>

"Folds and unfolds method definitions
" nunmap <leader>fc
" nunmap <leader>fef
map <leader>f zfim
map <leader>o zo

nnoremap <leader>m :MaximizerToggle<CR>

" Airbnb recommended settings
" Always add any detected errors into the location list
let g:syntastic_always_populate_loc_list = 1

" Don't auto-open it when errors/warnings are detected, but auto-close when no more errors/warnings are detected.
let g:syntastic_auto_loc_list = 2

" Highlight syntax errors where possible
let g:syntastic_enable_highlighting = 1

" Show this many errors/warnings at a time in the location list
let g:syntastic_loc_list_height = 5

" Don't run checkers when saving and quitting--only on saving
let g:syntastic_check_on_wq = 0

let g:syntastic_error_symbol         = '×' " There are better characters,
let g:syntastic_warning_symbol       = '⚠'
let g:syntastic_style_error_symbol   = '⚠'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_javascript_checkers    = ['eslint']
let g:syntastic_typescript_checkers    = ['eslint']
let g:syntastic_javascript_eslint_exe = '/Users/allenwu/repos/credit_card/product/dashboard/node_modules/.bin/eslint'
"let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_json_checkers          = ['jsonlint']
let g:syntastic_ruby_checkers          = ['rubocop']
let g:syntastic_scss_checkers          = ['scss_lint']
let g:syntastic_vim_checkers           = ['vint']
let g:syntastic_enable_signs = 1

" syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_check_on_open = 1
"" custom settings
" let g:syntastic_mode_map = {
"   \ "mode": "active",
"   \ "passive_filetypes": ["eruby", "ruby"]
"   \}

"set wildignore+=*\\CVS\\**
"set wildignore+=*\\Zend\\**
"set wildignore+=*\\log\\**
"set wildignore+=*\\.idea\\**
"set wildignore+=*\\.chefrepo\\**
"set wildignore+=*\\spec/reports\\**
"set wildignore+=*\\tmp\\**
"set wildignore+=*\\.DS_Store\\**
"set wildignore+=*\\*.min.js\\**


" The following remaps substitute and change commands to not overwrite any
" registers.
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
" When pasting, don't overwrite the register with what was removed
xnoremap p pgvy

" Smart casing
" IE
" /copyright      " Case insensitive
" /Copyright      " Case sensitive
set ignorecase
set smartcase
