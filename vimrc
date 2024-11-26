"colorscheme
colorscheme desert

"auto syntax
syntax on

"language
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set textwidth=0
set modifiable

"confirm for the readonly/unsaved files when exit
set confirm

"TAB key option
set smarttab
set tabstop=2
set softtabstop=2 "available for backspace
set shiftwidth=2 
set expandtab "to expand all TABs as SPACEs

"syntax match
set showmatch
set matchtime=2

" set mapleader
let mapleader = ","

"filetype, 'indent on' is necessary for smartindent
filetype on
filetype plugin on
filetype indent on

"indent
"set smartindent
set autoindent

"command
set cmdheight=2
set laststatus=2
set showcmd

"search option
set hlsearch
set incsearch 
set ignorecase

"line number
set number 

"compatible
set nocompatible

"cursor state
set ruler
set cursorline 

"enable the backspace deletion space up to 2 lines
set backspace=2

"No automatic backup files
set nobackup

"Fold method
"set foldmethod=marker " for SV
set foldmethod=syntax " for C/C++

"Find a selected string area similar with searching word
vnoremap  *  y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vnoremap  #  y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>


"Font type and size
set guifont=monospace\ 15.5
"set guifont=courier\ 15\ pitch\ 18

"Windows control
nmap wn <C-w>n
nmap wv <C-w>v
nmap wc <C-w>c 
nmap ws <C-w>s

"tag view control
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>

"ignore the full path of tags
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}

"Grep hot key
"need install grep.vim
nnoremap <silent><F3> :Grep<CR>

" this abbreviation %% expands to the full path of the directory that contains
" the current file. For example, while editing file /some/path/myfile.txt,
" typing: e %%/ on the command line will expand to :e /some/path/.
cabbr <expr> %% expand('%:p:h') 

"Create brackets
inoremap ( () <ESC> i
inoremap [ [] <ESC> i
inoremap { {} <ESC> i

"Hot key for comments
ab ccc   //-----------------------------------------------------------------------------------
ab ccl*  *************************************************************************************
ab ccl=  =====================================================================================
ab ccl#  #------------------------------------------------------------------------------------
ab ccl+  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ab ccl-  -------------------------------------------------------------------------------------
ab ccs   //-------------------------------------
ab cc+   +++++++++++++++++++++++++++++++++++++++
ab cc=   =======================================
ab cc*   ***************************************
ab cc-   ---------------------------------------
ab cc#   #--------------------------------------
ab cc"   "----------------------------------------------------------------------------

" Plugins will be downloaded under the specified directory.
call plug#begin()

" Declare the list of plugins.
" 1.nerdtree
  Plug 'preservim/nerdtree'
" 2.airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
" 3.verilog_systemverilog
  Plug 'vhda/verilog_systemverilog.vim'
" 4.NERD Commenter
  Plug 'preservim/nerdcommenter'
" 5.hl_matchit 
  Plug 'vimtaku/hl_matchit.vim'
" 6.supertab
  Plug 'ervandew/supertab'
" 7.easymotion
  Plug 'easymotion/vim-easymotion'
" 9. fugitive
  Plug 'tpope/vim-fugitive'
" 10. auto-pairs
  Plug 'jiangmiao/auto-pairs'
" 11. rainbow 
  Plug 'luochen1990/rainbow'
" 12. gitgutter 
  Plug 'airblade/vim-gitgutter'
" 13.tagbar
  Plug 'preservim/tagbar'
" 14. gutentags 
  Plug 'ludovicchabant/vim-gutentags'
call plug#end()


"---------------------------------------------------------------------------- 
"   1.NERDtree plugin : display current path file tree.
"---------------------------------------------------------------------------- 
"   h j k l move cursor
"   ctrl+w+w switch cursor between left and right windows
"   ctrl+w+r switch current window layout to left and right
"   ctrl+p fuzzy search files
"   gT switch to previous tab
"   g t switch to next tab
"   o open/close file or directory, cursor appears in opened file
"   O open all directories under node
"   X collapse all directories under current node
"   x collapse parent directory of current node
"   i and s split window horizontally or vertically and open file
"   u open parent directory
"   t open in tab
"   T open in background tab
"   p go to parent directory
"   P go to root directory
"   K go to first node in same directory

" List ends here. Plugins become visible to Vim after this call.
"   J go to last node in same directory
"   m display file system menu (add, delete, move operations)
"   ? help
"   :q close

nmap nt :NERDTree<cr>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeHidden=0

"---------------------------------------------------------------------------- 
"   2.Airline : Status bar plugin
"---------------------------------------------------------------------------- 
"let g:airline_theme='wombat'
"let g:airline_powerline_fonts = 1 

"---------------------------------------------------------------------------- 
"   3.verilog_system.vim : verilog/systemverilog syntax highlighting
"---------------------------------------------------------------------------- 
runtime macros/matchit.vim

"---------------------------------------------------------------------------- 
"   4.nerdcommenter : Convenient annotation for large sections of code.
"---------------------------------------------------------------------------- 
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

"---------------------------------------------------------------------------- 
"   5.hl_matchit : use % to jump the match word 
"---------------------------------------------------------------------------- 
let b:match_words = '\<if\>:\<endif\>:\<else\>,'
\ . '\<while\>:\<continue\>,'
\ . '\<begin\>:\<end\>,'
\ . '\<module\>:\<endmodule\>,'
\ . '\<class\>:\<endclass\>,'
\ . '\<program\>:\<endprogram\>,'
\ . '\<clocking\>:\<endclocking\>,'
\ . '\<property\>:\<endproperty\>,'
\ . '\<sequence\>:\<endsequence\>,'
\ . '\<package\>:\<endpackage\>,'
\ . '\<covergroup\>:\<endgroup\>,'
\ . '\<primitive\>:\<endprimitive\>,'
\ . '\<specify\>:\<endspecify\>,'
\ . '\<generate\>:\<endgenerate\>,'
\ . '\<interface\>:\<endinterface\>,'
\ . '\<function\>:\<endfunction\>,'
\ . '\<task\>:\<endtask\>,'
\ . '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,'
\ . '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,'
\ . '`ifdef\>:`else\>:`endif\>,'
\ . '\<generate\>:\<endgenerate\>'

"---------------------------------------------------------------------------- 
"   6.supertab : Use tab for autocomplete
"----------------------------------------------------------------------------
" choose the most appropriate type of completion to use depending on the current context.
let g:SuperTabDefaultCompletionType = 'context'

"---------------------------------------------------------------------------- 
"   7.easymotion : Moving the cursor to a specific location conveniently.
"----------------------------------------------------------------------------

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap <Leader>s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


"---------------------------------------------------------------------------- 
"   9.fugitive : premier Vim plugin for Git.
"----------------------------------------------------------------------------
" https://martinlwx.github.io/zh-cn/my-workflow-of-using-vim-fugitive-in-neovim/
" how to use fugitive in your work flow 

"---------------------------------------------------------------------------- 
"   10. auto-pairs : Automatically insert paired parentheses 
"----------------------------------------------------------------------------
"Fly Mode will always force closed-pair jumping instead of inserting. only for ")", "}", "]"
"let g:AutoPairsFlyMode = 0
"let g:AutoPairsShortcutBackInsert = '<M-b>'

"---------------------------------------------------------------------------- 
"   11. rainbow : Make matching parentheses have the same color.
"----------------------------------------------------------------------------
let g:rainbow_active = 1

"---------------------------------------------------------------------------- 
"   12. gitgutter : shows a git diff in the sign column 
"----------------------------------------------------------------------------
"let g:gitgutter_max_signs = 500  " default value (Vim < 8.1.0614, Neovim < 0.4.0)
"let g:gitgutter_max_signs = -1   " default value (otherwise)

"---------------------------------------------------------------------------- 
"   13.tagbar : provides an easy way to browse the tags of the current file and get an overview of its structure
"----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_systemverilog= {
    \ 'ctagstype' : 'systemverilog',
    \ 'kinds'     : [
        \'c:classes',
        \'t:tasks',
        \'f:functions',
        \'m:modules',
        \'i:interfaces',
        \'v:variables',
        \'d:defines',
        \'e:typedefs',
        \'a:parameters'
  \]
\}

" add these conetent to ~/.ctags
"--langdef=systemverilog
"--langmap=systemverilog:.v.vg.sv.svh.tv.vinc.f
"--regex-systemverilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\bclass\b\s*(\b\w+\b)/\3/c,class/
"--regex-systemverilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\btask\b\s*(\b(static|automatic)\b)?\s*(\w+::)?\s*(\b\w+\b)/\6/t,task/
"--regex-systemverilog=/^\s*(\b(static|local|virtual|protected)\b)*\s*\bfunction\b\s*(\b(\w+)\b)?\s*(\w+::)?\s*(\b\w+\b)/\6/f,function/
"--regex-systemverilog=/^\s*\bmodule\b\s*(\b\w+\b)/\1/m,module/
"--regex-systemverilog=/^\s*\bprogram\b\s*(\b\w+\b)/\1/p,program/
"--regex-systemverilog=/^\s*\binterface\b\s*(\b\w+\b)/\1/i,interface/
"--regex-systemverilog=/^\s*\btypedef\b\s+.*\s+(\b\w+\b)\s*;/\1/e,typedef/
"--regex-systemverilog=/^\s*define\b\s*(\w+)/\1/d,define/ --regex-systemverilog=/}\s*(\b\w+\b)\s*;/\1/e,typedef/
"--regex-systemverilog=/^\s*(\b(static|local|private|rand)\b)*\s*(\b(shortint|int|longint)\b)\s*(\bunsigned\b)?(\s*\[.+\])*\s*(\b\w+\b)/\7/v,variable/
"--regex-systemverilog=/^\s*(\b(static|local|private|rand)\b)*\s*(\b(byte|bit|logic|reg|integer|time)\b)(\s*\[.+\])*\s*(\b\w+\b)/\6/v,variable/
"--regex-systemverilog=/^\s*(\b(static|local|private)\b)*\s*(\b(real|shortreal|chandle|string|event)\b)(\s*\[.+\])*\s*(\b\w+\b)/\6/v,variable/
"--regex-systemverilog=/(\b(input|output|inout)\b)\s*(\[.+\])*\s*(\b(wire|reg|logic)\b)\s*(\[.+\])*\s*(#(\(.+\)|\S+)\))?\s*(\b\w+\b)/\9/v,variable/
"--regex-systemverilog=/(\b(parameter|localparam)\b).+(\b\w+\b)\s*=/\3/a,parameter/
"--systemverilog-kinds=+ctfmpied

"---------------------------------------------------------------------------- 
"   14.gutentags : autogen ctag head file
"----------------------------------------------------------------------------
" gutentags stop to search the index "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
 
" autogen file name "
let g:gutentags_ctags_tagfile = '.tags'
 
" store tags file in ~/.cache/tags "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" if not exists  ~/.cache/tags, touch the folder "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
 
" configure ctags parameter "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

