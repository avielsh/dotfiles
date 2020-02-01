" vim:fdm=marker

" Settings -------------------------------------------------------------

" Preamble {{{

" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
"colorscheme molotov
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
"set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
" set foldlevel=0 " Close all folds by default
" set foldmethod=syntax " Syntax are used to specify folds
set foldmethod=marker
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions=
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=10000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set lispwords+=defroutes " Compojure
set lispwords+=defpartial,defpage " Noir core
set lispwords+=defaction,deffilter,defview,defsection " Ciste core
set lispwords+=describe,it " Speclj TDD/BDD
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set nu " Enable line numbers
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
"set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undo
if !has('nvim')
  set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
" else
  " set shada=%,'9999,s512,n~/.vim/nviminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
endif
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
"set wildmode=list:longest " Complete only until point of ambiguity
set wildmode=longest:full
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}

" }}}


" Configuration -------------------------------------------------------------

" FastEscape {{{
" Speed up transition from modes
if  ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
   " au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" General {{{
augroup general_config
  autocmd!

  " Speed up viewport scrolling {{{
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  " }}}

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

      " Sudo write (,W) {{{
  noremap <leader>W :w !sudo tee %<CR>
  " }}}

  " Get output of shell commands {{{
  command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>
  " }}}

  " Remap :W to :w {{{
  command! W write
  " }}}

  " Better mark jumping (line + col) {{{
  nnoremap ' `
  " }}}

  " Hard to type things {{{
  "iabbrev >> →
  "iabbrev << ←
  iabbrev ^^ ↑
  iabbrev VV ↓
  iabbrev aa λ
  " }}}

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  nnoremap <silent> <leader>cl :set nolist!<CR>
  " }}}

  " Clear last search (,qs) {{{
  map <silent> <leader>qs <Esc>:noh<CR>
  " map <silent> <leader>qs <Esc>:let @/ = ""<CR>
  " }}}

  " Vim on the iPad {{{
  if &term == "xterm-ipad"
    nnoremap <Tab> <Esc>
    vnoremap <Tab> <Esc>gV
    onoremap <Tab> <Esc>
    inoremap <Tab> <Esc>`^
    inoremap <Leader><Tab> <Tab>
  endif
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  "cnoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  cnoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Paste toggle (,p) {{{
  set pastetoggle=<leader>p
  map <leader>p :set invpaste paste?<CR>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Insert newline {{{
  map <leader><Enter> o<ESC>
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Strip trailing whitespace (,ss) {{{
  function! StripWhitespace () " {{{
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
  endfunction " }}}
  noremap <leader>ss :call StripWhitespace ()<CR>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzO' : 'zc')<CR>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}

  " Relative numbers {{{
  "set relativenumber " Use relative line numbers. Current line is still in status bar.
"  au BufReadPost,BufNewFile * set relativenumber
  " }}}
augroup END
" }}}

" NERD Commenter {{{
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}

" Buffers {{{
augroup buffer_control
  autocmd!

  " Prompt for buffer to select (,bs) {{{
  nnoremap <leader>bs :CtrlPBuffer<CR>
  " }}}

  " Buffer navigation (,,) (gb) (gB) (,ls) {{{
  map <Leader>. <c-^>
  " map <Leader>ls :buffers<CR>
  map gb :bnext<CR>
  map gB :bprev<CR>
  " }}}

  " Jump to buffer number (<N>gb) {{{
  let c = 1
  while c <= 99
    execute "nnoremap " . c . "gb :" . c . "b\<CR>"
    let c += 1
  endwhile
  " }}}

  " Close Quickfix window (,qq) {{{
  map <leader>qq :cclose<CR>
  " }}}
augroup END
" }}}

" Jumping to tags {{{
augroup jump_to_tags
  autocmd!

  " Basically, <c-]> jumps to tags (like normal) and <c-\> opens the tag in a new
  " split instead.
  "
  " Both of them will align the destination line to the upper middle part of the
  " screen.  Both will pulse the cursor line so you can see where the hell you
  " are.  <c-\> will also fold everything in the buffer and then unfold just
  " enough for you to see the destination line.
  nnoremap <c-]> <c-]>mzzvzz15<c-e>`z:Pulse<cr>
  nnoremap <c-\> <c-w>v<c-]>mzzMzvzz15<c-e>`z:Pulse<cr>

  " Pulse Line (thanks Steve Losh)
  function! s:Pulse() " {{{
    redir => old_hi
    silent execute 'hi CursorLine'
    redir END
    let old_hi = split(old_hi, '\n')[0]
    let old_hi = substitute(old_hi, 'xxx', '', '')

    let steps = 8
    let width = 1
    let start = width
    let end = steps * width
    let color = 233

    for i in range(start, end, width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor
    for i in range(end, start, -1 * width)
      execute "hi CursorLine ctermbg=" . (color + i)
      redraw
      sleep 6m
    endfor

    execute 'hi ' . old_hi
  endfunction " }}}

  command! -nargs=0 Pulse call s:Pulse()
augroup END
" }}}

" Highlight Interesting Words {{{
augroup highlight_interesting_word
  autocmd!
  " This mini-plugin provides a few mappings for highlighting words temporarily.
  "
  " Sometimes you're looking at a hairy piece of code and would like a certain
  " word or two to stand out temporarily.  You can search for it, but that only
  " gives you one color of highlighting.  Now you can use <leader>N where N is
  " a number from 1-6 to highlight the current word in a specific color.
  function! HiInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    echo pat
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
  endfunction " }}}

  " Mappings {{{
  nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
  nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
  nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
  nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
  nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
  nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>
  " }}}

  " Default Highlights {{{
  hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
  hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
  hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
  hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
  hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
  hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
  " }}}
augroup END
" }}}

" Word Processor Mode {{{
augroup word_processor_mode
  autocmd!

  function! WordProcessorMode() " {{{
    setlocal formatoptions=t1
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_ca
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    Goyo 100
  endfunction " }}}
  com! WP call WordProcessorMode()
augroup END
" }}}

" Restore Cursor Position {{{
augroup restore_cursor
  autocmd!

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
augroup END
" }}}


" Filetypes -----{{{
" zsh {{{
augroup filetype_zsh
  autocmd!
  "if while for macros
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc set ft=zsh
  au BufNewFile,BufReadPost *.zsh,.zshrc imap <buffer> ,qi <c-o>mmif<cr>then<cr><cr>else<cr><cr>fi<esc>'m$a<space>
  au BufNewFile,BufReadPost *.zsh,.zshrc imap <buffer> ,qw <c-o>mmwhile read line<cr>do<cr>echo $line<cr>done < $line <cr><esc>'m$a<space>
  au BufNewFile,BufReadPost *.zsh,.zshrc imap <buffer> ,qf <c-o>mmfor i in $()<cr>do<cr>echo $i<cr>done <cr><esc>'m$i<space>
  " replace backticks with $()
  au BufNewFile,BufReadPost *.zsh,.zshrc imap <buffer> ,q` <c-o>:s/`\(.*\)`/$(\1)<cr>
  au BufWritePost,BufRead *.sh,*.zsh,.zshrc  silent execute "!ctags %"
augroup END
" }}}
" vim {{{
augroup filetype_vim
  autocmd!
  au BufNewFile,BufReadPost *.vim,.vimrc nmap <buffer> <F2> :help <c-r><c-w>
  au BufNewFile,BufReadPost *.vim,.vimrc nmap <F3> :so ~/.vimrc<cr>
  au BufNewFile,BufReadPost *.vim,.vimrc SyntasticToggleMode
  au BufWritePost .vimrc  source % | AirlineRefresh
augroup END
" }}}
" tmux {{{
augroup filetype_tmux
  autocmd!
  au BufWritePost .tmux.conf !tmux source %
augroup END
" }}}
" quickfix {{{
augroup MyQFCommand
au!
au FileType qf nnoremap <buffer> <CR> <CR><C-W>p
au FileType qf nnoremap <buffer> ,<CR>  <CR>:cclose<cr>
au Filetype qf nnoremap <buffer> <c-c> :q<cr>
au Filetype qf nnoremap <buffer> <down> <down><cr><c-w>p
au Filetype qf nnoremap <buffer> <up> <up><cr><c-w>p
augroup END
" }}}
" help {{{
augroup filetype_help
  autocmd!
  au Filetype help nnoremap <buffer> <c-c> :q<cr>
augroup END
" }}}
" C {{{
augroup filetype_c
  autocmd!

  " Highlight Custom C Types {{{
  autocmd BufRead,BufNewFile *.[ch] let fname = expand('<afile>:p:h') . '/types.vim'
  autocmd BufRead,BufNewFile *.[ch] if filereadable(fname)
  autocmd BufRead,BufNewFile *.[ch]   exe 'so ' . fname
  autocmd BufRead,BufNewFile *.[ch] endif
  " }}}
augroup END
" }}}
" Clojure {{{
augroup filetype_clojure
  autocmd!
  let g:vimclojure#ParenRainbow = 1 " Enable rainbow parens
  let g:vimclojure#DynamicHighlighting = 1 " Dynamic highlighting
  let g:vimclojure#FuzzyIndent = 1 " Names beginning in 'def' or 'with' to be indented as if they were included in the 'lispwords' option
augroup END
" }}}
" Coffee {{{
augroup filetype_coffee
  autocmd!
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup END
" }}}
" Fish {{{
augroup filetype_fish
  autocmd!
  au BufRead,BufNewFile *.fish set ft=fish
augroup END
" }}}
" Handlebars {{{
augroup filetype_hbs
  autocmd!
  au BufRead,BufNewFile *.hbs,*.handlebars,*.hbs.erb,*.handlebars.erb setl ft=mustache syntax=mustache
augroup END
" }}}
" Jade {{{
augroup filetype_jade
  autocmd!
  au BufRead,BufNewFile *.jade set ft=jade syntax=jade
augroup END
" }}}
" JavaScript {{{
augroup filetype_javascript
  autocmd!
  let g:javascript_conceal = 1
augroup END
" }}}
" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}
" Markdown {{{
augroup filetype_markdown
  autocmd!
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}
" Nu {{{
augroup filetype_nu
  autocmd!
  au BufNewFile,BufRead *.nu,*.nujson,Nukefile setf nu
augroup END
" }}}
" Ruby {{{
augroup filetype_ruby
  autocmd!

  au BufRead,BufNewFile Rakefile,Capfile,Gemfile,.autotest,.irbrc,*.treetop,*.tt set ft=ruby syntax=ruby

  " Ruby.vim {{{
  let ruby_operators = 1
  let ruby_space_errors = 1
  let ruby_fold = 1
  " }}}
augroup END
" }}}
" XML {{{
augroup filetype_xml
  autocmd!
  au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"
augroup END
" }}}
" }}}

" Plugin Configuration ---{{{

" TagBar {
augroup tagbar_config
  autocmd!
  nnoremap <silent> ,t :TagbarToggle<CR>
  let g:tagbar_left=1
  let g:tagbar_width = 25
  let g:tagbar_autoclose = 0
  let g:tagbar_autofocus = 1
  let g:tagbar_compact=0
augroup END
"}

" fzf {
augroup fzf_config
  autocmd!
  " This is the default extra key bindings
  let g:fzf_action = {
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }

  " An action can be a reference to a function that processes selected lines
  function! s:build_quickfix_list(lines)
    call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
    copen
    cc
  endfunction

  let g:fzf_action = {
        \ 'ctrl-q': function('s:build_quickfix_list'),
        \ 'ctrl-t': 'tab split',
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit' }

  " Default fzf layout
  " - down / up / left / right
  let g:fzf_layout = { 'down': '~40%' }

  " You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
  " let g:fzf_layout = { 'window': 'enew' }
  " let g:fzf_layout = { 'window': '-tabnew' }
  " let g:fzf_layout = { 'window': '10new' }

  " Customize fzf colors to match your color scheme
  " - fzf#wrap translates this to a set of `--color` options
  let g:fzf_colors =
        \ { 'fg':      ['fg', 'Normal'],
        \ 'bg':      ['bg', 'Normal'],
        \ 'hl':      ['fg', 'Comment'],
        \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
        \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
        \ 'hl+':     ['fg', 'Statement'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Ignore'],
        \ 'prompt':  ['fg', 'Conditional'],
        \ 'pointer': ['fg', 'Exception'],
        \ 'marker':  ['fg', 'Keyword'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment'] }

  " Enable per-command history
  " - History files will be stored in the specified directory
  " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
  "   'previous-history' instead of 'down' and 'up'.
  let g:fzf_history_dir = '~/.local/share/fzf-history'
augroup END
"}

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#tab_nr_type = 2 " tab number
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  " let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_close_button = 0 " remove 'X' at the end of the tabline
  let g:airline#extensions#tabline#tabs_label = ''       " can put text here like BUFFERS to denote buffers (I clear it so nothing is shown)
  let g:airline#extensions#tabline#buffers_label = ''    " can put text here like TABS to denote tabs (I clear it so nothing is shown)
  let g:airline#extensions#tabline#show_tab_count = 0    " dont show tab numbers on the right
  let g:airline#extensions#tabline#show_buffers = 0      " dont show buffers in the tabline
  let g:airline#extensions#tabline#tab_min_count = 1     " minimum of 2 tabs needed to display the tabline
  let g:airline#extensions#tabline#show_splits = 1       " disables the buffer name that displays on the right of the tabline
  let g:airline#extensions#tabline#show_tab_nr = 1       " disable tab numbers
  let g:airline#extensions#tabline#show_tab_type = 1     " disables the weird ornage arrow on the tabline
augroup END
" }}}

" titlecase.vim {{{
augroup titlecase_config
  autocmd!
  let g:titlecase_map_keys = 0
  nmap <leader>gt <Plug>Titlecase
  vmap <leader>gt <Plug>Titlecase
  nmap <leader>gT <Plug>TitlecaseLine
augroup END
" }}}

" CtrlP.vim {{{
augroup ctrlp_config
  autocmd!
  let g:ctrlp_clear_cache_on_exit = 0 " Do not clear filenames cache, to improve CtrlP startup
  let g:ctrlp_lazy_update = 350 " Set delay to prevent extra search
  " let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use python fuzzy matcher for better performance
  " let g:ctrlp_match_window = 'bottom' " Show at top of window
  let g:ctrlp_max_files = 150 " Set no file limit, we are building a big project
  let g:ctrlp_switch_buffer = 'Et' " Jump to tab AND buffer if already open
  let g:ctrlp_open_new_file = 't' " Open newly created files in the current window
  let g:ctrlp_open_multiple_files = 'ij' " Open multiple files in hidden buffers, and jump to the first one
  " Ctrl-b switch mode
  let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:25,results:55'
  let g:ctrlp_open_multiple_files = '10tj'
  let g:ctrlp_cmd                 = 'CtrlPMRUFiles'
  let g:ctrlp_tabpage_position    = 'al'
  let g:ctrlp_regexp = 0
augroup END
" }}}

" Silver Searcher {{{
augroup ag_config
  autocmd!

  if executable("ag")
    " Note we extract the column as well as the file and line number
    " set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ --column
    " set grepformat=%f:%l:%c%m

    " Have the silver searcher ignore all the same things as wilgignore
    let b:ag_command = 'ag %s -i --nocolor --nogroup'

    for i in split(&wildignore, ",")
      let i = substitute(i, '\*/\(.*\)/\*', '\1', 'g')
      let b:ag_command = b:ag_command . ' --ignore "' . substitute(i, '\*/\(.*\)/\*', '\1', 'g') . '"'
    endfor

    let b:ag_command = b:ag_command . ' --hidden -g ""'
    let g:ctrlp_user_command = b:ag_command
  endif
augroup END
" }}}

" EasyAlign.vim {{{
augroup easy_align_config
  autocmd!
  vmap <Enter> <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  "  nmap <Leader>a <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
augroup END
" }}}

" Notes.vim {{{
augroup notes_config
  autocmd!
  let g:notes_directories = ['~/Notes']
augroup END
" }}}

" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
  autocmd!
  nnoremap <leader>rp :RainbowParenthesesToggle<CR>
augroup END
" }}}

" Syntastic.vim {{{
augroup syntastic_config
  autocmd!
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_ruby_checkers = ['mri', 'rubocop']
augroup END
" }}}
" Plugin Configuration ---}}}

" Plugins -------------------------------------------------------------
" Load plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'kien/rainbow_parentheses.vim'
"Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasr/molokai'
Plug 'fmoralesc/molokayo'

Plug 'kchmck/vim-coffee-script'
Plug 'ynkdir/vim-vimlparser'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown',     { 'for': 'markdown' }
Plug 'tpope/vim-rails'
Plug 'joker1007/vim-ruby-heredoc-syntax'
Plug 'vim-scripts/jade.vim',   { 'for': 'jade' }
Plug 'wavded/vim-stylus',      { 'for': 'stylus' }
"Powershell
Plug 'PProvost/vim-ps1'
"Airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
" Plug 'ycm-core/YouCompleteMe'
Plug 'ap/vim-css-color'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'syngan/vim-vimlint'
Plug 'guns/vim-clojure-static'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-emoji'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'
"gt motion
Plug 'christoomey/vim-titlecase'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'ctrlpvim/ctrlp.vim'
"Fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
"Plug 'luochen1990/rainbow'
"
"Plug 'LucHermitte/lh-vim-lib'
"Plug 'LucHermitte/lh-brackets'
Plug 'msanders/snipmate.vim'
Plug 'majutsushi/tagbar'

"Plug 'ronakg/quickr-preview.vim'
Plug 'mileszs/ack.vim'
Plug 'Raimondi/delimitMate'
"handlebars template {{NAME}}
Plug 'mustache/vim-mustache-handlebars'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'oplatek/Conque-Shell'
" Plug 'rking/ag.vim'
"Replace with register gr motion
Plug 'vim-scripts/ReplaceWithRegister'
" indent motion ai , ii motion
Plug 'michaeljsmith/vim-indent-object'
" line object al,il
Plug 'kana/vim-textobj-line'
" match it text object , am,im
Plug 'kana/vim-textobj-user'
Plug 'adriaanzon/vim-textobj-matchit'
" Match a brace {[( aj,ij
Plug 'Julian/vim-textobj-brace'
"File path text object ap ip
" Plug 'paulhybryant/vim-textobj-path'
Plug 'scrooloose/nerdcommenter'
"Syntax checking
Plug 'vim-syntastic/syntastic'
Plug 'thoughtbot/vim-rspec'

Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
" Plug 'vim-scripts/fish.vim',   { 'for': 'fish' }
Plug 'wlangstroth/vim-racket'
Plug 'xolox/vim-misc'
"Vim tab completion
Plug  'ajh17/VimCompletesMe'
" Plug 'xolox/vim-notes'
" Auto ctags
Plug 'soramugi/auto-ctags.vim'
call plug#end()
" }}}

" Settings override
colorscheme molokayo

"AirlineTheme solarized
" let g:airline_theme='solarized'
" let g:airline_theme='dracula'

syntax on
packadd! matchit
runtime macros/matchit.vim

filetype plugin on
filetype indent on

"Highlights {{{
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermfg=242 ctermbg=0 guifg=grey15 guibg=grey30
hi IndentGuidesEven ctermfg=0 ctermbg=242 guifg=grey30 guibg=grey15
hi CursorLine   cterm=NONE ctermbg=232
hi Visual ctermbg=236
augroup CursorLineNrColorSwap
  autocmd InsertEnter * highlight CursorLineNr term=bold ctermbg=3 ctermfg=8 gui=bold guifg=Black guibg=Yellow
  autocmd InsertLeave * highlight CursorLineNr term=bold ctermfg=11 ctermbg=8 gui=bold guifg=Yellow guibg=Black
augroup END
"Highlights }}}

" Sets {{{
set wildignorecase
set ic
set hls
set is
set clipboard=unnamed,unnamedplus
set tabpagemax=100
" set nofoldenable
set relativenumber
set shortmess=a
set cmdheight=2
set noswapfile
set wrap
set autochdir
set bri
set isfname-==
set iskeyword-==
set guicursor=
set whichwrap+=<,>,[,]
set shell=/bin/bash
" Sets }}}


let delimitMate_expand_cr=1
let &t_SI = "\e[2 q"
let &t_EI = "\e[2 q"
"Autocmds
command! -nargs=+ Gg execute 'silent grep <args> %' | copen
cnoreabbrev gg BLines

"Maps {{{
"Vmaps {{{
vmap <Enter> <Plug>(EasyAlign)
"dont mark EOL
vnoremap $ $h
"paste 2nd register
vmap <leader>[ c<c-r>1
vnoremap y y']
" vnoremap c "ac
" move to the last character of yank
" vmap y y']
" }}}

"imaps {{{
"map control space to autocomplete
imap <NUL> <c-x><c-p>
imap <c-space> <c-x><c-p>
inoremap <c-c> <esc>''
"}}}

"move line
nmap ,c "_c
nmap ,cW "_ciW<c-r>"
nmap ,cw "_ciw<c-r>"
map <s-Up>   mz:m-2<cr>`z
nmap <s-Down> mz:m+<cr>`z
"Ctrl shift movement
nmap <c-s-right> <c-j>
nmap <c-s-left> <c-j>
"toggle windows
nnoremap <c-j> <c-w><c-w>
"zsh macros
"change selection with $variable
nmap ,fq :s/""/"<cr>:s/''/'<cr>
vmap ,qv c$VVVOVVV="0vjj:s/VVV/
nmap ,qv c$$VVVOVVV="0vjj:s/VVV/
"quote to end , try to use surround
nmap ,$" m'v$S"''
nmap ,$' m'v$S'''
"quote from = to end with "
nmap ,q" m':s/=\(.*\)/="\1"<cr>:nohl<cr>''
"Surround a ...
nmap s ysi
"quote with " to end
nmap ,qa mmi"<esc>$a"<esc>:s/""/"/e<cr>'m
"replace content with 1st register
nmap ,qp mmc$0<esc>'m
"search for line beggining with word under cursor
nmap ,,* /^\s\+<c-r><c-a><cr>
" nnoremap ct "oct
" nnoremap c2w c2iw
" nnoremap cw ciw
" nnoremap cw ciw
" nnoremap caw "ocaw
" nnoremap cW "ocW
" nnoremap c2W c2iW
" nnoremap cW ciW
" nnoremap C "oC
nnoremap ,a <c-a>
nnoremap ,x <c-a>
nnoremap ,d "_d
nmap <c-n> :new<cr>
" nmap ,src :so ~/.vimrc<cr>
nmap ,rc :silent! tablast<cr>:tabed ~/.vimrc<cr>
" nmap ,ss :w<cr>
nmap <Leader>qm :MatchBraces<cr>:echo "MatchBrace:" . g:MatchBraces<cr>
nmap <Leader>i :ToggleIndent<cr>
"move to next errors
nmap <silent> <Leader><RIGHT> :cnext<CR>
nmap <silent> <Leader><LEFT> :cprev<CR>
"toggle number
nmap <Leader>n :set number! relativenumber!<cr>
"next tab
nmap <leader><space> :tabnext<cr>
"indent inner {
nnoremap <leader>= =i{
"???
nnoremap ,/ /^\s\+\S\{1,2\}\s
"fzf word under cursor
map <F4> :execute "BLines " . expand("<cWORD>") <cr>
"delete whole file and start insert
map ,df gg"_dGp
" nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
nmap Q :wqa<cr>
nmap Z :bdel!<cr>
"move between tabs
nmap <S-left> gT
nmap <S-right> gt
"paste current :cmd
nmap ,: O<c-r>:<esc>
"prevent x to change the unnamed buffer
nmap <Del> "_x
nnoremap x "_x
"keep jump list on j k movment, also move to wrapped lines
nnoremap <expr> k (v:count > 1 ? "m'" . v:count : '') . 'gk'
nnoremap <expr> j (v:count > 1 ? "m'" . v:count : '') . 'gj'
"Meta Maps
map <M-k> :bp<cr>
map k :bp<cr>
map <M-l> :bn<cr>
map l :bn<cr>
map <c-s> :w<cr>
" vmap <leader><Enter> <Plug>(LiveEasyAlign)
"Maps }}}

au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces

if !exists('g:lasttab')
  let g:lasttab = 1
endif
au TabLeave * let g:lasttab = tabpagenr()"
nmap ,m :exe "tabn ".g:lasttab<CR>

" Remember folds {{{
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END
" Remember folds }}}

"Diff with unsaved version {{{
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
"Diff with unsaved version }}}

"functions{{{
let g:MatchBraces = 0
function! MatchBraces()
  if (g:MatchBraces == 0)
    inoremap <expr> { RetBrace("{","}")
    inoremap <expr> ( RetBrace("(",")")
    inoremap <expr> ' RetBrace("'","'")
    inoremap <expr> " RetBrace("\"","\"")
    inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
    inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"
    let g:MatchBraces=1
    DelimitMateOff
  else
    iunmap {
    iunmap (
    iunmap '
    iunmap "
    let g:MatchBraces=0
    DelimitMateOn
  endif
endfunction

let g:toggleIndent=0
function! ToggleIndent()
  if (g:toggleIndent == 0)
    set ai si
    let g:indentexpr = &indentexpr
    set indentexpr=
    let g:toggleIndent = 1
  else
    set ai! si!
    let &indentexpr= g:indentexpr
    let g:toggleIndent = 0
  endif
  echo "ToggleIndent:" . g:toggleIndent
  ".  g:indentexpr: . g:indentexpr
endfunction
command! ToggleIndent call ToggleIndent()

function! RetBrace(open,close)
  let l:curChar = strpart(getline('.'), col('.')-1, 1)
  "echo "a:".l:cur Char
  if (match(l:curChar,"[$a-zA-Z" . a:open . a:close . "]") == -1 || l:curChar == "")
    return a:open . a:close . "\<Left>"
  else
    return a:open
  endif
endfunction

command! MatchBraces call MatchBraces()
" MatchBraces
" Colorize line numbers in insert and visual modes
" ------------------------------------------------

function! SetCursorLineNrColorVisual()
  set updatetime=0
  " Visual mode: orange
  highlight CursorLineNr cterm=none ctermfg=9 guifg=#cb4b16
endfunction
"Not working ? TODO
vnoremap <silent> <expr> <SID>SetCursorLineNrColorVisual SetCursorLineNrColorVisual()
" nnoremap <silent> <script> v v<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> V V<SID>SetCursorLineNrColorVisual
nnoremap <silent> <script> <C-v> <C-v><SID>SetCursorLineNrColorVisual
"functions}}}
"
"Highlight def - need to put on end  {{{
" somthing overides this - TODO
hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195
"Highlight def - need to put on end  }}}

"Special cygwin config {{{}}
if has("win32unix")
  cmap <c-e> <c-v>
  imap <c-e> <c-v>
  nmap <c-e> <c-v>
  nmap [1;2C gt
  nmap [1;2D gT
endif
"Special cygwin config }}}

"Read local config {{{}}
let localrc=expand("%:h"). "/.vimrc.local"
if filereadable(localrc)
  exec "so " . localrc
endif
"Read local config }}}

