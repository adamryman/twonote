"Stuff for early dev
map <leader><leader>j :TwoNote<enter>

"Start plugin
command! TwoNote call TwoNote()

function! TwoNote()
		echo "test"
		echo strftime("%FT%T%z")
		let _twonote_path="~/.vim/bundle/twonote/"
		let _twonote_datepath=strftime("%Y/%m/%d/")
		let _twonote_RFC3339=strftime("%FT%T%z")
		let _twonote_notepath = _twonote_path . _twonote_datepath . _twonote_RFC3339 . ".md"
		execute ":silent !mkdir -p " . _twonote_path  . _twonote_datepath
		execute ":redraw!"
		execute ":silent !touch " . _twonote_notepath
		execute ":redraw!"
endfunction
