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
