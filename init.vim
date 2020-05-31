" Configuration by Jonathan López
" Date: Mayo 2020
" ----------------------------------------------------------------------------------------
" Plugin's section
" ----------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
	" Generic plugins
	Plug 'joshdick/onedark.vim' " Theme very cool
	Plug 'vim-airline/vim-airline'	" Theme for powerline in vim
	Plug 'vim-airline/vim-airline-themes'
	Plug 'scrooloose/nerdtree'
	Plug 'Townk/vim-autoclose' " Cierra automáticamente las llaves, paréntesis y corchetes
	Plug 'ryanoasis/vim-devicons' " Add icons to user interface
	Plug 'tpope/vim-fugitive' " Para usar git desde neovim
	Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs
	Plug 'tpope/vim-commentary' " Work with comments
	" Autocomplete based in 'Language Server Protocol (LSP)'
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (Recommend)
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} " Or latest tag
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " Or build from source code by use yarn: https://yarnpkg.com
	" Convert files 
	Plug 'vim-pandoc/vim-pandoc' " Integración con Pandoc
	Plug 'vim-pandoc/vim-pandoc-syntax' " Pilla mejor la 'versión' de markdown que usa Pandoc
	" Work with PHP files
	Plug 'stephpy/vim-php-cs-fixer'	" Format the php file 
	" Improve search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
	" Plug 'junegunn/fzf.vim'
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
set backup
set mouse=a
set splitright
set splitbelow
set foldmethod=indent	" Create folds for every sequence of lines with the same indent.
						" It's related with 'shiftwidth'.
"set foldmethod=expr	
"set foldepxr=blablablablabla
"set foldclose=all 		" You can make folds close automatically when you move out of it
"set nofoldenable
set foldcolumn=2
set foldlevel=1			" All folds with N times a 'shiftwidth' indent or more will be closed.
" Folding unchanged lines. For more details see 'fold-diff' in help.
set viewoptions=folds,localoptions,unix,slash,cursor
autocmd BufWritePre *.php mkview 
autocmd BufWritePost *.php loadview

" ----------------------------------------------------------------------------------------
"  Plugins configuration
" ----------------------------------------------------------------------------------------

" Airline
" ----------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1	" Enable extension of vim-airline for tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:airline#extensions#branch#enabled = 1 " Habilita integración de Fugitive con Airline.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Configuration for vim-pandoc-syntax
" ----------------------------------------------------------------------------------------
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#level=2 " Todos las secciones con un encabezado inferior al 2 (1 el mayor) se contraen

" Configuration for NERDTree
" ----------------------------------------------------------------------------------------
" 	-> Open NERDTree when vim starts up on directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"	-> Map a specific key to open NERDTree (F2)
map <F2> :NERDTreeToggle<CR>
"	-> Close vim if NERDTree is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" PHP cs-fixer
" ----------------------------------------------------------------------------------------
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

" FZF
" ----------------------------------------------------------------------------------------
nnoremap <C-p> :FZF<CR>
" Ctrl+t open file in a new tab
" Ctrl+s open file below (split view)
" Ctrl+v open file to the side (vertical split)
" Enter to open it in the current selected panel
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}

" COC
" ----------------------------------------------------------------------------------------
" see more information about coc-clangd
" see more information about coc-cmake
" see more information about coc-phpls
let g:coc_disable_startup_warning = 1
" Recomended configurations in coc.nvim webpage in Github
set updatetime=300
set signcolumn=yes
set shortmess+=c
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" ----------------------------------------------------------------------------------------
"  Terminal configuration
" ----------------------------------------------------------------------------------------
" Turn terminal to normal modde with escape
tnoremap <Esc> <C-\><C-n>		
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
	split term://bash
	resize 10
endfunction
" Open a terminal with Ctrl + n in a horizontal split below
nnoremap <c-n> :call OpenTerminal()<CR>




