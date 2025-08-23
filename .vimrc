if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" vim plug section 
" call plug#begin(stdpath('data') . '/plugged')
" " Core Stuff
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'RRethy/vim-illuminate'
"
" Plug 'nvim-tree/nvim-web-devicons'
" " Plug 'ryanoasis/vim-devicons'
"
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
"
" Plug 'nvim-lua/plenary.nvim'
" Plug 'antoinemadec/FixCursorHold.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
"
" Plug 'rcarriga/nvim-notify'
" """"""""""""""""""""""""""""""""""""""""
"
" " General
" Plug 'tpope/vim-surround'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'tomtom/tcomment_vim'
"
" " Mini,nvim
" Plug 'echasnovski/mini.indentscope'
"
" """"" File tree plugin
" Plug 'nvim-tree/nvim-tree.lua'
" " Plug 'scrooloose/nerdtree'
" " Plug 'Xuyuanp/nerdtree-git-plugin'
" """"""""""""""""""""""""""""""""""""""""
"
" " Colorschemes
" Plug 'navarasu/onedark.nvim'
" " Plug 'joshdick/onedark.vim'
" Plug 'briones-gabriel/darcula-solid.nvim'
" Plug 'rktjmp/lush.nvim'
"
" """" Language binding """"""""""""""""""
" " Plug 'sheerun/vim-polyglot'
" " Plug 'pangloss/vim-javascript'
" " Plug 'HerringtonDarkholme/yats.vim'
" " Plug 'maxmellon/vim-jsx-pretty'
" " Plug 'moll/vim-node'
" " Plug 'othree/html5.vim'
" " Plug 'hail2u/vim-css3-syntax'
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" " Plug 'm-demare/hlargs.nvim'
"
"
" Plug 'ziontee113/syntax-tree-surfer',
" " Coc
" " Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': ':CocUpdate'}
" """"""""""""""""""""""""""""""""""""""""
"
" " markdown
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
" " Plug 'MeanderingProgrammer/markdown.nvim'
" """"""""""""""""""""""""""""""""""""""""
"
" " Marks
" " Plug 'chentoast/marks.nvim'
" """"""""""""""""""""""""""""""""""""""""
"
" """"""""""""' Git
" " Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-fugitive'
" Plug 'sindrets/diffview.nvim'
" Plug 'lewis6991/gitsigns.nvim'
" """"""""""""""""""""""""""""""""""""""""
"
" " NPM
" Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
" """"""""""""""""""""""""""""""""""""""""
"
" " Regex
" Plug 'rclawlor/regex-railroad.nvim'
" """"""""""""""""""""""""""""""""""""""""
"
" """" Tests
" Plug 'nvim-neotest/neotest'
" Plug 'nvim-neotest/neotest-jest'
"
" Plug 'klen/nvim-test'
"
" Plug 'johmsalas/text-case.nvim'
"
" Plug 'otavioschwanck/arrow.nvim'
"
" " Plug 'MunifTanjim/nui.nvim'
" Plug 'm4xshen/hardtime.nvim'
"
" """"""""""""""""""""""""""""""""""""""""
"
" " native lsp stuff
" Plug 'nvimtools/none-ls.nvim'
" Plug 'nvimtools/none-ls-extras.nvim'
" Plug 'zeioth/none-ls-autoload.nvim'
"
" Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'}
" Plug 'williamboman/mason-lspconfig.nvim'
" Plug 'neovim/nvim-lspconfig'
"
"
" Plug 'davidmh/cspell.nvim'
"
" Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
"
"
" Plug 'yioneko/nvim-vtsls'
"
" " Completion
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
" Plug 'SergioRibera/cmp-dotenv'
" Plug 'hrsh7th/nvim-cmp'
"
" " Plug 'folke/neodev.nvim'
"
" " UI
" Plug 'gbrlsnchs/telescope-lsp-handlers.nvim'
"
" Plug 'MunifTanjim/nui.nvim'
"
" Plug 'stevearc/dressing.nvim'
" " Plug 'j-hui/fidget.nvim'
"
" " Plug 'ndonfris/fish-lsp', {'do' : 'yarn install'}
" Plug 'folke/noice.nvim'
"
" Plug 'folke/neoconf.nvim'
"
"
" Plug 'folke/lazydev.nvim'
" Plug 'Bilal2453/luvit-meta'
"
" call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:doge_mapping = '<leader>dd'
" set ; to : in normal mode
set foldenable
nnoremap ; :

set cursorline
set cursorlineopt=both

set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" Keep 1000 items in the history
set history=1000

" Auto reload when file changed from outside
set autoread
au FocusGained,BufEnter * checktime

" Enable filetype plugins
filetype on
filetype plugin on
filetype indent on


" autocmd TermLeave,TermClose * set number
" autocmd TermOpen * setlocal l:nonumber
autocmd TermOpen,BufEnter term://* startinsert
autocmd BufLeave * stopinsert

tnoremap <C-ESC> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" autocmd BufEnter *.test.* Neotest summary open
" autocmd BufHidden *.test.* Neotest summary close

" let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when changing
" from Markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

let g:mkdp_echo_preview_url = 1

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nnoremap <leader>w :w!<cr>

" Title enabled
set title

" Enable mouse
set mouse=a

" Regex memory limit
set mmp=100000

" Reload vimrc file
nnoremap <silent> <leader>` :so $MYVIMRC<cr>

" Lower update time
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set termguicolors
set spr

set rtp+=/usr/local/opt/fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Keep gutter line at all times
" set signcolumn=yes

""""""""""""""""""""""""""""""
" => Coc.nvim
""""""""""""""""""""""""""""""
" use <tab> to trigger completion and navigate to the next complete item

" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()
"
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
"
" " Highlight symbol under cursor on CursorHold
" "autocmd CursorHold * silent call CocActionAsync('highlight')
"
" " Remap for rename current word
" nnoremap <leader>rn <Plug>(coc-rename)
"
" " Applying codeAction to the selected region.
" " Example: `<leader>aap` for current paragraph
" xnoremap <leader>a  <Plug>(coc-codeaction-selected)
" nnoremap <leader>a  <Plug>(coc-codeaction-selected)
"
" " Remap keys for applying codeAction to the current buffer.
" nnoremap <leader>ac  <Plug>(coc-codeaction)
" " Apply AutoFix to problem on the current line.
" nnoremap <leader>qf  <Plug>(coc-fix-current)
"
" " GoTo code navigation.
" nnoremap <silent> gd <Plug>(coc-definition)
" nnoremap <silent> gy <Plug>(coc-type-definition)
" nnoremap <silent> gi <Plug>(coc-implementation)
" nnoremap <silent> gr <Plug>(coc-references)
"
" " Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>
"
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" nnoremap <leader>pr <Plug>(coc-format)

" xmap <leader>f  <Plug>(coc-format-selected)

" nnoremap ]d <Plug>(coc-diagnostic-next)
" nnoremap [d <Plug>(coc-diagnostic-prev)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <C-x> :NvimTreeFindFileToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fugitive Conflict Resolution
" nnoremap <leader>gd :Gvdiffsplit!<CR>
" nnoremap gdh :diffget //2<CR>
" nnoremap gdl :diffget //3<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 10 lines to the cursor - when moving vertically using j/k
set so=10

" Always show current position
set ruler

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=.git\*,.hg\*,.svn\*
else
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Height of the command bar
set cmdheight=1

" show incomplete commands
set showcmd

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" numbered lines
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set t_Co=256
set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set colorscheme
"colorscheme onedark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Clipboard
" set clipboard+=unnamedplus

" CTRL-A is Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
noremap j gj
noremap k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
noremap <C-space> ?

" Use movement in insert mode
inoremap <M-j> <Down>
inoremap <M-k> <Up>
inoremap <M-h> <Left>
inoremap <M-l> <Right>

" Disable highlight when <cr> is pressed
noremap <silent> <cr> :noh<cr>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Opens a new buffer with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>e :e <c-r>=expand("%:p:h")<cr>/

" Close the current buffer
noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>

" Map buffer switching
noremap <M-]> :bn<CR>
noremap <M-[> :bp<CR>
noremap <M-w> :bw<cr>
noremap <M-q> :%bd\|e#\|bd#<cr>


" Map dynamic buffer switching based on numbers
noremap <M--> :bf<CR>
noremap <M-1> :bf<CR>:bn1<CR>
noremap <M-2> :bf<CR>:bn2<CR>
noremap <M-3> :bf<CR>:bn3<CR>
noremap <M-4> :bf<CR>:bn4<CR>
noremap <M-5> :bf<CR>:bn5<CR>
noremap <M-6> :bf<CR>:bn6<CR>
noremap <M-7> :bf<CR>:bn7<CR>
noremap <M-=> :bl<CR>


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
 \   exe "normal! g`\"" |
 \ endif
" Remember info about open buffers on close
set viminfo^=%

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
noremap 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nnoremap <M-j> mz:m+<cr>`z
nnoremap <M-k> mz:m-2<cr>`z
vnoremap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

let g:tcomment_mapleader2 = '<leader>c'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Diffview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>df :DiffviewOpen<cr>
nnoremap <leader>h :DiffviewFileHistory %<cr>
nnoremap <leader>dq :DiffviewClose<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Silver searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

let g:ctrlp_open_func = { 'files': 'CustomOpenFunc' }
function! CustomOpenFunc(action, line)
  call call('ctrlp#acceptfile', [':t', a:line])
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" noremap <leader>ss :set spell!<cr>
"
" " Shortcuts using <leader>
" noremap <leader>sn ]s
" noremap <leader>sp [s
" noremap <leader>sa zg
" noremap <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
noremap <leader>q :e ~/buffer<cr>

" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>

let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Util commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <leader>fq :!sqlfluff format -d postgres -<CR>

" Faker update
let s:fakerUpdateCommands=[
      \ '%s/date.past(\(\d\+\))/date.past({years: \1})/g',
      \ '%s/date.future(\(\d\+\))/date.future({years: \1})/g',
      \ '%s/date.soon(\(\d\+\))/date.soon({days: \1})/g',
      \ '%s/date.recent(\(\d\+\))/date.recent({days: \1})/g',
      \ '%s/datatype.datetime/date.anytime/g',
      \ '%s/datatype.number(\({.*precision.*}\))/number.float(\1)/g',
      \ '%s/datatype.number/number.int/g',
      \ '%s/faker.random.numeric/faker.string.numeric/g',
      \ '%s/datatype.uuid/string.uuid/g',
      \ '%s/random.alphanumeric/string.alphanumeric/g',
      \ '%s/datatype.string/string.sample/g',
      \ '%s/random.word/lorem.word/g',
      \ '%s/random.words/lorem.words/g',
      \ '%s/faker.address/faker.location/g',
      \ '%s/faker.location.streetName/faker.location.street/g',
      \ '%s/faker.location.streetSuffix/faker.location.buildingNumber/g',
      \ '%s/location.stateAbbr()/location.state({abbreviated: true})/g',
      \ '%s/faker.name/faker.person/g',
      \ '%s/faker.finance.account(\(\d*\))/faker.finance.accountNumber(\1)/g',
      \ '%s/\(faker.finance.amount(\)\(\d\+\), undefined, \(\d\+\)/\1{min: \2, dec: \3}',
      \ '%s/\(faker.finance.amount(\)\(\d\+\), \(\d\+\)/\1{min: \2, max: \3}',
      \ '%s/datatype.float/number.float/g',
      \ '%s/faker.helpers.replaceSymbolWithNumber(\(.*\))/\1.replace(\/#+\/g, (m) => faker.string.numeric(m.length))',
      \ '%s/\(faker\.number\.float({\)\(.*\)precision: \(0\.1\)\(.*})\)/\1\2multipleOf: \3\4/g',
      \]

command! FakerUpdate call s:updateFaker()
function! s:updateFaker()
  for rep in s:fakerUpdateCommands
    :execute rep
  endfor
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("delete! ".l:currentBufNum)
    endif
endfunction


function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" autocmd BufReadPost quickfix setlocal nowrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lua stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('old-conf')
