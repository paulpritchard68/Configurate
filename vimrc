"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set ic "ignore case

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set filetype=on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trim white space
function! TrimWhiteSpace()
     %s/\s\+$//
endfunction

" Convert a column of character values into a list
function! ListerateCharacter()
    %s/^/'
    %s/\n/', 
    %s/, $//
endfunction

" Convert a column of numeric values into a list
function! ListerateNumeric()
    %s/\n/, 
    %s/, $//
endfunction

" Reformat EDIFACT and ANSI X12 file for readability
function! ReformatEDI()
    %s/'/'\r/ge
    %s/\~/\~\r/ge
    1
endfunction

" List all Warning and Error messages
function! GrepErrors()
    g/Warning\|Error/p
endfunction

" De-cruft a DSPFFD
function! DecruftDSPFFD()
    1,19d
    %g/Display File Field/d
    %g/Record format/d
    %g/Field text/d
    %g/Coded Character/d
    %g/Field Level Information/d
    %g/Referenced/d
    %g/Library/d
    %g/Attributes changed/d
    3,%g/Data\s\+Field/d
    3,%g/Field\s\+Type/d
    %s/[0-9]\+\s\+[0-9]\+\s\+Both\s\+//    
    0
endfunction

" Decruft an SEU source listing
function! DecruftSEU()
    5,$g/SEU SOURCE LISTING/d
    5,$g/SOURCE FILE ./d
    5,$g/MEMBER ./d
    5,$g/SEQNBR*./d
    %s/\d\d\/\d\d\/\d\d$//
    call TrimWhiteSpace()
    0
endfunction

" Append a semi-colon
function! AppendSemiColon()
    execute "normal! mqA;\<esc>`q" 
    0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = '\'

" Functions
nnoremap <silent> <Leader>tws :call TrimWhiteSpace()<CR>
nnoremap <silent> <Leader>lc :call ListerateCharacter()<CR>
nnoremap <silent> <Leader>ln :call ListerateNumeric()<CR>
nnoremap <silent> <leader>edi :call ReformatEDI()<CR>
nnoremap <silent> <leader>trc :call GrepErrors()<CR>
nnoremap <silent> <leader>df :call DecruftDSPFFD()<CR>
nnoremap <silent> <leader>ds :call DecruftSEU()<CR>
nnoremap <silent> <leader>as :call AppendSemiColon()<CR>

" TwitVim
nnoremap <silent> <Leader>gsh :FriendsTwitter<CR>
nnoremap <silent> <Leader>gsm :RepliesTwitter<CR>
nnoremap <silent> <Leader>gsr :RefreshTwitter<CR>
nnoremap <silent> <Leader>gsp :PosttoTwitter<CR>

" More handy stuff
nnoremap <silent> <leader>w :set wrap!<CR>
nnoremap <silent> <leader>ve :vsplit $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

" Abbreviations
iabbrev teh the

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Stuff for making vim useful in Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" More Mappings: Copy and Paste
if has("clipboard")
    nmap <C-V> "+gP
    vmap <C-C> "+y
    vmap <C-X> "+x
endif

" Settings for gvim
if has("gui_running")
    colorscheme murphy
    set guifont=Consolas:h10
    au GUIEnter * simalt ~x
    set wrap
else
    colorscheme slate
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Silliness
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("unix")
    let today = strftime("%m%d")
    if today == 0504 + 0
        echo "May the fourth be with you"
    endif
    if today == 0525 + 0
        echo "Listen. It's a tough universe."  
        echo "There's all sorts of people and things trying to do you, " . 
         \ "kill you, rip you off, everything. " 
        echo "If you're going to survive out there, you've really got to know where your towel is."
    endif
endif
