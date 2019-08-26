" .vimrc
" modified by wiz at https://github.com/wiz/dotfiles
" forked from nacx at https://github.com/nacx/dotfiles

"{{{ Automatically install the plugin manager if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"}}}

"{{{ Load plugins
call plug#begin('~/.vim/plugged')
" Plug 'jlanzarotta/bufexplorer'
Plug 'Shougo/Unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/deoplete.nvim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'scrooloose/nerdtree'
Plug 'roxma/nvim-yarp'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-commentary'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'tpope/vim-sensible'
Plug 'mhinz/vim-signify'
Plug 'sukima/xmledit'
Plug 'vim-airline/vim-airline'
call plug#end()
" }}}

"{{{ Use :help <option> to see the docs
set encoding=utf-8
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set incsearch
set ignorecase
set smartcase
set mouse=a
set hidden
set wildmode=list:longest
set number
set title
set ruler
set nospell
" }}}

"{{{ Customize view
sy on
set t_Co=256
colorscheme molokai
"}}}

"{{{ Key remaps
nmap <F2> :NERDTreeToggle<CR>
nmap <F3> :TagbarToggle<CR>
nmap <F4> :BufExplorerHorizontalSplit<CR>
nmap <silent> <F5> :!tmux splitw -v -l 5<CR><CR>

set winminheight=0
set winminwidth=0
set splitbelow
set splitright
set fillchars+=stlnc:\/,vert:│,fold:―,diff:―
"}}}

"{{{ Window manipulations
nmap s [Window]
nnoremap [Window] <Nop>

nnoremap [Window]j <C-W>j
nnoremap [Window]k <C-W>k
nnoremap [Window]h <C-W>h
nnoremap [Window]l <C-W>l

nnoremap [Window]J <C-W>J
nnoremap [Window]K <C-W>K
nnoremap [Window]H <C-W>H
nnoremap [Window]L <C-W>L

nnoremap [Window]v <C-w>v
" Centering cursor after splitting window
nnoremap [Window]s <C-w>szz

nnoremap [Window]q :<C-u>quit<CR>
nnoremap [Window]d :<C-u>Bdelete<CR>

nnoremap [Window]= <C-w>=
nnoremap [Window], <C-w><
nnoremap [Window]. <C-w>>
nnoremap [Window]] <C-w>+
nnoremap [Window][ <C-w>-
"}}}

"{{{ Use fancy buffer closing that doesn't close the split
:nnoremap <silent> <S-Left> :bprevious<CR>
:nnoremap <silent> <S-Right> :bnext<CR>
:noremap <silent> <C-Left> b
:noremap <silent> <C-Right> w

" Replace strings in local or global scope
" https://stackoverflow.com/a/597932/3540564
:nnoremap gr gd[{V%:s/<C-R>///gc<Left><Left><Left>
:nnoremap gR gD:s/<C-R>///gc<Left><Left><Left>

" :w!! sudo saves the file
cmap w!! w !sudo tee % >/dev/null
"}}}

"{{{ Unite
" Stop configuration when we can't use unite.
if v:version < 702 || $SUDO_USER != ''
  finish
endif

let g:unite_source_file_mru_limit = 200
let g:unite_source_file_mru_filename_format = ""
let g:unite_source_file_mru_time_format = ""

" Narrow vertial window, default width is 90.
let g:unite_winwidth = 30

function! s:UniteSettings()
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  imap <buffer> jj <Plug>(unite_insert_leave)
"  nmap <buffer> <Tab> <Nop>
"  imap <buffer> <Tab> <Nop>
endfunction

augroup MyUnite
  autocmd!
  autocmd FileType unite call s:UniteSettings()
augroup END

nmap f [Unite]
nnoremap [Unite] <Nop>

let s:file_rec_source = executable('ls') && unite#util#has_vimproc() ? "file_rec/async" : "file_rec"

execute printf('nnoremap <silent> [Unite]f :<C-u>Unite -buffer-name=files -start-insert buffer_tab file_mru file %s<CR>', s:file_rec_source)
nnoremap <silent> [Unite]k :<C-u>UniteWithBufferDir -buffer-name=files -start-insert file<CR>
nnoremap <silent> [Unite]l :<C-u>Unite -start-insert -buffer-name=files file_mru<CR>
nnoremap <silent> [Unite]p :<C-u>Unite poslist<CR>

function! s:ExecuteCommandOnCR(command)
  if &buftype == ''
    execute a:command
  else
    call feedkeys("\r", 'n')
  endif
endfunction

nnoremap <silent> <CR> :<C-u>call <SID>ExecuteCommandOnCR('Unite file buffer')<CR>

" unite-grep
let g:unite_source_grep_max_candidates = 200
let g:unite_source_grep_default_opts = "-HnEi"
  \ . " --exclude='*.svn*'"
  \ . " --exclude='*.log*'"
  \ . " --exclude='*tmp*'"
  \ . " --exclude-dir='**/tmp'"
  \ . " --exclude-dir='CVS'"
  \ . " --exclude-dir='.svn'"
  \ . " --exclude-dir='.git'"

nnoremap <silent> <expr> [Unite]g printf(':<C-u>Unite grep:%s:-R:%s -no-quit<CR>', expand(getcwd()), expand("<cword>"))

"}}}

"{{{ NERDTree options
let NERDTreeAutoCenter = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeMouseMode = 1
"let NERDTreeDirArrows = 1
let NERDTreeIgnore=['.*\.o$']
let NERDTreeIgnore+=['.*\~$']
let NERDTreeIgnore+=['.*\.out$']
let NERDTreeIgnore+=['.*\.so$', '.*\.a$']
let NERDTreeIgnore+=['.*\.pyc$']
let NERDTreeIgnore+=['.*\.class$']
"}}}

"{{{ Buffer manipulations
" Bufexplorer options
let g:bufExplorerSplitBelow=1
nmap [Space] [Buffer]
xmap [Space] [Buffer]
"{{{
function! s:NextNormalBuffer(loop) "{{{
  let buffer_num = bufnr('%')
  let last_buffer_num = bufnr('$')

  let next_buffer_num = buffer_num
  while 1
    if next_buffer_num == last_buffer_num
      if a:loop
        let next_buffer_num = 1
      else
        break
      endif
    else
      let next_buffer_num = next_buffer_num + 1
    endif
    if next_buffer_num == buffer_num
      break
    endif
    if ! buflisted(next_buffer_num)
      continue
    endif
    if getbufvar(next_buffer_num, '&buftype') == ""
      return next_buffer_num
      break
    endif
  endwhile
  return 0
endfunction "}}}

function! s:OpenNextNormalBuffer(loop) "{{{
  if &buftype == ""
    let buffer_num = s:NextNormalBuffer(a:loop)
    if buffer_num
      execute "buffer" buffer_num
    endif
  endif
endfunction "}}}

function! s:PrevNormalBuffer(loop) "{{{
  let buffer_num = bufnr('%')
  let last_buffer_num = bufnr('$')

  let prev_buffer_num = buffer_num
  while 1
    if prev_buffer_num == 1
      if a:loop
        let prev_buffer_num = last_buffer_num
      else
        break
      endif
    else
      let prev_buffer_num = prev_buffer_num - 1
    endif
    if prev_buffer_num == buffer_num
      break
    endif
    if ! buflisted(prev_buffer_num)
      continue
    endif
    if getbufvar(prev_buffer_num, '&buftype') == ""
      return prev_buffer_num
      break
    endif
  endwhile
  return 0
endfunction "}}}

function! s:OpenPrevNormalBuffer(loop) "{{{
  if &buftype == ""
    let buffer_num = s:PrevNormalBuffer(a:loop)
    if buffer_num
      execute "buffer" buffer_num
    endif
  endif
endfunction "}}}

noremap <silent> [Buffer]P :<C-u>call <SID>OpenPrevNormalBuffer(0)<CR>
noremap <silent> [Buffer]p :<C-u>call <SID>OpenPrevNormalBuffer(1)<CR>
noremap <silent> [Buffer]N :<C-u>call <SID>OpenNextNormalBuffer(0)<CR>
noremap <silent> [Buffer]n :<C-u>call <SID>OpenNextNormalBuffer(1)<CR>
"}}}
" }}}

"{{{ Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '»'
let g:airline_exclude_preview = 1
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␤ '
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
"}}}

"{{{ Deoplete (autocompletion)
" set pyxversion=3
let g:deoplete#enable_at_startup = 1
" let g:deoplete#disable_auto_complete = 0
set completeopt-=preview
set completeopt+=noinsert,longest,menuone
if has("patch-7.4.314")
    set shortmess+=c
endif
" Close the preview window after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Enter just selects the item in the autocomplete menu
" http://vim.wikia.com/wiki/VimTip1386
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Map Ctrl+Space to autocomplete
" https://coderwall.com/p/cl6cpq/vim-ctrl-space-omni-keyword-completion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
"}}}

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" Tmux integration
if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Close tmux when exiting vim
autocmd VimLeave * silent !tmux killp -a

" Custom file types
au BufRead,BufNewFile *.md set filetype=markdown

" Better help navigation
autocmd FileType help nnoremap <buffer> <CR> <C-]>
autocmd FileType help nnoremap <buffer> <BS> <C-T>
autocmd FileType help nnoremap <buffer> o /'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> O ?'\l\{2,\}'<CR>
autocmd FileType help nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
autocmd FileType help nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>

" Automatic commands
autocmd VimEnter *.c,*.cpp,*.h,*.java,*.py,*.go NERDTree
autocmd FileType c,cpp,h,java,python,go nested :TagbarOpen

" QuickFix window always at the bottom
autocmd FileType qf wincmd J

" Two space indent in Ruby
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Autoload changes in .vimrc
autocmd BufWritePost .vimrc source $MYVIMRC

" vim: tabstop=4 shiftwidth=4 textwidth=0 noexpandtab foldmethod=marker nowrap
