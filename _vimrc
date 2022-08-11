
"" To disable a plugin, add it's bundle name to the following list
"let g:pathogen_disabled = []
"call add(g:pathogen_disabled, 'ctrlp.vim')
"
"
"execute pathogen#infect()

"disable viminfo
set viminfo=""

"tells TOhtml to include folded text in the html output, allowing the user to expand
:let g:html_dynamic_folds = 1

"set backup and swap directories
set backupdir=c:/.vim/backup//
set directory=c:/.vim/swap//
set noswapfile

"disable wq - i only ever type it by accident
:cabbrev wq w

"disable ZZ - i only ever type it by accident
:nnoremap ZZ <esc>

"make backspace work like most other apps
set backspace=2 

"set font for better utf8
set guifont=Consolas:h10:cANSI:qDRAFT
set encoding=utf-8


"set line numbers
set number
set relativenumber

"turn syntax on
syntax on

"incremental search on
set incsearch

"completion options
set ignorecase
set infercase
set wildmenu
set wildignorecase
set wildmode=list:longest,full

" virtual edit - cursor can go anywhere
" set ve=all
set hidden

"default clipboard
set clipboard=unnamed

"tab options
set tabstop=4
set expandtab
set shiftwidth=4

"hide search results upon escape
nnoremap <silent> <esc> :noh<cr><esc>

"auto indent
set autoindent


"These are to cancel the default behavior of d, D, c, C
"to put the text they delete in the default register.
"Note that this means e.g. "ad won't copy the text into
"register a anymore.  You have to explicitly yank it.
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C
nnoremap s "_s
vnoremap s "_s
nnoremap S "_S
vnoremap S "_S
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
vnoremap p pgvy
vnoremap P Pgvy

"select pasted text (last changed text)
nnoremap gh `[v`]

"previous/next matching indentation
nnoremap <M-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <M-;> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>


" Alt-Space is System menu
"if has("gui")
  noremap <M-Space> :simalt ~<CR>
  inoremap <M-Space> <C-O>:simalt ~<CR>
  cnoremap <M-Space> <C-C>:simalt ~<CR>

  noremap <C-J> <C-W>j
  "inoremap <C-J> <C-W>j
  "cnoremap <C-J> <C-W>j

  noremap <C-K> <C-W>k
  "inoremap <C-K> <C-W>k
  "cnoremap <C-K> <C-W>k

  noremap <C-H> <C-W>h
  "inoremap <C-H> <C-W>h
  "cnoremap <C-H> <C-W>h

  noremap <C-L> <C-W>l
  "inoremap <C-L> <C-W>l
  "cnoremap <C-L> <C-W>l

  noremap <M-k> <C-U><C-U>
  noremap <M-j> <C-D><C-D>
  noremap <M-h> 2zH
  noremap <M-l> 2zL
"endif

"resizing short cuts
nnoremap - <c-w>-
nnoremap = <c-w>+
nnoremap _ <c-w><
nnoremap + <c-w>>


"buffer navigation shortcuts
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>


"Maximize gvim windows.
if has("gui_running")
  set lines=30 columns=150
endif



"auto syntax based on file extensions
autocmd BufNewFile,BufRead *.pkb set syntax=plsql
autocmd BufNewFile,BufRead *.pks set syntax=plsql
autocmd BufNewFile,BufRead *.pls set syntax=plsql
autocmd BufNewFile,BufRead *.prc set syntax=plsql
autocmd BufNewFile,BufRead *.pkg set syntax=plsql
autocmd BufNewFile,BufRead *.sql set syntax=plsql

autocmd BufNewFile,BufRead *.ps1 set syntax=ps1
autocmd BufNewFile,BufRead *.psm1 set syntax=ps1

autocmd BufNewFile,BufRead *.fsx set syntax=fsharp

autocmd BufNewFile,BufRead *.bml set syntax=javascript



"comment shortcuts based on filetype
function! DoPoundComment()
    silent! s/^/#/
endfunction

function! UndoPoundComment()
    silent! s/^\(\s*\)#/\1/
endfunction

function! DoDoubleSolidusComment()
    silent! s/^/\/\//
endfunction

function! UndoDoubleSolidusComment()
    silent! s/^\(\s*\)\/\//\1/
endfunction

function! DoSqlComment()
    silent! s/^/--/
endfunction

function! UndoSqlComment()
    silent! s/^\(\s*\)--/\1/
endfunction

function! DoXmlComment()
    silent! s/\(.*\)$/<!--\1-->/
endfunction

function! UndoXmlComment()
    silent! s/\(<!--\)\(.*\)\(-->\)/\2/
endfunction


autocmd BufNewFile,BufEnter *.sql noremap <M-m> :call DoSqlComment()<cr>
autocmd BufNewFile,BufEnter *.sql noremap <M-n> :call UndoSqlComment()<cr>

autocmd BufNewFile,BufEnter *.pkb noremap <M-m> :call DoSqlComment()<cr>
autocmd BufNewFile,BufEnter *.pkb noremap <M-n> :call UndoSqlComment()<cr>

autocmd BufNewFile,BufEnter *.pks noremap <M-m> :call DoSqlComment()<cr>
autocmd BufNewFile,BufEnter *.pks noremap <M-n> :call UndoSqlComment()<cr>

autocmd BufNewFile,BufEnter *.pkg noremap <M-m> :call DoSqlComment()<cr>
autocmd BufNewFile,BufEnter *.pkg noremap <M-n> :call UndoSqlComment()<cr>

autocmd BufNewFile,BufEnter *.pls noremap <M-m> :call DoSqlComment()<cr>
autocmd BufNewFile,BufEnter *.pls noremap <M-n> :call UndoSqlComment()<cr>

autocmd BufNewFile,BufEnter *.html noremap <M-m> :call DoXmlComment()<cr>
autocmd BufNewFile,BufEnter *.html noremap <M-n> :call UndoXmlComment()<cr>

autocmd BufNewFile,BufEnter *.xml noremap <M-m> :call DoXmlComment()<cr>
autocmd BufNewFile,BufEnter *.xml noremap <M-n> :call UndoXmlComment()<cr>

autocmd BufNewFile,BufEnter *.xsl noremap <M-m> :call DoXmlComment()<cr>
autocmd BufNewFile,BufEnter *.xsl noremap <M-n> :call UndoXmlComment()<cr>

autocmd BufNewFile,BufEnter *.config noremap <M-m> :call DoXmlComment()<cr>
autocmd BufNewFile,BufEnter *.config noremap <M-n> :call UndoXmlComment()<cr>

autocmd BufNewFile,BufEnter *.ps1 noremap <M-m> :call DoPoundComment()<cr>
autocmd BufNewFile,BufEnter *.ps1 noremap <M-n> :call UndoPoundComment()<cr>

autocmd BufNewFile,BufEnter *.psm1 noremap <M-m> :call DoPoundComment()<cr>
autocmd BufNewFile,BufEnter *.psm1 noremap <M-n> :call UndoPoundComment()<cr>

autocmd BufNewFile,BufEnter *.py noremap <M-m> :call DoPoundComment()<cr>
autocmd BufNewFile,BufEnter *.py noremap <M-n> :call UndoPoundComment()<cr>

autocmd BufNewFile,BufEnter *.cs noremap <M-m> :call DoDoubleSolidusComment()<cr>
autocmd BufNewFile,BufEnter *.cs noremap <M-n> :call UndoDoubleSolidusComment()<cr>

autocmd BufNewFile,BufEnter *.json noremap <M-m> :call DoDoubleSolidusComment()<cr>
autocmd BufNewFile,BufEnter *.json noremap <M-n> :call UndoDoubleSolidusComment()<cr>

autocmd BufNewFile,BufEnter *.js noremap <M-m> :call DoDoubleSolidusComment()<cr>
autocmd BufNewFile,BufEnter *.js noremap <M-n> :call UndoDoubleSolidusComment()<cr>

autocmd BufNewFile,BufEnter *.bml noremap <M-m> :call DoDoubleSolidusComment()<cr>
autocmd BufNewFile,BufEnter *.bml noremap <M-n> :call UndoDoubleSolidusComment()<cr>

"shortcut to clean up some whitespace
function! ConsolidateWhitespace()
    silent! s/\v(\s{0,}\S\s)\s{1,}/\1/g
    silent! s/\v(\s{0,}\S)\s\(/\1\(/g
    silent! s/\v(\s{0,}\S)\s\;/\1\;/g
    silent! s/\v(\s{0,}\S)\s\)/\1\)/g
    silent! s/\v(\s{1,}$//
endfunction

noremap <leader>s :call ConsolidateWhitespace()<CR>

"shortcut for dbms_output.put_line()
nnoremap <Leader>d odbms_output.put_line();<esc>hi

"shortcut to highlight arbitrary lines
nnoremap <leader>h :call matchadd('Search', '\%'.line('.').'l')<cr>
nnoremap <leader>c :call clearmatches()<cr>


" custom highlighing groupd
" hi statusline guifg=#2B91AF	
set statusline=%#statusline#       "use comment highlighting
set statusline+=[%n]\  
set statusline+=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2		"always show status line





" make modifiable state match RO state of file
function! UpdateModifiable()
  if !exists("b:setmodifiable")
    let b:setmodifiable = 0
  endif
  if &readonly
    if &modifiable
      setlocal nomodifiable
      let b:setmodifiable = 1
    endif
  else
    if b:setmodifiable
      setlocal modifiable
    endif
  endif
endfunction
autocmd BufReadPost * call UpdateModifiable()



"defaults for splitting
set splitright
set splitbelow


"set colr scheme
colorscheme rubyblue


"shortcut to show buffer list
nnoremap <M-o> :FufBuffer<CR>


"gui options - scrollbars
au VimEnter * if line('$') > &lines | set go+=r | else | set go-=r | endif
au VimResized * if line('$') > &lines | set go+=r | else | set go-=r | endif
set go+=b

"gui options toolbars
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
noremap <leader><leader> :normal @m<CR>


"whole line completion
inoremap <c-l> 


"shortcut to wrap text
nnoremap <leader>w :set opfunc=Wrap<cr>g@
vnoremap <leader>w :<c-u>call Wrap(visualmode(),1)<cr>

function! InputChar()
    let c = getchar()
    return type(c) == type(0) ? nr2char(c) : c
endfunction

function! Wrap(type,...)
    let char1 = InputChar()

    if char1=~ "\<esc>" || char1 =~ "\<c-c>"
        return
    endif

    if char1 == "(" 
        let char2 = ")"
    elseif char1 == ")"
        let char2 = "("
    elseif char1 == "{"
        let char2 = "}"
    elseif char1 == "}"
        let char2 = "{"
    elseif char1 == "["
        let char2 = "]"
    elseif char1 == "]"
        let char2 = "["
    elseif char1 == "<"
        let char2 = ">"
    elseif char1 == ">"
        let char2 = "<"
    else
        let char2 = char1
    endif

    if a:type == 'line' || a:type == 'char'
        execute "normal! `[v`]\<esc>`>a".char2."\<esc>`<i".char1."\<esc>`<"
    else
        execute "normal! \<esc>`>a".char2."\<esc>`<i".char1."\<esc>`<"
    endif
endfunction

"shortcut to select indented text
function! SelectIndent()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfunction
nnoremap <leader>t :call SelectIndent()<CR>

"shortcut to kill a buffer without closing the window
"   go to previous tab, kill previous tab
nnoremap <leader>b :b# \| bw# <CR>
nnoremap <leader>b! :b# \| bw!# <CR>

" Highlight a column in csv text.
" :Csv 1    " highlight first column
" :Csv 12   " highlight twelfth column
" :Csv 0    " switch off highlight
function! CSVH(colnr)
  if a:colnr > 1
    let n = a:colnr - 1
    execute 'match Keyword /^\([^,]*,\)\{'.n.'}\zs[^,]*/'
    execute 'normal! 0'.n.'f,'
  elseif a:colnr == 1
    match Keyword /^[^,]*/
    normal! 0
  else
    match
  endif
endfunction
command! -nargs=1 Csv :call CSVH(<args>)


"font
if has("gui")
    set guifont=Cascadia_Code:h10:cANSI:qDRAFT
endif
