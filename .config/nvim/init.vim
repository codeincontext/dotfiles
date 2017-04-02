" vim:syntax=vim

" Problems:
" - Right cmd was escape
" - Opening neovim inside terminal buffers
" - Right command to super in vim: Change windows with 2 keys
" - ctrl+ i or o for history
" - shift parens
" - hide git from fzf

" Behavioural Configuration
""""""""""""""""""""""""""""

" without this, GitGutter slows down
" with it, new terms open in bash :/
set shell=/bin/bash

set mouse=a

" hide buffers instead of closing them (keeps undo buffers, etc)
set hidden

" it's the future and we have git
set nobackup
set noswapfile

" Auto-reload modified files (with no local changes)
set autoread

" Assume to ignore case in searches etc
set ignorecase
set smartcase

set incsearch

" Spaces > tabs
set expandtab
set smarttab

" allow backspace across indentation and lines
set backspace=indent,eol

" Delete comment character when joining commented lines
set formatoptions+=j

let g:terminal_scrollback_buffer_size=20000

" U use karaminer-elements to map right command to F18
inoremap <F18> <esc>
tnoremap <F18> <c-\><c-n>

"" Visual Configuration
"""""""""""""""""""""""

" Highlight matching parenthesis
" highlight MatchParen ctermbg=4 " disabled while I try rainbow-parenthesis

" show trailing spaces
set list listchars=tab:\ \ ,trail:·

" show line at 80 chars
set textwidth=80
set colorcolumn=+1
" don't hard wrap text at the 80 char point
set formatoptions-=t

" Setting both relativenumber and number enables hybrid line number mode
set relativenumber
set number

" iterm nightlies support true color
if (has("termguicolors"))
  set termguicolors
endif

" au InsertEnter * hi CursorLineNR ctermfg=0 ctermbg=152
" au InsertLeave * hi CursorLineNR ctermfg=59 ctermbg=238

"" Key Mappings
"""""""""""""""

" leader for loading plugins like file navigation and overlays
" - for custom text editing commands like camelCaseMotion
map <Space> <Leader>

inoremap <F20> <Esc>
tnoremap <F20> <C-\><C-n>

nmap <leader>s :terminal fish<CR>

" open the buffer in a new fullscreen tab (like tmux's <ctrl-a>z)
noremap <leader>z :tab split<CR>

" make Y yank to end of line (like it should always have done)
nmap Y y$

" use the enter key to enter command mode
nmap <CR> :

" don't yank the replaced text when pasting in visual mode
vnoremap p "_dP

" don't add to jump list when navigating by paragraph
nnoremap <silent> { :keepjumps normal! {<CR>
nnoremap <silent> } :keepjumps normal! }<CR>

" Clear search highlighting when pressing /. Escape afterwards if you don't need to search again
nnoremap / :noh<CR>/

" if bufwinnr(1)
"   map <C-=> 3<C-W>+
"   map <C--> 3<C-W>-
" endif

map _ -

set splitbelow

"" Fast pane switching
""""""""""""""""""""""

" top left
nmap <silent> <leader>u 1<c-w>w
" top left then right one
nmap <silent> <leader>i 1<c-w>w<c-w>l
" top left then right two
nmap <silent> <leader>o 1<c-w>w<c-w>l<c-w>k<c-w>l
" bottom right then left two
nmap <silent> <leader>j 99<c-w>w<c-w>h<c-w>h
" bottom right then left one
nmap <silent> <leader>k 99<c-w>w<c-w>h
" bottom right
nmap <silent> <leader>l 99<c-w>w

" resize after window size change
augroup Misc
    autocmd!
    autocmd VimResized * exe "normal! \<c-w>="
augroup END

"" Plugins
""""""""""

" you'll need vim-plug installed
call plug#begin('~/.vim/plugged')


" Plugins I could have:
" indentLine: shows indent level with a thin line
" vim-visual-increment: When you need incrementing numbers across multiple lines
" zoomwin: Zooms one pane to full size. Like I'm doing now but assuming better

"" Plugins: Managing files
""""""""""""""""""""""""""

" like a very lightweight netrw
Plug 'justinmk/vim-dirvish'
nmap <BS> <Plug>(dirvish_up)

" :Remove: Delete a buffer and the file on disk simultaneously.
" :Unlink: Like :Remove, but keeps the now empty buffer.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :Find: Run find and load the results into the quickfix list.
" :Locate: Run locate and load the results into the quickfix list.
" :Wall: Write every open window. Handy for kicking off tools like guard.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.
Plug 'tpope/vim-eunuch'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
" let g:fzf_layout = { 'window': 'enew' }

map <leader>t :FZF<cr>
nnoremap <Tab> :call fzf#run({ 'source': 'ag --hidden -g ""', 'sink': 'e', 'window': 'enew' })<cr>

" find in project
Plug 'dyng/ctrlsf.vim'

" Prompt for search term
nmap     <leader>f <Plug>CtrlSFPrompt
" Search selected term
vmap     <leader>f <Plug>CtrlSFVwordExec

nnoremap <leader>F :CtrlSFToggle<CR>

let g:ctrlsf_mapping = {
    \ 'next': 'n',
    \ 'prev': 'N',
    \ }

" vmap     <leader>ff <Plug>CtrlSFVwordPath
" nmap     <leader>fn <Plug>CtrlSFCwordPath
" nmap     <leader>fp <Plug>CtrlSFPwordPath
" nnoremap <leader>fo :CtrlSFOpen<CR>
" inoremap <leader>ft <Esc>:CtrlSFToggle<CR>


"" Plugins: Editing text
""""""""""""""""""""""""

" Binds lots of (next|previous) shortcuts to the [ and ] keys
" eg: [l and ]l for location list
"     [e and ]e to exchange the current line with [count] lines above it.
"     [<Space> and ]<Space> add newlines before and after the cursor line
" It also has some pasting and encoding shortcuts I don't use
Plug 'tpope/vim-unimpaired'

" Autocloses brackets, etc
Plug 'cohama/lexima.vim'

Plug 'tpope/vim-surround'

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Following disabled while I try sleuth
" 2 spaces > 8 spaces
set shiftwidth=2
set softtabstop=2
" makefiles use tabs
" autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab

" Detects file's indentation
Plug 'tpope/vim-sleuth'

" gcc to toggle comments on current line. gc{motion} to toggle comments over a selection
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
map  gc  <Plug>Commentary
nmap gcc <Plug>CommentaryLine

" Where ci{ changes the contents of curly braces, cir will change the contents of the current ruby block, if statement, method or class
Plug 'textobj-user'
Plug 'textobj-rubyblock'

Plug 'skattyadz/charlie.vim'

Plug 'bkad/CamelCaseMotion'
xmap  i-e    <Plug>CamelCaseMotion_ie
omap  i-e    <Plug>CamelCaseMotion_ie
xmap  i-b    <Plug>CamelCaseMotion_ib
omap  i-b    <Plug>CamelCaseMotion_ib
xmap  i-w    <Plug>CamelCaseMotion_iw
omap  i-w    <Plug>CamelCaseMotion_iw
map   -e     <Plug>CamelCaseMotion_e
map   -b     <Plug>CamelCaseMotion_b
map   -w     <Plug>CamelCaseMotion_w

Plug 'junegunn/vim-after-object'
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" If a file doesn't have whitespace, it's hard to move by whitespace with { and }
" vim-vertical lets you jump to the next block of code that's at least as long as where the cursor is
" Useful for navigating json, etc
Plug 'rbong/vim-vertical'
nno <silent> [v :Vertical b<CR>
nno <silent> ]v :Vertical f<CR>


Plug 'jeetsukumaran/vim-indentwise'
" map [- <Plug>(IndentWisePreviousLesserIndent)
" map [= <Plug>(IndentWisePreviousEqualIndent)
" map [+ <Plug>(IndentWisePreviousGreaterIndent)
" map ]- <Plug>(IndentWiseNextLesserIndent)
" map ]= <Plug>(IndentWiseNextEqualIndent)
" map ]+ <Plug>(IndentWiseNextGreaterIndent)
" map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
" map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
map [i <Plug>(IndentWiseBlockScopeBoundaryBegin)
map ]i <Plug>(IndentWiseBlockScopeBoundaryEnd)

"" Plugins: Analysing code
""""""""""""""""""""""""""

" [c and ]c to jump between hunks
" <leader>hs to stage
" <leader>hr to revert
" <leader>hp to preview
Plug 'airblade/vim-gitgutter'

" Code linter



Plug 'benekastah/neomake', { 'on': 'Neomake' }
autocmd! BufWritePost * Neomake
" current error is displayed in status bar
" jump to next error with [l and ]l (from vim-unimpaired)

" let g:neomake_open_list = 2
" let g:neomake_list_height = 5

" work out how many of these are already defined as defaults
"let g:neomake_javascript_enabled_makers = ['eslint', 'standard', 'flow']
let g:neomake_javascript_enabled_makers = ['eslint', 'standard']
"let g:neomake_jsx_enabled_makers  = ['eslint', 'standard', 'flow']
let g:neomake_jsx_enabled_makers  = ['eslint', 'standard']
let g:neomake_vim_enabled_makers  = ['vint']
let g:neomake_scss_enabled_makers = ['scsslint']
let g:neomake_error_sign   = { 'texthl': 'SignifySignDelete' }
let g:neomake_warning_sign = { 'texthl': 'SignifySignChange' }

let g:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
" Use local project's eslint
let g:neomake_javascript_eslint_exe=substitute(g:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:standard_path = system('PATH=$(npm bin):$PATH && which standard')
" Use local project's standard
let g:neomake_javascript_standard_exe=substitute(g:standard_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

" Autocmd bufwritepost *.js silent !standard-format -w %
" Set autoread

" Automatic completion for variable names, etc
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
autocmd! User YouCompleteMe call youcompleteme#Enable()
set pumheight=6
" could add C, typescript, or Go semantic support


"" Plugins: Visual
""""""""""""""""""

Plug 'mhartington/oceanic-next'

Plug 'junegunn/rainbow_parentheses.vim', { 'on': 'RainbowParentheses' }
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
map <silent> <leader>r :RainbowParentheses!!<cr>

Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }

" highlights one letter of each word that you can jump to with f
Plug 'unblevable/quick-scope'
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Plug 'pangloss/vim-javascript' " required by vim-jsx
" Plug 'rschmukler/pangloss-vim-indent', { 'for': 'javascript' }
" Plug 'othree/yajs.vim', { 'for': 'javascript' } " JS
" Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


call plug#end()

"" Post-plugin-init config
""""""""""""""""""""""""""

syntax enable
let g:oceanic_next_terminal_italic = 1
set background=dark
colorscheme OceanicNext

" highlight javascriptClassSuper cterm=italic
" highlight javascriptIdentifier cterm=italic
" this removes color from 'type'"
""highlight xmlAttrib cterm=italic
" highlight jsSuper cterm=italic
highlight special cterm=italic
" this removes color from 'type'"
highlight link xmlAttrib special
" highlight link jsModules special
" highlight link jsModuleWords special
" TODO: should I add italics to import, from, class, extends? What about let, const?
" don't highlight console :(

" TODO: Try yajs.vim again, just remove all keywords
" Should look like this https://raw.githubusercontent.com/mhartington/oceanic-next/master/oceanic-next-dark.nvim.png

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" run this to see highlight groups: :so $VIMRUNTIME/syntax/hitest.vim
