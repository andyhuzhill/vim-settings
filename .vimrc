filetype plugin on
syntax on   "打开语法高亮
colo evening    "使用evening主题
set nocompatible    "不要vim模仿vi模式
set autoindent  "智能缩进
set tabstop=4   "让一个Tab等于4个空格 
set hlsearch    "高亮显示结果
set incsearch   "让vim实时匹配搜索
set shiftwidth=4

set nu! "显示行号
set ruler
set tags=tags;
set tags+=/usr/include/qt4/tags

set autochdir
set tags+=/usr/include/tags
set tags+=/usr/include/gtk-2.0/tags

"进行Tlist的设置
map <F4> <Esc>:Tlist<CR> "按下F4显示Tlist
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_lnc_Winwidth=4
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0 "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要



let OmniCpp_GlobalScopeSearch = 1  " 0 or 1 
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2 
let OmniCpp_DisplayMode = 1 
let OmniCpp_ShowScopeInAbbr = 0 
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_MayCompleteDot = 1 
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 

set completeopt=longest,menu
set ai!

"使用astyle 格式化C代码
map <F5> <Esc>:%! astyle -p  --style=ansi --indent=spaces=4<CR>

map <F7> gg=G

set smartindent "智能对齐方式
set expandtab

let NERDShutUp=1

"vimwiki

let g:vimwiki_use_mouse = 1

"按<F6>转为HTML
map <F6> :Vimwiki2HTML <cr>

"使用鼠标复制粘贴
set mouse=v

set fileencodings=utf8,cp936,gb18030,big5
