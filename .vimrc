set shell=/bin/bash

" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

"support mouse.
set mouse=a
"colorscheme desert
"colorscheme delek
colorscheme slate
syntax on


" fix mac vim delete error, so as set backspace=indent,eol,start
set backspace=2

set fileencodings=utf-8,ucs-bom,shift-jis,latin1,big5,gb18030,gbk,gb2312,cp936
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set guifont=Courier\ New\:h12
set guifontwide=NSimsun\:h12


"设置vundle
set nocompatible              " be iMproved
filetype off                  " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/DrawIt'
Plugin 'derekwyatt/vim-protodef'
Plugin 'gcmt/wildfire.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1

Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1   
let g:miniBufExplMapWindowNavArrows = 1   
let g:miniBufExplMapCTabSwitchBufs = 1   
let g:miniBufExplMapCTabSwitchWindows = 1
let g:miniBufExplModSelTarget = 1  
let g:miniBufExplMoreThanOne=1
let g:miniBufExplUseSingleClick = 1
let g:bufExplorerMaxHeight=30

" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
map <F9> :MBEbp<CR>
map <F10> :MBEbn<CR>
map <Leader>bn :MBEbn<cr>
map <Leader>bp :MBEbp<cr>
map <Leader>bd :MBEbd<cr>  
map <Leader>bb :b#<cr>

Plugin 'majutsushi/tagbar'

Bundle 'Valloric/YouCompleteMe'
" 自动补全配置
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>" "回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme 默认tab s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1 " 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR> "force recomile with syntastic
"nnoremap <leader>lo :lopen<CR> "open locationlist
"nnoremap <leader>lc :lclose<CR> "close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

Bundle 'taglist.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1 "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28 "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1 "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1 "在右侧窗口中显示taglist窗口
let Tlist_Use_Left_Window =1 "在左侧窗口中显示taglist窗口
let Tlist_Use_SingleClick = 1
let Tlist_Show_One_File = 1

" Taglist plugin mapping
noremap <silent> <Leader>t :Tlist<CR>
set updatetime=100

Bundle 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
noremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>y :NERDTreeFind<cr>
"let NERDTreeIgnore=['\.pyc', '~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.class']
let NERDTreeWinPos='right'
let NERDTreeWinSize=30
let g:Srcexpl_winHeight = 8
" // Set 100 ms for refreshing the Source Explorer 
let g:SrcExpl_refreshTime = 100
let NERDTreeAutoCenter=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=3
let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeMouseMode = 3


" // Set "Enter" key to jump into the exact definition context 
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context 
let g:SrcExpl_gobackKey = "<SPACE>"

Bundle 'jistr/vim-nerdtred-tabs'



" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
"Bundle 'Lokaltog/vim-powerline'
set laststatus=2

Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
"Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'

Bundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \  }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
Bundle 'tacahiroy/ctrlp-funky'
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"vundle设置完毕

filetype plugin indent on
syntax on

set tags=tags;/  "搜索上一级建立的tag


"not working.
nmap <C-H> <C-W>h "control+h进入左边的窗口
nmap <C-J> <C-W>j  "control+j进入下边的窗口
nmap <C-K> <C-W>k "control+k进入上边的窗口
nmap <C-L> <C-W>l  "control+l进入右边的窗口


execute pathogen#infect()
syntax on
filetype plugin indent on


set nocompatible " 关闭 vi 兼容模式

syntax on " 自动语法高亮

"colorscheme code school" 设定配色方案

set number " 显示行号

set cursorline " 突出显示当前行

set ruler " 打开状态栏标尺

set shiftwidth=4" 设定 << 和 >> 命令移动时的宽度为 4

set softtabstop=4" 使得按退格键时可以一次删掉 4 个空格

set tabstop=4 " 设定 tab 长度为 4

set nobackup " 覆盖文件时不备份

"set autochdir " 自动切换当前目录为当前文件所在的目录

"filetypeplugin indenton " 开启插件

set backupcopy=yes " 设置备份时的行为为覆盖

set ignorecase smartcase " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感

set nowrapscan " 禁止在搜索到文件两端时重新搜索

set incsearch " 输入搜索内容时就显示搜索结果

set hlsearch " 搜索时高亮显示被找到的文本

set noerrorbells " 关闭错误信息响铃

set novisualbell " 关闭使用可视响铃代替呼叫

set t_vb= " 置空错误铃声的终端代码

" set showmatch " 插入括号时，短暂地跳转到匹配的对应括号

" set matchtime=2 " 短暂跳转到匹配括号的时间

set magic " 设置魔术

set hidden " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

set guioptions-=T " 隐藏工具栏

set guioptions-=m " 隐藏菜单栏

set smartindent" 开启新行时使用智能自动缩进

set backspace=indent,eol,start

" 不设定在插入状态无法用退格键和 Delete 键删除回车符

set cmdheight=1" 设定命令行的行数为 1

set laststatus=2" 显示状态栏 (默认值为 1, 无法显示状态栏)

set statusline=\%<%F[%1*%M%*%n%R%H]%=\%y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\

" 设置在状态行显示的信息

"set foldenable " 开始折叠

"set foldmethod=syntax " 设置语法折叠

"set foldcolumn=0 " 设置折叠区域的宽度

"set localfold level=1 " 设置折叠层数为

" set foldclose=all " 设置为自动关闭折叠

" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 用空格键来开关折叠
"

if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"copy to clipboard.
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

set ignorecase
set wrap
map <C-K> :pyf /Users/luoxhu/workspace/llvm/clang/tools/clang-format/clang-format.py<cr>
imap <C-K> <c-o>:pyf /Users/luoxhu/workspace/llvm/clang/tools/clang-format/clang-format.py<cr>
