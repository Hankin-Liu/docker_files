"1. pathogen configuration
execute pathogen#infect()
call pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible               " be iMproved
filetype off                             " required! 
syntax on

"2. Vbundle configuration
set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()                         " let Vundle manage Vundle
Plugin 'gmarik/vundle'                   " required! 

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'tpope/vim-rails.git'
Plugin 'kien/ctrlp.vim'
"Plugin 'msanders/snipmate.vim'
Plugin 'mileszs/ack.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe' 
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'fatih/vim-go'
" vim-scripts repos
Bundle 'Auto-Pairs'
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
call vundle#end()             " required

filetype plugin indent on     " required!
"set completeopt=longest,menu    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menuone    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"leader set up
let mapleader=";"
"Esc mapping
imap jj <esc>

" 跳转到定义处
"let g:ycm_goto_buffer_command='horizontal-split'
"let g:ycm_goto_buffer_command='same-buffer'
"nnoremap <leader>gl :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gdd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
"force recomile with
nnoremap <F7> :YcmForceCompileAndDiagnostics<CR> 
" syntastic
"open locationlist
nnoremap <leader>lo :lopen<CR> 
"close locationlist
nnoremap <leader>lc :lclose<CR> 
inoremap <leader><leader> <C-x><C-o>
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_path_to_python_interpreter='/usr/bin/python'
let g:ycm_auto_trigger = 1
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=1
" 开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=1
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings=1
let g:ycm_filetype_blacklist = {
			\ 'tagbar' : 1,
			\ 'nerdtree' : 1,
			\}

"  \     'cpp,objcpp' : ['->', '.', ' ', '(', '[', '&', '::'],
let g:ycm_semantic_triggers = {
  \   'c' : ['->', '    ', '.', ' ', '(', '[', '&'],
  \     'cpp,objcpp' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \     'perl' : ['->', '::', ' '],
  \     'php' : ['->', '::', '.'],
  \     'cs,java,javascript,d,vim,python,perl6,scala,vb,elixir,go' : ['.'],
  \     'ruby' : ['.', '::'],
  \     'lua' : ['.', ':']
  \ }
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
"youcompleteme 默认tab s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion=['<Down>']
let g:ycm_key_list_previous_completion=['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
"let g:ycm_key_invoke_completion='<M-Space>'

"4. NERDTree Configuration
map <F2> :NERDTreeToggle<CR>
"let NERDTreeQuitOnOpen=0
let NERDTreeWinSize=25
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree

"5. Ctags Configuration
" 按下F8重新生成tag文件，并更新taglist
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F8> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags "add current directory's generated tags file"
set tags+=~/.vim/tags/cpp_src/tags    " add stl tags file
set tags+=~/.vim/tags/kernel/tags    " add linux kernel tags file
set tags+=/usr/include/boost/tags
set tags+=/usr/include/c++/4.8.5/tags " add c++ tags file  "

"6. Tagbar Configuration
nmap <silent> <F4> :TagbarToggle<CR>  
let g:tagbar_ctags_bin = '/usr/bin/ctags'  
let g:tagbar_width = 25
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx,*.go call tagbar#autoopen()     "如果是c语言的程序的话，tagbar自动开启

"7. miniBufexplorer Configuration
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchWindows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1	

"8. vim-go
let g:go_fmt_command = "goimports"

"9. Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_compiler = 'g++'  "change the compiler to g++ to support c++11. 
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++' "set the options of g++ to suport c++11.

"
" UltiSnips {{{2
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = expand("$XDG_CONFIG_HOME/vim/ultisnips")
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]
let g:UltiSnipsExpandTrigger = "<C-L>"
let g:UltiSnipsJumpForwardTrigger = "<C-L>"
let g:UltiSnipsJumpBackwardTrigger = "<C-H>"

"Set for Go
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',  
    \ 'kinds'     : [  
        \ 'p:package',  
        \ 'i:imports:1',  
        \ 'c:constants',  
        \ 'v:variables',  
        \ 't:types',  
        \ 'n:interfaces',  
        \ 'w:fields',  
        \ 'e:embedded',  
        \ 'm:methods',  
        \ 'r:constructor',  
        \ 'f:functions'  
    \ ],  
    \ 'sro' : '.',  
    \ 'kind2scope' : {  
        \ 't' : 'ctype',  
        \ 'n' : 'ntype'  
    \ },  
    \ 'scope2kind' : {  
        \ 'ctype' : 't',  
        \ 'ntype' : 'n'  
    \ },  
    \ 'ctagsbin'  : 'gotags',  
    \ 'ctagsargs' : '-sort -silent'  
    \ }


"按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -std=c++11"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
    elseif &filetype == 'go'
        exec "!go build"
        exec "!go run %"
    endif
endfunc

"C,C++的调试
map <F6> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    exec "!g++ % -g -o %< -std=c++11"
    exec "!gdb -tui ./%<"
endfunc

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java,.go文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.go exec ":call SetTitle()" 
"""定义函数SetTitle，自动插入文件头 
func SetTitle() 
        "如果文件类型为.sh文件
        if &filetype == 'sh' 
            call setline(1,"\#########################################################################") 
            call append(line("."), "\# File Name: ".expand("%")) 
            call append(line(".")+1, "\# Author:  Hankin Liu") 
            call append(line(".")+2, "\# mail: wojiaoliuhuajun.com") 
            call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
            call append(line(".")+4, "\#########################################################################") 
            call append(line(".")+5, "\#!/bin/bash") 
            call append(line(".")+6, "") 
        elseif &filetype == 'cpp'
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: Hankin Liu") 
            call append(line(".")+2, "    > Mail: wojiaoliuhuajun.com ") 
            call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
            call append(line(".")+6, "#include <iostream>")
            call append(line(".")+7, "using namespace std;")
            call append(line(".")+8, "")
        elseif &filetype == 'c'
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: Hankin Liu") 
            call append(line(".")+2, "    > Mail: wojiaoliuhuajun.com ") 
            call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
            call append(line(".")+6, "#include <stdio.h>")
            call append(line(".")+7, "")
        elseif &filetype == 'go'
            call setline(1, "/*************************************************************************") 
            call append(line("."), "    > File Name: ".expand("%")) 
            call append(line(".")+1, "    > Author: Hankin Liu") 
            call append(line(".")+2, "    > Mail: wojiaoliuhuajun.com ") 
            call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
            call append(line(".")+4, " ************************************************************************/") 
            call append(line(".")+5, "")
        endif
        "新建文件后，自动定位到文件末尾
        autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase        " 搜索模式里忽略大小写
set ts=4
set expandtab
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set cindent
set showmatch        " 设置匹配模式，显示匹配的括号
set linebreak        " 整词换行
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
set number            " Enable line number    "显示行号
set history=50        " set command history to 50    "历史记录50条
"--状态行设置--
set laststatus=2      "
"总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set ruler
""标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
"--命令行设置--
set showcmd            " 命令行显示输入的命令
set showmode           " 命令行显示vetting--
set incsearch          " 输入字符串就显示匹配点
set hlsearch           "当前模式
set cursorline      
set backspace=indent,eol,start
set autoread           " 设置当文件被改动时自动载入
set nofoldenable         " 开始折叠
set foldmethod=syntax  " 设置语法折叠
set foldcolumn=0       " 设置折叠区域的宽度
setlocal foldlevel=1   " 设置折叠层数为
" set foldclose=all " 设置为自动关闭折叠
" 用空格键来开关折叠
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++
