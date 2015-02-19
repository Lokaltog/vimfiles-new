if ! has('gui_running') && $TERM =~# 'xterm-256color'
	" Set colorscheme {{{
		colo distinguished
	" }}}
	" Instantly leave insert mode when pressing <Esc> {{{
		set ttimeoutlen=10
		augroup FastEscape
			autocmd!

			au InsertEnter * set timeoutlen=0
			au InsertLeave * set timeoutlen=1000
		augroup END
	" }}}
	" Use custom fillchars/listchars/showbreak icons {{{
		set list
		set fillchars=vert:│,fold:┄,diff:╱
		set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
		set showbreak=↪
	" }}}
endif
