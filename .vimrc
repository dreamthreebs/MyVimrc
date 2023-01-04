""vundle setup
"set nocompatible              " be iMproved, required
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'easymotion/vim-easymotion'
"call vundle#end()  
"filetype plugin indent on

"go back to edit place at last time
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"keybingdings
"leader key
let mapleader=","
noremap <leader>c :set nonu<CR>:set mouse=r<CR>
noremap <leader>cc :set nu<CR>:set mouse=a<CR>
noremap <leader>t :Tags<CR>
noremap <leader>r :Rg<CR>
noremap <leader>ct :!ctags %<CR>
nnoremap <leader>b :Buffers <CR>
noremap <leader>h :bp <CR>
noremap <leader>l :bn <CR>
noremap <leader>s :Lines <CR>
noremap <leader>wq :wq <CR>
noremap <leader>wr :w <CR>
noremap <leader>q :q <CR>

"ctrl key
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-k> <C-w>w
noremap <C-j> <C-w>j
nnoremap <C-n> :NERDTreeToggle<CR>

nnoremap sd $
nnoremap sa 0
nnoremap sw gM

set statusline=%F%m%r%h%w\----[POS=%l,%v]----[%p%%]\----%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=1

set noerrorbells

inoremap jk <ESC>
"cocnvim setup
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
syntax on
set wildmenu 
set confirm 
set clipboard+=unnamed 
filetype on 
set pythondll=/afs/ihep.ac.cn/users/w/wangyiming25/intel/oneapi/intelpython/latest/envs/norm/lib/libpython3.9.so

" paste from system clipboard, align indentation with surroundings
 " noremap <Leader>p "*]p:set nopaste<CR>
" copy a sentence into system clipboard
 " noremap <Leader>y "+y)

highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue


"could change the cursor in fzf
set guicursor=i:block-iCursor-blinkon0,v:block-vCursor
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white 

" highlight last inserted text
nnoremap gV `[v`]
set shiftwidth=4
set showcmd
"set showmode
set scrolloff=5
set foldenable
set tabstop=2
set expandtab
set softtabstop=2
set autochdir
set listchars=tab:»■,trail:■
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
set backspace=2
set nu
set mouse=a
set incsearch       
set showmatch       
set matchtime=2    

set list
set lcs=tab:\|\ ,nbsp:%,trail:·
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/

"rainbow setup
let g:rainbow_active = 1
let g:apc_enable_ft = {'*':1}

"skywind setup
"set completeopt=menu,menuone,noselect
"set cpt=.,k,w,b
"set shortmess+=c

"easymotion setup
nmap ss <Plug>(easymotion-s2)
nmap <Leader>f <Plug>(easymotion-overwin-f)

"fzf setup
nnoremap <silent> <c-p> :Files <CR>
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

"markdown setup
"let g:mkdp_brower = 'chromium'
"autocmd Filetype markdown noremap ,m :MarkdownPreview<CR>
"autocmd Filetype markdown noremap ,ms :MarkdownPreviewStop<CR>

"gruvbox setup
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark

call plug#begin('~/.vim/plugged')
"Plug 'https://gitee.com/mirrors/vimtex.git', {'for': ['tex']}
"Plug 'skywind3000/vim-auto-popmenu'
Plug 'luochen1990/rainbow'
"Plug 'skywind3000/vim-dict'
Plug 'https://gitee.com/ProVim/vim-easymotion'
"Plug 'https://gitee.com/archongum/nerdtree'
"Plug 'https://gitee.com/zgpio/LeaderF'
"Plug 'ghifarit53/tokyonight-vim'
"Plug 'morhetz/gruvbox'
Plug 'https://gitee.com/linuor/gruvbox'
Plug 'https://gitee.com/zgpio/coc.nvim',{'branch': 'release'}
"CocInstall cocjedi
Plug 'https://gitee.com/dazhixia/fzf',{ 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://gitee.com/dazhixia/fzf.vim'
Plug 'https://gitee.com/paulzhang5511/vim-commentary'
"Plug 'https://gitee.com/irontec/markdown-preview',{ 'do': 'cd app && yarn install' }
"Plug 'https://gitee.com/bon-ami/lightline'
"Plug 'https://gitee.com/mirrors_HansPinckaers/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build' }
"Plug 'davidhalter/jedi-vim'
"Plug 'W0rp/ale'
call plug#end()


