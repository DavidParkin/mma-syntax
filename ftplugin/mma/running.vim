if !exists("g:mma_command")
    let g:mma_command = "mma -P"
endif

if !exists("g:mma_command_groove")
    let g:mma_command_groove = "mma -V"
endif

function! MmaCompileAndRunFile()
    silent !clear
    execute "!" . g:mma_command . " " . bufname("%")
endfunction

function! MmaCompileAndTestGroove()
	let text = getline(".")
	echom text
	"set ignorecase
	if text =~ '\cdefgroove'
		silent !clear
		let groove = expand("<cword>")
		execute "!" . g:mma_command_groove . " " . bufname("%") . ":" . groove
	else
		" Here we test groove from within song file
		setlocal iskeyword+=.
		setlocal iskeyword+=:
		let groove = expand("<cword>")
		echom(groove)
		if groove !~ ":"
			"library
			silent !clear
			execute "!" . g:mma_command_groove . " " . groove

		else
			"make file name
			silent !clear
			execute "!" . g:mma_command_groove . " " . groove
			
		endif
	endif

	"let flags = "wce"    "wrap accept under cursor move to end of word
	"if search ("defgroove", flags) > 0
		"let text = getline(".")
		"echom text
		"let groove = strpart(text, 10)
          "silent !clear
        "execute "!" . g:mma_command_groove . " " . bufname("%") . ":" . groove
	"endif
endfunction

nnoremap <buffer> <localleader>r :call MmaCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>g :call MmaCompileAndTestGroove()<cr>
compiler mma
let b:match_words = '\<Begin\>:\<End\>'  
