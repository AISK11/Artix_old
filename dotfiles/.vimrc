"" LOCATION:     ~/.vimrc
"" AUTHOR:       AISK11
"" VERSION:      1.0.0
"" CREATED:      2022-04-04
"" UPDATED:      2022-04-04
"" DESCRIPTION:  Configuration file for vim text editor.
"" DEPENDENCIES: vim

"" http://vimdoc.sourceforge.net/htmldoc/options.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                   SOUND                                    ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn off all sound:
set noerrorbells
set novisualbell
set t_vb=
set tm=500


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                  BACKUPS                                   ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn off file backup:
set nobackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                               TAB and SPACES                               ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Preserve indentation on new line:
set autoindent

"" If set, replaces tabs with spaces:
"set expandtab

"" Tab = 4 chars:
set tabstop=4
set shiftwidth=4
set softtabstop=4

""" For specific file types, set different tab space:
autocmd FileType html   setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType css    setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 STATUSLINE                                 ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Always show status line:
set laststatus=2

"" Statusline:
set statusline=%F\ %p%%\ [%l:%c]\ %M\ %R\ %Y\ %y


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                 SCROLLING                                  ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Start scrolling N lines before reaches last line:
set scrolloff=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                   SEARCH                                   ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Highlight search results:
set hlsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                LINE NUMBERS                                ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Number lines:
set number


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                                   SYNTAX                                   ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Enable syntax highlighting:
syntax on

"" Highlight trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""                             HIGHLIGHT BRACKETS                             ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" When inserted bracket, briefly jump to matching one (is is on the screen):
"set showmatch
