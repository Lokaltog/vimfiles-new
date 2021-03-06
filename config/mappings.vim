let mapleader = ','

" F key mappings {{{
	nnoremap <silent> <F2>  :set paste!<CR>
	nnoremap <silent> <F6>  :set number!<CR>
	nnoremap <silent> <F7>  :Unite grep:.<CR>
	nnoremap <silent> <F8>  :UndotreeToggle<CR>
	nnoremap <silent> <F9>  :Unite -quick-match buffer<CR>
	nnoremap <silent> <F10> :Unite file_rec/async<CR>
	nnoremap <silent> <F12> :VimFilerExplorer<CR>
" }}}
" Tabularize mappings {{{
	vnoremap <silent> <Leader>a=  :Tabularize /=/l0l1<CR>
	vnoremap <silent> <Leader>a,  :Tabularize /,/l0l1<CR>
	vnoremap <silent> <Leader>a:  :Tabularize /:/l0l1<CR>
" }}}
" Buffer mappings {{{
	nnoremap <silent> <Leader>bd :bd<CR>
" }}}
" Quick edit .vimrc {{{
	nnoremap <silent> <Leader>ev :edit   $MYVIMRC<CR>
	nnoremap <silent> <Leader>sv :source $MYVIMRC<CR>
" }}}
" Handy space/cr mappings {{{
	vmap <silent> <Space> ,c<space>
	nmap <silent> <Space> ,c<space>
" }}}
" Clear search highlighting {{{
	nnoremap <silent> <Leader>/ :nohlsearch<CR>
" }}}
" Swap default ex mappings with cmdwindow {{{
	" Fix broken vim regexes when searching {{{
		function! VerymagicSearchCommand()
			let curline = getline(line('.'))
			" Check if we're performing a search
			if curline[col('.') - 2] != 's'
				return '/'
			endif
			" Check if we already specified that we're using very magic regexps
			" in the search command
			if match(curline, '\\v') == -1
				return '/\v'
			endif

			return '/'
		endfunction
	" }}}
	" Enter quickly with semicolon
	nnoremap ; :
	xnoremap ; :
	nnoremap : ;
	xnoremap : ;
	nnoremap / q/i\v
	xnoremap / q/i\v
	nnoremap ? q?i
	xnoremap ? q?i
	nnoremap q: :
	xnoremap q: :
	nnoremap q/ /
	xnoremap q/ /
	nnoremap q? ?
	xnoremap q? ?
	" Exit quickly with escape
	autocmd CmdwinEnter * nnoremap <buffer> <esc> :q<cr>
	autocmd CmdwinEnter * inoremap <buffer> / <C-R>=VerymagicSearchCommand()<CR>
" }}}
" Split window mappings {{{
	set <M-k>=k
	set <M-j>=j
	set <M-h>=h
	set <M-l>=l

	nnoremap <M-k> <C-w>k
	nnoremap <M-j> <C-w>j
	nnoremap <M-h> <C-w>h
	nnoremap <M-l> <C-w>l

	nnoremap <C-k> <C-w>s
	nnoremap <C-j> <C-w>sJ
	nnoremap <C-h> <C-w>v
	nnoremap <C-l> <C-w>vL
" }}}
" Re-indent pasted text {{{
	nnoremap <Leader>p p'[v']=
	nnoremap <Leader>P P'[v']=
" }}}
" Repurpose arrow keys to move lines {{{
	" Inspired by http://jeetworks.com/node/89
	function! s:MoveLineUp()
		call <SID>MoveLineOrVisualUp(".", "")
	endfunction

	function! s:MoveLineDown()
		call <SID>MoveLineOrVisualDown(".", "")
	endfunction

	function! s:MoveVisualUp()
		call <SID>MoveLineOrVisualUp("'<", "'<,'>")
		normal gv
	endfunction

	function! s:MoveVisualDown()
		call <SID>MoveLineOrVisualDown("'>", "'<,'>")
		normal gv
	endfunction

	function! s:MoveLineOrVisualUp(line_getter, range)
		let l_num = line(a:line_getter)
		if l_num - v:count1 - 1 < 0
			let move_arg = "0"
		else
			let move_arg = a:line_getter." -".(v:count1 + 1)
		endif
		call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
	endfunction

	function! s:MoveLineOrVisualDown(line_getter, range)
		let l_num = line(a:line_getter)
		if l_num + v:count1 > line("$")
			let move_arg = "$"
		else
			let move_arg = a:line_getter." +".v:count1
		endif
		call <SID>MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
	endfunction

	function! s:MoveLineOrVisualUpOrDown(move_arg)
		let col_num = virtcol(".")
		execute "silent! ".a:move_arg
		execute "normal! ".col_num."|"
	endfunction

	" Arrow key remapping:
	" Up/Dn = move line up/dn
	" Left/Right = indent/unindent

	" Normal mode
	nnoremap <silent> <Left>   <<
	nnoremap <silent> <Right>  >>
	nnoremap <silent> <Up>     <Esc>:call <SID>MoveLineUp()<CR>
	nnoremap <silent> <Down>   <Esc>:call <SID>MoveLineDown()<CR>

	" Visual mode
	vnoremap <silent> <Left>   <gv
	vnoremap <silent> <Right>  >gv
	vnoremap <silent> <Up>     <Esc>:call <SID>MoveVisualUp()<CR>
	vnoremap <silent> <Down>   <Esc>:call <SID>MoveVisualDown()<CR>

	" Insert mode
	inoremap <silent> <Left>   <C-D>
	inoremap <silent> <Right>  <C-T>
	inoremap <silent> <Up>     <C-O>:call <SID>MoveLineUp()<CR>
	inoremap <silent> <Down>   <C-O>:call <SID>MoveLineDown()<CR>
" }}}
