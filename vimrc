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

colorscheme default

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = '\'

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
