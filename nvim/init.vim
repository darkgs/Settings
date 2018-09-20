call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'davidhalter/jedi-vim' " A plugin for autocompletion of python
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'lervag/vimtex'
call plug#end()

set number
set ruler
set ts=4
set sw=4
set autoindent
set cindent
set smartindent
set visualbell
set hlsearch
syntax on
colorschem desert

nnoremap <C-h> :noh<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

"" Auto-complete
""" jedi setting
let g:jedi#show_call_signatures_delay = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#max_doc_height = 20
let g:jedi#auto_close_doc = 1
let g:jedi#goto_assignments_command = "<leader>pa"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "<leader>pk"
let g:jedi#usages_command = "<leader>pu"
let g:jedi#rename_command = "<leader>pr"

""" deoplete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#server_timeout = 100
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/local/bin/python3'

"" Vimtex with skim
let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_latexmk = {
		\ 'backend' : 'nvim',
		\ 'background' : 1,
		\ 'build_dir' : '',
		\ 'callback' : 1,
		\ 'continuous' : 1,
		\ 'executable' : 'latexmk',
		\ 'options' : [
		\   '-file-line-error',
		\   '-synctex=1',
		\   '-interaction=nonstopmode',
		\ ],
		\}

let g:vimtex_view_method = 'skim'
let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
function! UpdateSkim(status)
    if !a:status | return | endif

    let l:out = b:vimtex.out()
    let l:tex = expand('%:p')
    let l:cmd = [g:vimtex_view_general_viewer, '-r']
    if !empty(system('pgrep Skim'))
        call extend(l:cmd, ['-g'])
    endif
    if has('nvim')
        call jobstart(l:cmd + [line('.'), l:out, l:tex])
    elseif has('job')
        call job_start(l:cmd + [line('.'), l:out, l:tex])
    else
        call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    endif
endfunction


