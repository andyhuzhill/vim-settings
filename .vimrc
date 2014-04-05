" vim  配置文件
" author: Andy Scout
" e-mail: andyhuzhill@gmail.com

" 使用Bundle管理插件
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'pix/vim-taglist'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'Yggdroot/indentLine'
Bundle 'tpope/vim-surround'
Bundle 'a.vim'
Bundle 'taglist.vim'
Bundle 'python.vim'
Bundle 'python-mode'
Bundle 'vim_markdown'
Bundle 'vim-scripts/javaDoc.vim'

filetype plugin indent on

syntax on           "打开语法高亮
set nocompatible    " 不要vim模仿vi模式
colo evening 	    " 使用evening主题
set autoindent      " 智能缩进
set smartindent	    " 智能对齐方式
set expandtab
set tabstop=4       " 让一个Tab等于4个空格
set hlsearch        " 高亮显示结果
set incsearch       " 让vim实时匹配搜索
set shiftwidth=4
set textwidth=100   " 设置一行100列
set cc=+1           " 设置第100列显示对齐线
set nu!             " 显示行号

let g:indent_guides_guide_size=1

set ruler
set tags+=/usr/include/tags
set tags=./tags
set autochdir


"设置PowerLine
set laststatus=2
let g:Powerline_symbols = 'unicode'

"进行Tlist的设置
let Tlist_Ctags_Cmd="ctags"         "因为ctags直接在环境变量里可直接执行
let Tlist_Use_Right_Window=0        "让窗口显示在左边
let Tlist_lnc_Winwidth=4
let Tlist_Show_One_File=1           "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1    "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1         "当taglist是最后一个分割窗口时，自动退出vim
let Tlist_Process_File_Always=0     "是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
let Tlist_Exit_OnlyWindow=1         "当只有tag窗口时退出vim
let Tlist_Auto_Open=0               "每次使用vim，是否自动打开Tlist 

" 设置自动补全
let OmniCpp_GlobalScopeSearch = 1   " 0 or 1 
let OmniCpp_NamespaceSearch = 1     " 0 ,  1 or 2 
let OmniCpp_DisplayMode = 1 
let OmniCpp_ShowScopeInAbbr = 0 
let OmniCpp_ShowPrototypeInAbbr = 1 "显示函数参数列表
let OmniCpp_ShowAccess = 1 
let OmniCpp_MayCompleteDot = 1      "输入. 后补全
let OmniCpp_MayCompleteArrow = 1    "输入->后补全
let OmniCpp_MayCompleteScope = 1    "输入::后补全

set completeopt=menuone,longest,menu
set ai!

"使用astyle 格式化C代码
map <F5> <Esc>:%! astyle -fUz2 --style=linux --indent=spaces=4<CR>
map <F6> gg=G

"头文件与源文件切换
map <F12> <Esc>:A<CR>

" 使用鼠标复制粘贴
set mouse=v

let &termencoding=&encoding
set fileencodings=utf8,cp936,gb18030,big5

" 自动重加载文件
set autoread

"使用tag切换时自动保存文件
set autowriteall

" 新建python文件自动插入文件头
autocmd BufNewFile *.py 0 r ~/.vim/templates/python.tpl
autocmd BufNewFile *.vhdl 0 r ~/.vim/templates/vhdl.tpl
autocmd BufNewFile *.vhd  0 r ~/.vim/templates/vhdl.tpl
autocmd BufNewFile *.sh   0 r ~/.vim/templates/bash.tpl
