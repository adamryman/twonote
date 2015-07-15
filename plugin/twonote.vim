"Stuff for early dev
map <leader><leader>j :TwoNote<enter>

"Start plugin
command! TwoNote call TwoNote()

function! TwoNote()
		echo "test"
		echo strftime("%FT%T%z")
		execute ":silent !mkdir -p ~/.vim/bundle/twonote/" . strftime("%Y") . "/" . strftime("%m") . "/" . strftime("%d")
		execute ":redraw!"
endfunction
