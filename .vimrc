filetype plugin indent on
syntax on   "打开语法高亮
set nocp
colo evening    "使用evening主题
set nocompatible    "不要vim模仿vi模式
set autoindent  "智能缩进
set tabstop=4   "让一个Tab等于4个空格 
set hlsearch    "高亮显示结果
set incsearch   "让vim实时匹配搜索
set shiftwidth=4

set nu! "显示行号
set ruler
set tags=./tags;
set tags+=/usr/include/qt4/tags
set autochdir
set tags+=/usr/include/tags

"进行Tlist的设置
map <F4> <Esc>:Tlist<CR> "按下F4显示Tlist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_lnc_Winwidth=4
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Exit_OnlyWindow=1  "当只有tag窗口时退出vim
let Tlist_Auto_Open=0 "每次使用vim，是否自动打开Tlist 

" 设置自动补全
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1 
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2 
let OmniCpp_DisplayMode = 1 
let OmniCpp_ShowScopeInAbbr = 0 
let OmniCpp_ShowPrototypeInAbbr = 1 "显示函数参数列表
let OmniCpp_ShowAccess = 1 
let OmniCpp_MayCompleteDot = 1  "输入. 后补全
let OmniCpp_MayCompleteArrow = 1 "输入->后补全
let OmniCpp_MayCompleteScope = 1 "输入::后补全

set completeopt=menuone,longest,menu
set ai!

highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"使用astyle 格式化C代码
map <F5> <Esc>:%! astyle -p  --style=ansi --indent=spaces=4<CR>
map <F6> gg=G

set smartindent "智能对齐方式
set expandtab

"vimwiki

let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/",  "syntax": "markdown", "auto_export": 0}]


"使用鼠标复制粘贴
set mouse=v

set fileencodings=utf8,cp936,gb18030,big5

map <F7> <Esc> :NERDTree <cr>
map <F8> :CommandT <cr>
map <F9> :Calendar<cr>

" 状态栏
"powerline{
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
"set t_Co=256
let g:Powerline_symbols= 'fancy'
"}


highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
" python自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete


" 自动重加载文件
set autoread

" 使用tag切换时自动保存文件
set autowriteall

" 管理插件的插件 
call pathogen#infect()
