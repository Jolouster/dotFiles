" Configuration by Jonathan López
" Date: Mayo 2020
" ----------------------------------------------------------------------------------------
" Plugin's section
" ----------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'joshdick/onedark.vim' " Theme very cool
	Plug 'vim-airline/vim-airline'	" Theme for powerline in vim
	Plug 'vim-airline/vim-airline-themes'
	Plug 'scrooloose/nerdtree'
	Plug 'Townk/vim-autoclose' " Cierra automáticamente las llaves, paréntesis y corchetes
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (Recommend)
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} " Or latest tag
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " Or build from source code by use yarn: https://yarnpkg.com
	Plug 'vim-pandoc/vim-pandoc' " Integración con Pandoc
	Plug 'vim-pandoc/vim-pandoc-syntax' " Pilla mejor la 'versión' de markdown que usa Pandoc
	Plug 'stephpy/vim-php-cs-fixer'	" Format the php file 
	Plug 'ryanoasis/vim-devicons' " Añade iconos a vim!
call plug#end()

" ----------------------------------------------------------------------------------------
"  Configurations
" ----------------------------------------------------------------------------------------
syntax on
set number			    " muestra los número de línea
set relativenumber		" muestra las líneas relativas a la que estamos -Mola un huevete!-
set shiftwidth=4		" espacios para el autoindentado
set tabstop=4			" espacios que elimina cuando se elimina un indentado
set noexpandtab			" no convierte tabulaciones en espacios
set autoindent			" habilita el autoindentado en archivos de código
set smartindent
set encoding=utf-8		" establece la codificación por defecto
set wildmenu
color onedark
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set spelllang=en,es_es
set cindent shiftwidth=4
set foldmethod=indent	" Create folds for every sequence of lines with the same indent.
						" It's related with 'shiftwidth'.
"set foldmethod=expr	
"set foldepxr=blablablablabla
set foldclose=all 		" You can make folds close automatically when you move out of it
set foldlevel=1			" All folds with N times a 'shiftwidth' indent or more will be closed.
" Folding unchanged lines. For more details see 'fold-diff' in help.

" ----------------------------------------------------------------------------------------
"  Plugins configuration
" ----------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1	" Enable extension of vim-airline for tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

" Configuration for vim-pandoc-syntax
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#level=2 " Todos las secciones con un encabezado inferior al 2 (1 el mayor) se contraen

" Configuration for NERDTree
" 	-> Open NERDTree when vim starts up on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"	-> Map a specific key to open NERDTree (F2)
map <F2> :NERDTreeToggle<CR>
"	-> Close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If you use php-cs-fixer version 2.x
let g:php_cs_fixer_rules = '@PSR2'          " options: --rules (default:@PSR2)
"let g:php_cs_fixer_cache = '.php_cs.cache' " options: --cache-file
"let g:php_cs_fixer_config_file = '.php_cs' " options: --config
" End of php-cs-fixer version 2 config params

let g:php_cs_fixer_php_path = 'php'               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

