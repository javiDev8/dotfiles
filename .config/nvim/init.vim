" BASIC SETUP --------------------------------------
set number
set relativenumber
set clipboard=unnamedplus
syntax on
set showcmd
set encoding=utf-8
set sw=4
setlocal indentkeys-=0
setlocal cinkeys-=0#
let b:did_indent = 1
set updatetime=100
let mapleader=" "
set smartindent

" HANDY KEYMAPS ---------------------------------------

" Go to normal mode easier
imap <C-Space> <Esc>

" black hole
nnoremap _ "_
vnoremap _ "_

" tab navigation
nnoremap <tab> :tabn<CR>
nnoremap <S-tab> :tabN<CR>

" easy save
nnoremap <leader>w :w<cr>
inoremap <C-w> <esc>:w<cr>

"faster movement
noremap <A-left> 10h
noremap <A-right> 10l
noremap <A-up> 5k
noremap <A-down> 5j

"resize vertical splits
nnoremap + :vertical resize +7<cr>
nnoremap - :vertical resize -7<cr>

" navegate between vertical splits
nnoremap <C-a> <C-w>h
nnoremap <C-d> <C-w>l

" inner word
onoremap w iw

" experimental remap for unconfortable keys 
noremap ´ (
onoremap i´ i(
onoremap a´ a(
inoremap ´ ()<left>
inoremap ¨ /
nnoremap ¨ /
noremap ; %
noremap <space>; $%

" Stop hold
nnoremap <C-h> :noh<cr>

nnoremap Z zz
nnoremap Y y$

noremap <leader>q :q<cr>
command WQ wq
command Q q

" PLUGINS ----------------------------------

call plug#begin('~/.vim/plugged')

" basics
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" colorscheme
Plug 'franbach/miramare'
Plug 'arcticicestudio/nord-vim'
Plug 'chriskempson/base16-vim'

"javascript & jsx
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" handy
" Plug 'vifm/vifm.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'terryma/vim-smooth-scroll'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" php
Plug '2072/PHP-Indenting-for-VIm'
Plug 'mattn/emmet-vim'

call plug#end()
let g:user_emmet_leader_key=','

nnoremap ttp :set ft=php<CR>
nnoremap tth :set ft=html<CR>


" CoC extensions
let g:coc_global_extensions = [ 'coc-tsserver' ]

"colorscheme
set termguicolors
colorscheme miramare
hi EndOfBuffer guibg=NONE
hi Normal guibg=NONE
hi TabLine guibg=NONE
hi TabLineFill guibg=NONE
hi Comment guifg=#99938d
hi LineNr guifg=#99938d
let miramare_enable_italic = 1

nmap <leader>f :RangerNewTab<CR>
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" Substitute
noremap <leader>s :%s///g<left><left><left>
noremap <leader>vs :s/\%V//g<left><left><left>

" STATUSLINE
set statusline=
set statusline +=%4*%<%f%*                          "file tail (name)
set statusline +=%2*%m\ %*                          "modified flag
set statusline +=%2*%{toupper(fugitive#head())}\ %* "git branch
set statusline +=%1*%=%5l%*                         "current line
set statusline +=%1*/%L\ %*                         "total lines
set statusline +=%1*%v\ %*                          "virtual column number

" hi User1 cterm=underline
hi User1 gui=underline
hi ModeMsg guifg=#e68183

" TabLine
hi TabLineFill ctermbg=none 
hi TabLineSel ctermfg=6 ctermbg=none 
hi TabLine ctermbg=none cterm=underline
hi CursorLineNr ctermbg=none ctermfg=15

hi LineNr ctermbg=none

noremap <silent> <c-w> :call smooth_scroll#up(15, 20, 2)<CR>
noremap <silent> <c-s> :call smooth_scroll#down(15, 20, 2)<CR>

" GIT -----------------------------------------------

" gitgutter
highlight SignColumn ctermbg=none ctermfg=none
highlight GitGutterAdd    ctermbg=none
highlight GitGutterChange ctermbg=none ctermfg=3
highlight GitGutterDelete ctermbg=none
highlight GitGutterChangeDelete ctermbg=none

let g:gitgutter_sign_added = '|'
let g:gitgutter_sign_modified = '|'
let g:gitgutter_sign_removed = '|'
let g:gitgutter_sign_modified_removed = '|'

command ClearCommitMessageFile call ClrCmtMsgF()
command Commit :Git commit -aeF .gitcmtmsg
command Stat :Git status

" clear commit message file
fun! ClrCmtMsgF() 
    let cmtmsgfilepath = projectroot#guess().'/.gitcmtmsg'
    exec ':te cat /dev/null > '.cmtmsgfilepath 
endfun

hi Normal guibg=NONE ctermbg=NONE

hi VertSplit ctermbg=none
nnoremap vf :TabVifm<cr>
:let g:vifm_replace_netrw=1

" ABBREVS & SNIPPETS -----------------------------------

" html 
" inoremap € <esc>bi<<esc>l"aywea></<esc>"apa><esc>T>i
" inoremap ¢ <esc>bi<<esc>ea/>

command! -nargs=0 Sw w !sudo tee % > /dev/null

" javascript
:iabbrev log console.log()<esc>T(i
