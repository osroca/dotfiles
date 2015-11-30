syntax enable
filetype off
if has("gui_running") || &term == "xterm-256color" || &term == 'screen'
    let g:fancy_term = 1
else
    let g:fancy_term = 0
endif
Plugin 'vim-addon-mw-utils'
Plugin 'benmills/vimux'
" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
    let g:session_autoload = 'yes'
    let g:session_autosave = 'yes'
" original repos on github
"Plugin 'Shougo/neocomplcache-snippets-complete'
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'zakj/vim-showmarks'
Plugin 'Lokaltog/vim-easymotion'

" Plugin 'Raimondi/delimitMate'
    " nnoremap <Leader>ds :DelimitMateSwitch<CR>
    " let g:delimitMate_expand_cr = 1
Plugin 'Rip-Rip/clang_complete'
Plugin 'airblade/vim-gitgutter'
" Plugin 'mattn/gist-vim'
Plugin 'ap/vim-css-color'
Plugin 'PProvost/vim-markdown-jekyll'
Plugin 'Shougo/unite.vim'
Plugin 'goldfeld/vim-seek'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'garbas/vim-snipmate'
Plugin 'pangloss/vim-javascript'
Plugin 'honza/vim-snippets'
Plugin 'hsitz/VimOrganizer'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'mileszs/ack.vim'
    nnoremap <Leader>a :Ack<space>
    let g:ackprg = 'ag --nogroup --nocolor --column'
    " let g:ackprg="ack --with-filename --ignore-case --all --nocolor --nogroup --follow --column"
Plugin 'jdonaldson/vaxe'
Plugin 'jdonaldson/vim-powerline'
    if g:fancy_term
        let g:Powerline_symbols = 'fancy'
    endif
"Plugin 'fholgado/minibufexpl.vim'
"map <Leader>b :MiniBufExplorer<cr>
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
Plugin 'kien/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 2
    if len(argv())==0 || argv()[0] == '.'
        " If I open a directory, assume I want to hard set a working path
        let g:ctrlp_working_path_mode = ''
    endif
Plugin 'majutsushi/tagbar'
" Extending tabar to support markdown (additionally to the ~/.ctags-file!)
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
        \ ]
    \ }
Plugin 'michalliu/jsoncodecs.vim'
Plugin 'michalliu/jsruntime.vim'
Plugin 'michalliu/sourcebeautify.vim'
Plugin 'mkitt/browser-refresh.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
    let g:syntastic_javascript_syntax_checker="gjslint"
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    " syntastic gutter
    augroup syn_gutter
        au BufWinEnter * sign define mysign
        au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    augroup END
" Plugin 'sjl/splice.vim'
Plugin 'sjl/vitality.vim'
Plugin 'suan/vim-instant-markdown'
" Plugin 'jdonaldson/molokai'
"     if g:fancy_term
"         let g:molokai_original = 1
"     endif
Plugin 'altercation/vim-colors-solarized'
    " solarized options
    " let g:solarized_termcolors = 16
    let g:solarized_termtrans = 1
    set background=dark
"    colorscheme solarized
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
    map <c-\> \\\
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tyru/open-browser.vim'
" Plugin 'Valloric/YouCompleteMe'
" let g:ycm_semantic_triggers =  {
"     \   'c' : ['->', '.'],
"     \   'objc' : ['->', '.'],
"     \   'cpp,objcpp' : ['->', '.', '::'],
"     \   'perl,php' : ['->'],
"     \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir' : ['.'],
"     \   'lua' : ['.', ':'],
"     \   'erlang' : [':'],
"     \}
Plugin 'Shougo/neocomplcache'
Plugin 'edsono/vim-matchit'


" vim-scripts repos
"Plugin 'localvimrc'
Plugin 'Gundo'
    map <Leader>z :GundoToggle<CR>
Plugin 'L9'
Plugin 'The-NERD-tree'
Plugin 'desert.vim'
Plugin 'closetag.vim'
"Plugin 'jdonaldson/vim-addon-local-vimrc'

filetype plugin indent on " required!

Plugin 'JQuery'

