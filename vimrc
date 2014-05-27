"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbering
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tabs and indents
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set filetype=on
so ~/.vim/mysyntax.vim

colorscheme default

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = '\'

nnoremap <silent> <Leader>tws :call TrimWhiteSpace()<CR>
nnoremap <silent> <Leader>lc :call ListerateCharacter()<CR>
nnoremap <silent> <Leader>ln :call ListerateNumeric()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Twitvim
" Config settings to use TwitVim with Identi.ca
" UserID:Password refers to your Identi.ca UserID and Password
" Vimball: http://vim.sourceforge.net/scripts/script.php?script_id=2204
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let twitvim_api_root = "http://identi.ca/api"
let twitvim_cert_insecure = 1
let twitvim_login = "UserID:Password"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The Towel Day Easter Egg
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let today = strftime("%m%d")
if today == 0525 + 0
    echo "Listen. It's a tough universe."  
    echo "There's all sorts of people and things trying to do you, " . 
         \ "kill you, rip you off, everything. " 
    echo "If you're going to survive out there, you've really got to know where your towel is."
endif
