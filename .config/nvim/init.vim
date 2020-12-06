" ------------
" -- Plugins --
" ------------
call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'jeetsukumaran/vim-indentwise'

call plug#end()



" --------------
" -- Settings --
" --------------

" Assume to ignore case in searches etc
set ignorecase
set smartcase

set incsearch

" Delete comment character when joining commented lines
set formatoptions+=j

" make Y yank to end of line (like it should always have done)
nmap Y y$

" don't yank the replaced text when pasting in visual mode
vnoremap p "_dP

" don't add to jump list when navigating by paragraph
nnoremap <silent> { :keepjumps normal! {<CR>
nnoremap <silent> } :keepjumps normal! }<CR>

" Clear search highlighting when pressing /. Escape afterwards if you don't need to search again
nnoremap / :noh<CR>/



" --------------------
" -- Plugin Mapping --
" --------------------


if exists('g:vscode')
  " https://github.com/asvetliakov/vscode-neovim#vim-commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  nmap <D-/> gcc
  xmap <D-/> gc

  nmap <Space> <Plug>VSCodeNotify

  nnoremap <silent> <Space> :<C-u>call VSCodeNotify('vspacecode.space')<CR>
  "nnoremap <space> :call VSCodeNotify('whichkey.show')<CR>
endif

" ------------
" -- Unused --
" ------------


" Binds lots of (next|previous) shortcuts to the [ and ] keys
" eg: [l and ]l for location list
"     [e and ]e to exchange the current line with [count] lines above it.
"     [<Space> and ]<Space> add newlines before and after the cursor line
" It also has some pasting and encoding shortcuts I don't use
" Plug 'tpope/vim-unimpaired'

" Autocloses brackets, etc
" Plug 'cohama/lexima.vim'

" Plug 'skattyadz/charlie.vim'

" Plug 'bkad/CamelCaseMotion'
" xmap  i-e    <Plug>CamelCaseMotion_ie
" omap  i-e    <Plug>CamelCaseMotion_ie
" xmap  i-b    <Plug>CamelCaseMotion_ib
" omap  i-b    <Plug>CamelCaseMotion_ib
" xmap  i-w    <Plug>CamelCaseMotion_iw
" omap  i-w    <Plug>CamelCaseMotion_iw
"map   -e     <Plug>CamelCaseMotion_e
"map   -b     <Plug>CamelCaseMotion_b
"map   -w     <Plug>CamelCaseMotion_w

"Plug 'junegunn/vim-after-object'
" va=  visual after =
" ca=  change after =
" da=  delete after =
" ya=  yank after =
"autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" If a file doesn't have whitespace, it's hard to move by whitespace with { and }
" vim-vertical lets you jump to the next block of code that's at least as long as where the cursor is
" Useful for navigating json, etc
Plug 'rbong/vim-vertical'
"nno <silent> [v :Vertical b<CR>
"nno <silent> ]v :Vertical f<CR>


"Plug 'jeetsukumaran/vim-indentwise'
" map [- <Plug>(IndentWisePreviousLesserIndent)
" map [= <Plug>(IndentWisePreviousEqualIndent)
" map [+ <Plug>(IndentWisePreviousGreaterIndent)
" map ]- <Plug>(IndentWiseNextLesserIndent)
" map ]= <Plug>(IndentWiseNextEqualIndent)
" map ]+ <Plug>(IndentWiseNextGreaterIndent)
" map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
" map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
"map [i <Plug>(IndentWiseBlockScopeBoundaryBegin)
"map ]i <Plug>(IndentWiseBlockScopeBoundaryEnd)




