" Configuration by Jonathan López
" Date: Septiembre 2020
" ----------------------------------------------------------------------------------------
" Plugin's section
" ----------------------------------------------------------------------------------------

call plug#begin('~/.local/share/nvim/plugged')
	" Generic plugins
	Plug 'joshdick/onedark.vim' " Theme very cool
	Plug 'vim-airline/vim-airline'	" Theme for powerline in vim
  	Plug 'vim-airline/vim-airline-themes'
  	Plug 'Townk/vim-autoclose' " Cierra automáticamente las llaves, paréntesis y corchetes
  	Plug 'ryanoasis/vim-devicons' " Add icons to user interface
  	Plug 'tpope/vim-surround' " The plugin provides mappings to easily delete, change and add such surroundings in pairs
  	Plug 'tpope/vim-commentary' " Work with comments
	" NerdTree
	Plug 'scrooloose/nerdtree'
  	" Autocomplete based in 'Language Server Protocol (LSP)'
  	Plug 'neoclide/coc.nvim', {'branch': 'release'}
  	" Convert files 
  	Plug 'vim-pandoc/vim-pandoc' " Integración con Pandoc
  	Plug 'vim-pandoc/vim-pandoc-syntax' " Pilla mejor la 'versión' de markdown que usa Pandoc
  	" Work with PHP files
    Plug 'stephpy/vim-php-cs-fixer'	" Format the php file 
  	" Improve search
  	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() }}
  	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-rooter'
	" Depuración dentro de vim 
	Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
	" Plug 'puremourning/vimspector'
	" Highlight for C/C++
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'vim-syntastic/syntastic'
	Plug 'rhysd/vim-clang-format'
call plug#end()

" ----------------------------------------------------------------------------------------
"  Configurations
" ----------------------------------------------------------------------------------------
syntax enable
set number			    " muestra los número de línea
set relativenumber		" muestra las líneas relativas a la que estamos -Mola un huevete!-
set shiftwidth=4		" espacios para el autoindentado
set tabstop=4			" espacios que elimina cuando se elimina un indentado
set noexpandtab			" no convierte tabulaciones en espacios
set autoindent			" habilita el autoindentado en archivos de código
set smartindent
set encoding=utf-8		" establece la codificación por defecto
set termencoding=utf-8	" codificación de la terminal
set wildmenu
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
set spelllang=en,es_es
set cindent shiftwidth=4
set backup
set writebackup
set backupdir=~/Temp/backupFiles/
set mouse=a
set autowrite
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
" Configuracion del tema de colores
" ----------------------------------------------------------------------------------------
colorscheme onedark
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
" ----------------------------------------------------------------------------------------
 
" Move among onpened files in buffers
nnoremap <S-Tab> :bn<CR>
" Move among splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move among tabs
nnoremap <C-Left> :tabn<CR>
nnoremap <C-Right> :tabp<CR>

"Make :grep use ripgrep (you need install before ripgrep in your system)
if executable('rg')
	set grepprg=rg\ --vimgrep
endif

" Configuración del explorador de archivos netrw
let g:loaded_netrw = 1 " avoid autoload 
let g:netrw_liststyle = 3 " mustra los archivos en forma de árbol
let g:netrw_preview = 1
let g:netrw_alto = 1
" Seleccionamos qué ejecutables de python usar. Hay varios en el sistema.
let g:python_host_prog = '/bin/python2'
let g:python3_host_prog = '/bin/python3'

" ----------------------------------------------------------------------------------------
" ################################ Plugins configuration ################################
" ----------------------------------------------------------------------------------------

" ----------------------------------------------------------------------------------------
" Airline
" ----------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1	" Enable extension of vim-airline for tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_theme='violet'
let g:airline#extensions#branch#enabled = 1 " Habilita integración de Fugitive con Airline.
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1 " show buffer name in tabline.
let g:airline_section_x = 'Bf:%{bufnr("%")}'

" move among buffers 
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" ----------------------------------------------------------------------------------------
" Configuration for vim-pandoc-syntax
" ----------------------------------------------------------------------------------------
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#level=2 " Todos las secciones con un encabezado inferior al 2 (1 el mayor) se contraen

" ----------------------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------------------
" FZF
" ----------------------------------------------------------------------------------------

"  // original, ahora es C-f (ver linea 183) nnoremap <C-p> :FZF<CR>
" Ctrl+t open file in a new tab
" Ctrl+x open file below (split view)
" Ctrl+v open file to the side (vertical split)
" Enter to open it in the current selected panel
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'
 
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)<Paste>

" ----------------------------------------------------------------------------------------
"  GESTIÓN Y MANEJO DE NOTAS
" ----------------------------------------------------------------------------------------
"
" Go to index of notes and set working directory to my notes
nnoremap <leader>ni :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>
" Command to search in our notes and only our notes
command! -nargs=1 Ngrep grep "<args>" -g "*.md" $NOTES_DIR
nnoremap <leader>ns :Ngrep

" Función para usar FZF en la creación de links dentro de archivos markdown
function! MakeMarkdownLink(file)
    "let filename = fnameescape(fnamemodify(a:file, ":t"))
    "why only the tail ?  I believe the whole filename must be linked unless everything is flat ...
    let filename = fnameescape(a:file)
    let filename_clean = fnamemodify(fnameescape(fnamemodify(a:file, ":t:r:s/^[0-9]*-//")), ":gs/-/ /")
     " Insert the markdown link to the file in the current buffer
    let mdlink = "[".filename_clean."](".filename.")"
    put=mdlink
endfunction
 
command! -nargs=1 MakeMarkdownLink :call MakeMarkdownLink(<f-args>)
nnoremap <c-m> :call fzf#run({'sink': 'MakeMarkdownLink'})<CR>

" Crear nuevas notas personales partiendo de una plantilla
function! MakeNewNote(...)
	let title = trim(join(a:000, ' '))
	let filenameTitle = fnamemodify(title, ":gs/ /-/")
	let dateTimeStr =  strftime("%Y%m%d%H%M")
	let fileName =$NOTES_DIR."/".dateTimeStr."-".filenameTitle.".md"
	echo fileName
	execute 'vsplit' fileName
	let template = $NOTES_DIR."/template-note.md"
	execute 'read' template
	silent execute '%s/{myTitle}/'.title.'/g'
	silent execute '%s/{Month}/'.strftime("%b").'/g'
	silent execute '%s/{Day}/'.strftime("%d").'/g'
	silent execute '%s/{year}/'.strftime("%Y").'/g'
	setf markdown
endfunction

command! -nargs=* NewNote call MakeNewNote(<f-args>)

" ----------------------------------------------------------------------------------------
" COC
" ----------------------------------------------------------------------------------------
" see more information about coc-clangd
" see more information about coc-cmake
" see more information about coc-phpls
let g:coc_node_path = '/usr/local/bin/node'
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-phpls', 'coc-cmake', 'coc-clangd', 'coc-marketplace', 'coc-tsserver', 'coc-sql', 'coc-sh', 'coc-css', 'coc-html' ]
let g:coc_disable_startup_warning = 1
let g:coc_config_home = '~/dotFiles/'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'Err:'
let g:airline#extensions#coc#warning_symbol = 'Warn:'
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
inoremap <expr><C-S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

" ----------------------------------------------------------------------------------------
"  CMake
" ----------------------------------------------------------------------------------------


" ----------------------------------------------------------------------------------------
"  NerdTree
" ----------------------------------------------------------------------------------------
nnoremap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['^.git$']
let NERDTreeStatusline="%{exists('b:NERDTree')?fnamemodify(b:NERDTree.root.path.str(), ':~'):''}"

" ----------------------------------------------------------------------------------------
"  Depuración con GDB dentro de Neovim
" ----------------------------------------------------------------------------------------
let g:loaded_nvimgdb = 1

" ----------------------------------------------------------------------------------------
"  C/C++ syntax highlight
" ----------------------------------------------------------------------------------------
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:syntastic_cpp_checkers = ['cpplint']
let g:syntastic_c_checkers = ['cpplint']
let g:syntastic_cpp_cpplint_exec = 'cpplint'
" The following two lines are optional. Configure it to your liking!
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:clang_format#code_style = 'Chromium'
let g:clang_format#command = '/usr/bin/clang-format-7'
let g:clang_format#detect_style_format = 1
let g:clang_format#auto_format_on_insert_leave = 1
nnoremap <Leader>f :<C-u>ClangFormat<CR>

