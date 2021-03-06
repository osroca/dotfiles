" A great overview of the rationale behind some of these options is given

" here: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" First, make the leader and command characters easier to type
let mapleader=","
nnoremap ; :
" Add some commands to quickly open or source this file
    nmap <Leader>1 :e $MYVIMRC<CR>
    nmap <Leader>so :so %<CR>

" Now we need to load vundle, it manages all of the extra plugins for vim
" It must be done first
" Bootstrap
let root = '~/.vim/bundle/'
let src = 'http://github.com/gmarik/vundle.git'

if !isdirectory(expand(root, 1).'/vundle')
  exec '!git clone '.src.' '.shellescape(root, 1).'/vundle'
endif

exec 'set rtp+='.root.'/vundle'

call vundle#rc(root)

" Vundle configs are stored in a separate file, source it.
source ~/.vim/settings/vundle.vim
nmap <Leader>vu :e ~/.vim/settings/vundle.vim<CR>

let g:ackprg = 'ag --nogroup --nocolor --column'


"BASIC OPTIONS
set tags=./tags;/
set shell=bash
set encoding=utf-8
set nocompatible
set number        " show line numbers
set nowrap        " don't wrap lines
set tabstop=8     " a tab is eight spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set expandtab     " expand tabs to spaces
set copyindent    " copy the previous indentation on autoindenting
set nosmartindent
set cindent       " useful for python
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set hidden               " hide the old buffer when switching
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.sass-cache,*/_site/*
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " no, seriously, don't beep
set clipboard+=unnamed    " use system clipboard
set lazyredraw
set mouse=a             " use mouse in nvich modes
set autowrite

" These are all options releated to searching
set ignorecase
set smartcase
set gdefault
set hlsearch

" color too-wide columns
syntax on         " syntax highlighting, natch

" better completion popup options
highlight Pmenu ctermbg=238 gui=bold
set completeopt=menuone


autocmd BufEnter Makefile set noexpandtab | set tabstop=4

" Use 'extra magic' for regex searches
nnoremap <space> ?
vnoremap <space> ?

" Some  general reformatting command(s)
" strip whitespace at end of line
nnoremap <Leader>f$ :%s/\s\+$//<CR>:let @/=''<CR>

"fix line (or visual block lines)
nnoremap <Leader>fl :normal gqq==<CR>
vnoremap <Leader>fl :normal gvgqgv=<CR>
" fix operator/type declaration spacing (single space each side) on line
nnoremap <Leader>ml :call ExpandDelimited()<CR>
vnoremap <Leader>ml :call ExpandDelimited()<CR>

"autocmd BufNewFile,BufRead *.hx set formatprg=astyle\ --style=java\ -A2p
autocmd BufNewFile,BufRead *.hx setlocal formatprg=uncrustify\ -l\ cs\ --no-backup\ 2>/dev/null
autocmd BufNewFile,BufRead *.js setlocal makeprg=phantomjs\ %
autocmd BufNewFile,BufRead *.cpp setlocal formatprg=uncrustify\ --no-backup\ 2>/dev/null

:autocmd BufNewFile,BufRead *.md set tw=80
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }

nnoremap <Leader>e :make run<CR>

function! ExpandDelimited()
    " new line after opening paren/bracket
    :s/{/{\r/e
    :s/\[/\[\r/e
    :s/,/,\r/e
    exe "normal :vi[="
    exe "normal :vi{="
endfunction


"GLOBAL AUTOMATIC ACTIONS
" autosave on lost focus
au FocusLost * :wa

" tab through buffers in normal mode
map <silent> <S-TAB> <C-W>W

nmap <expr><silent> q winnr() != 1 ? ":q\<CR>" : "q"

" Show cheats
map <leader>ch :call ToggleCheatSheet()<CR>
augroup thx
    autocmd BufEnter */dhx/* set noexpandtab | set tabstop=4
    autocmd BufEnter */thx/* set noexpandtab | set tabstop=4
augroup END


" if exists('+colorcolumn')
"   set colorcolumn=80
" else
"     au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" endif

set guifont=Monaco\ for\ Powerline:h13

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    let targetWin =  1
    exe targetWin."wincmd w"
    let foo = 0
    while winwidth('%') < 5 || winheight('%') < 5 || targetWin > bufnr("$")
        let targetWin = targetWin + 1
        exe targetWin."wincmd w"
    endwhile

    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
    exe targetWin."wincmd w"
endfunction

" SCSS compiler
if !exists('*SCSStocss')
  function! SCSStocss()
    "let src = tempname()
    let src = bufname('%')
    echo src
    let dst = substitute( bufname('%'),'.scss','.css','g' )
    echo 'writing css to ' . dst
    "execute 'w ! sass --sourcemap=none --scss -s ' . dst
    w
    execute '! sass --poll '. src . ':' . dst
    endfunction
endif
" convert scss to css when the buffer is written
au! BufWriteCmd *.scss call SCSStocss()

" nmap <silent> <expr><CR> winnr() != 1 && &buftype =='' ? ":call DoWindowSwap()\<CR>" : "\<CR>"
nmap <silent> <tab> :wincmd w<CR>

" MISC KEY MAPPING

" force write a file
cmap w!! w !sudo tee % >/dev/null
" insert a newline  below in normal mode
nnoremap <C-J> hmao<esc>`a

" execute the current line as a shell command, insert
" results below the line
nnoremap <Leader>r :exe ':r ! '.getline('.') <CR>

" stamp paste with capital S
nnoremap S "_diwP"

map <Leader>pc :call ToggleEnablePreview()<CR>

" requires vaxe
map <Leader>oh :call vaxe#OpenHxml()<CR>
map <Leader>ct :call vaxe#Ctags()<CR>
map <Leader>ic :call vaxe#ImportClass()<CR>
map <Leader>pj :call vaxe#ProjectHxml()<CR>

" All of my 'panels'
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
map <Leader>w :NERDTreeToggle<CR>
map <Leader>g :TagbarToggle<CR>
"map <Leader>y :YRShow<CR>


" browser refresh settings
let g:RefreshRunningBrowserDefault = 'chrome'

" echo current syntax scope
map <Leader>syn :echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name")
            \. "> trans<"
            \. synIDattr(synID(line("."),col("."),0),"name")
            \. "> lo<"
            \. synIDattr(synIDtrans(synID(line("."),col("."),1)), "name")
            \. ">"<CR>

"showmarks
highlight ShowMarksHLl   cterm=bold ctermfg=1 ctermbg=12 gui=bold guifg=black guibg=lightblue
highlight ShowMarksHLu   cterm=bold ctermfg=1 ctermbg=12 gui=bold guifg=darkblue guibg=lightblue
highlight ShowMarksHLo   cterm=bold ctermfg=8 ctermbg=12 gui=bold guifg=darkgray guibg=lightblue
highlight ShowMarksHLm   cterm=bold ctermfg=1 ctermbg=4 gui=bold guifg=white guibg=lightblue

"higlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction
au BufWritePre *.py,*.js :call TrimWhiteSpace()

"python
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType python set omnifunc=pythoncomplete#Complete
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
"Javascript
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"HTML
au FileType html set omnifunc=htmlcomplete#CompleteTags
"CSS
au FileType css set omnifunc=csscomplete#CompleteCSS
