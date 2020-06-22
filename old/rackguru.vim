let s:rackguru_workspace = "~/workspace/rackguru-api/rackguru/"

" -------------------------
" General purpose functions
" -------------------------

" Search a pattern with vimgrep in Rackguru's python files
" --------------------------------------------------------
function! s:RGSearch(query)
    execute "vimgrep /" . a:query . "/ " . s:rackguru_workspace . "/**/*.py"
endfunction


" -----------------------
" Entity search functions
" -----------------------

" Search the definition of a class
" --------------------------------
function! s:RGSearchClassDef(classname)
    let l:query = 'class ' . a:classname . '('
    call s:RGSearch(l:query)
endfunction

" Search the definition of a function/method
" ------------------------------------------
function! s:RGSearchFunctionDef(funcname)
    let l:query = 'def ' . a:funcname . '('
    call s:RGSearch(l:query)
endfunction


" ---------------------------
" Interactive search function
" ---------------------------

" Search occurences of the selected item
" --------------------------------------
function! s:RGSearchCurrentItem()
    let l:item = expand('<cword>')
    call s:RGSearch(l:item)
endfunction

" Search the definition of the selected class
" -------------------------------------------
function! s:RGSearchCurrentClassDef()
    let l:classname = expand('<cword>')
    call s:RGSearchClassDef(l:classname)
endfunction

" Search the definition of the selected function
" ----------------------------------------------
function! s:RGSearchCurrentFunctionDef()
    let l:funcname = expand('<cword>')
    call s:RGSearchFunctionDef(l:funcname)
endfunction


" ------------------
" Command definition
" ------------------

" Search occurence in RackGuru's workspace
" ----------------------------------------
command! -nargs=1 RGfind call s:RGSearch(<f-args>)

" Search class definition: :RGclass <class-name>
" ----------------------------------------------
command! -nargs=1 RGclass call s:RGSearchClassDef(<f-args>)

" Search function/method definition: :RGdef <function-name>
" ---------------------------------------------------------
command! -nargs=1 RGdef call s:RGSearchFunctionDef(<f-args>)

" Search definition of class under cursor: ,fc
" --------------------------------------------
command! RGSearchCurrentItem call s:RGSearchCurrentItem()
nnoremap <Leader>ff :<C-U>RGSearchCurrentItem<CR>

" Search definition of class under cursor: ,fc
" --------------------------------------------
command! RGSearchCurrentClassDef call s:RGSearchCurrentClassDef()
nnoremap <Leader>fc :<C-U>RGSearchCurrentClassDef<CR>

" Search definition of function under cursor: ,fc
" -----------------------------------------------
command! RGSearchCurrentFunctionDef call s:RGSearchCurrentFunctionDef()
nnoremap <Leader>fd :<C-U>RGSearchCurrentFunctionDef<CR>
