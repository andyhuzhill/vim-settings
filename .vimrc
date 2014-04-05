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
set textwidth=100  "设置一行100列
set cc=+1         "设置第100列显示对齐线
let g:indent_guides_guide_size=1

set nu! "显示行号
set ruler
set tags+=/usr/include/tags
set tags=./tags;
set autochdir

"进行Tlist的设置
map <F4> <Esc>:Tlist<CR> "按下F4显示Tlist
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

highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

"使用astyle 格式化C代码
map <F5> <Esc>:%! astyle -fUz2 --style=linux --indent=spaces=4<CR>
map <F6> gg=G

set smartindent "智能对齐方式
set expandtab

"头文件与源文件切换
map <F12> <Esc>:A<CR>

"vimwiki
let g:vimwiki_use_mouse = 1
let g:vimwiki_list = [ {"path": "~/vimwiki/", "path_html": "~/wiki/",  "syntax": "markdown", "auto_export": 0}]


"使用鼠标复制粘贴
set mouse=v

let &termencoding=&encoding
set fileencodings=utf8,cp936,gb18030,big5


"显示路径文件
map <F7> <Esc> :NERDTree <cr>

map <F3> :call Do_CsTag()<CR>
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent!
        "execute
        ""!ctags
        -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

" 状态栏
"powerline{
"set guifont=powerlinesymbols\ for\ powerline
"set nocompatible
"set t_co=256
"let g:powerline_symbols= 'fancy'
"}


highlight statusline cterm=bold ctermfg=yellow ctermbg=blue
" python自动补全
autocmd filetype python set omnifunc=pythoncomplete#complete

" 自动重加载文件
set autoread

" 使用tag切换时自动保存文件
set autowriteall

" 管理插件的插件 
call pathogen#infect()

" 新建python文件自动插入文件头
autocmd BufNewFile *.py 0 r ~/.vim/templates/python.tpl
autocmd BufNewFile *.vhdl 0 r ~/.vim/templates/vhdl.tpl
autocmd BufNewFile *.vhd  0 r ~/.vim/templates/vhdl.tpl
autocmd BufNewFile *.sh   0 r ~/.vim/templates/bash.tpl
