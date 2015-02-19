" Load bundles {{{
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#begin(expand('~/.nvim/bundle/'))

	NeoBundleFetch 'Shougo/neobundle.vim'

	" Plugins
	NeoBundle 'Lokaltog/vim-distinguished'
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/vimfiler.vim'
	NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': 'make'}}
	NeoBundle 'SirVer/ultisnips'
	NeoBundle 'Valloric/YouCompleteMe', {'build': {'unix': './install.sh'}}
	NeoBundle 'godlygeek/tabular'
	NeoBundle 'joonty/vim-sauce'
	NeoBundle 'mbbill/undotree'
	NeoBundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
	NeoBundle 'scrooloose/nerdcommenter'
	NeoBundle 'scrooloose/syntastic'
	NeoBundle 'tpope/vim-fugitive'

	" Filetypes
	NeoBundle 'digitaltoad/vim-jade'
	NeoBundle 'pangloss/vim-javascript'
	NeoBundle 'wavded/vim-stylus'

	call neobundle#end()

	NeoBundleCheck
" }}}
" Main configuration {{{
	set nocompatible
	filetype plugin indent on
	syntax on
	" Terminal configuration {{{
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
		" Change cursor color in insert mode {{{
			"let &t_SI = '^[]50;CustomCursorColor=#89b6e2;BlinkingCursorEnabled=true^G'
			"let &t_EI = '^[]50;CustomCursorColor=#dd4010;BlinkingCursorEnabled=false^G'
		" }}}
		" Use custom fillchars/listchars/showbreak icons {{{
			set list
			set fillchars=vert:│,fold:┄,diff:╱
			set listchars=tab:⋮\ ,trail:⌴,eol:·,precedes:◂,extends:▸
			set showbreak=↪
		" }}}
	endif
	" }}}

	set laststatus=2
	"set showtabline=2
	set backspace=indent,eol,start
	set nobackup
	set clipboard=unnamed,unnamedplus,autoselect
	set colorcolumn+=76,120
	set conceallevel=2
	set confirm
	set encoding=utf-8
	set noerrorbells visualbell t_vb=
	set formatoptions=tcrqwnl1
	set hidden
	set history=1000
	set hlsearch
	set ignorecase
	set incsearch
	set linebreak
	set nomodeline
	set mouse=nvr
	set nonumber
	set numberwidth=4
	set pumheight=10
	set report=0
	set scrolljump=10
	set scrolloff=10
	set shortmess=atToOI
	set noshowmode
	set smartcase
	set smartindent
	set nostartofline
	set noswapfile
	set switchbuf=useopen,usetab
	set termencoding=utf-8
	set undodir=~/.vim/tmp
	set undofile
	set undolevels=1000
	set updatetime=1500
	set virtualedit=block
	set nowrap
	set nowritebackup
	" Set tab width {{{
			let g:tabwidth = 4

			exec 'set shiftwidth='  . g:tabwidth
			exec 'set softtabstop=' . g:tabwidth
			exec 'set tabstop='     . g:tabwidth
	" }}}
	" Folding settings {{{
			set foldcolumn=0
			set foldenable
			set foldlevel=0
			set foldmethod=marker
			set foldtext=FoldText()
	" }}}
	" Wild menu {{{
			set wildignore=.svn,CVS,.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*/.tox/*,*.egg-info/*,*/node_modules/*
			set wildmenu
			set wildmode=list:longest,full
	" }}}
" }}}
" Load plugin configurations {{{
	runtime! config/**/*.vim
" }}}
