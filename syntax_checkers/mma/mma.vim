if exists('g:loaded_syntastic_mma_checker')
  finish
endif
let g:loaded_syntastic_mma_checker = 1

if !exists('g:syntastic_mma_executable')
  let g:syntastic_mma_executable = 'mma'
endif

if !exists('g:syntastic_mma_arguments')
  let g:syntastic_mma_arguments = expand('%:p') . " -n"
endif
let s:save_cpo = &cpo

set cpo&vim

function! SyntaxCheckers_mma_mma_IsAvailable() dict
  if !executable(self.getExec())
    return 0
  endif
  return 1
endfunction

function! SyntaxCheckers_mma_mma_GetLocList() dict
  let makeprg = self.makeprgBuild({
        \ 'args': g:syntastic_mma_arguments,
        \ 'fname': '' })

  let errorformat =
        \ '%E%trror%.%#<Line %l> <File:%f>%m,' .
        \ '%Z%m,' .
        \ '%trror%.%#<Line %l%.%#File:%f> %m' 
		"\ '%Z%p^'  
		"\ '%-G%.%#'
		"\ '%E%trror%.%#<Line %l> <File:%f>   %m%#,' .
  let env = {
        \ 'SCRIPT_INPUT_FILE_COUNT': 1,
        \ 'SCRIPT_INPUT_FILE_0': expand('%:p'),
        \ }

  return SyntasticMake({
        \ 'makeprg': makeprg,
        \ 'errorformat': errorformat,
  		\ 'postprocess': ['compressWhitespace'],
        \ 'env': env })
endfunction

call g:SyntasticRegistry.CreateAndRegisterChecker({
    \ 'filetype': 'mma',
    \ 'exec': g:syntastic_mma_executable,
    \ 'name': 'mma' })

let &cpo = s:save_cpo
unlet s:save_cpo
