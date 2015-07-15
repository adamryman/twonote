"Stuff for early dev
map <leader><leader>j :TwoNote<enter>
map <leader><leader>k :call TwoNoteInit()<enter>

"Start plugin
command! TwoNote call TwoNote()

function! TwoNote()
		let _twonote_path="~/.vim/bundle/twonote/"

		let _twonote_datepath=strftime("%Y/%m/%d/")
		let _twonote_RFC3339=strftime("%FT%T%z")
		let _twonote_notepath = _twonote_path . _twonote_datepath . _twonote_RFC3339 . ".md"
		execute ":silent !mkdir -p " . _twonote_path  . _twonote_datepath
		execute ":redraw!"
		execute ":silent !touch " . _twonote_notepath
		execute ":redraw!"
		execute ":silent !cd " . _twonote_path . ";git add " . _twonote_notepath . ";git commit -m \"" . _twonote_RFC3339 . ".md created at " . strftime("%s") . "\""
	    execute ":redraw!"
endfunction

function! TwoNoteInit()
		"Both of these dont work for setting _twonote_path
		"execute ":call TwoNoteUtil()"
		"call TwoNoteUtil()
		"So I just set it directly
		let _twonote_path="~/.vim/bundle/twonote/"

		execute ":silent !cd " . _twonote_path . ";git init"
		execute ":redraw!"
endfunction

function! TwoNoteUtil()
		let _twonote_path="~/.vim/bundle/twonote/"
endfunction
