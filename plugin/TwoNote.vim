"Stuff for early dev
map <leader><leader>j :TwoNote<enter>

"Start plugin
command! TwoNote call TwoNote()

function! TwoNote()
		echo "test"
		echo strftime("%FT%T%z")
endfunction
