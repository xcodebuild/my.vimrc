" install plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
" ui
Plug 'vim-airline/vim-airline'
"Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'zefei/vim-colortuner'
Plug 'ap/vim-css-color'
" edit
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'ciaranm/detectindent'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'tmhedberg/matchit'
Plug 'alvan/vim-closetag'
Plug 'brooth/far.vim'
" tools
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'danro/rename.vim'
Plug 'roman/golden-ratio'
Plug 't9md/vim-choosewin'
" version control
Plug 'tpope/vim-fugitive'
" language
Plug 'flowtype/vim-flow', { 'do': 'npm install -g flow-bin' }
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'hail2u/vim-css3-syntax'
" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" check
Plug 'vim-syntastic/syntastic', { 'do': 'npm install -g eslint' }
call plug#end()

" config
set tabstop=2 shiftwidth=2 expandtab
"set foldmethod=syntax
" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/
set t_Co=256
set nu

set autoindent
" for performance
set ttyfast
set lazyredraw
set nocursorcolumn
set nocursorline
set norelativenumber
syntax sync minlines=256

" theme
" for vim 8
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
set background=dark
colorscheme gruvbox

" keybinding
let mapleader=" "
nmap <Leader>ss :BLines<CR>
nmap <Leader>x :Commands<CR>
nmap <Leader>pf :GFiles<CR>
nmap <Leader>bb :History<CR>
nmap <Leader>ws :Windows<CRA
nmap <Leader>wm <C-w>o<CR>
nmap <Leader>wc <C-w>c<CR>
nmap <Leader>w/ :sp<CR>
nmap <Leader>w\ :vsp<CR>
nmap <Leader>0 <Plug>(choosewin)

nmap <Leader>st :Tags<CR>
nmap <Leader>sp :Ag<CR>
nmap <Leader>gl :Commits<CR>
nmap <Leader>;; <Leader>c<Leader>
vmap <Leader>;; <Leader>c<Leader>
nmap <Leader>jj <Plug>(easymotion-overwin-f)
nmap <Leader>jJ <Plug>(easymotion-overwin-f2)
nmap <Leader>jw <Plug>(easymotion-overwin-w)

" airline
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

 "powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



" javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
set conceallevel=1

" deoplete-ternjs
" Use deoplete.

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" deoplete.
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" Use deoplete.
let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

"Add extra filetypes
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
" Use tern_for_vim.
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn))|node_modules$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


let g:jsx_ext_required = 0

let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" ========== fzf =============

"============================

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '50%'
\ })

" flow
let g:flow#enable = 0
let g:flow#autoclose = 1


" closetag
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.js,*.jsx"

" window jump
let g:choosewin_overlay_enable = 1
