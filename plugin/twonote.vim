"Stuff for early dev
map <leader><leader>j :TwoNote<enter>
map <leader><leader>k :call TwoNoteInit()<enter>

"Start plugin
autocmd BufReadPost $HOME/.vim/bundle/twonote-vim/notes/* :TwoNoteHook

command! TwoNote call TwoNote()
command! TwoNoteHook call TwoNoteHook()
command! TwoNoteInit call TwoNoteInit()

function! TwoNote()
		let _twonote_path="$HOME/.vim/bundle/twonote-vim/notes/"

		let _twonote_datepath=strftime("%Y/%m/%d/")
		let _twonote_RFC3339=strftime("%FT%T%z")
		let _twonote_notepath = _twonote_path . _twonote_datepath . _twonote_RFC3339 . ".md"
		execute ":silent !mkdir -p " . _twonote_path  . _twonote_datepath
		execute ":redraw!"
		execute ":silent !touch " . _twonote_notepath
		execute ":redraw!"


		let _twonote_gitadd = "git add " . _twonote_notepath . ";"
		execute ":silent !cd " . _twonote_path . ";" . _twonote_gitadd . "git commit -m \"" . _twonote_RFC3339 . ".md created at " . strftime("%s") . "\""
	    execute ":redraw!"
		execute ":e " . _twonote_notepath
endfunction

function! TwoNoteInit()
		"Both of these dont work for setting _twonote_path
		"execute ":call TwoNoteUtil()"
		"call TwoNoteUtil()
		"So I just set it directly
		let _twonote_path="~/.vim/bundle/twonote-vim/notes/"

		execute ":silent !mkdir -p " . _twonote_path
		execute ":silent !cd " . _twonote_path . ";git init"
		execute ":redraw!"
endfunction

function! TwoNoteUtil()
		let _twonote_path="~/.vim/bundle/twonote-vim/notes/"
endfunction

function! TwoNoteHook()
		let _twonote_notepath=expand('%:p')
		let _twonote_RFC3339_md=expand('%:t')
		let _twonote_gitadd = "git add " . _twonote_notepath . ";"
		let autoWriteCMD="silent ! " . _twonote_gitadd . "git commit -m 'Updating " . _twonote_RFC3339_md . "'"
		execute ":autocmd BufWritePost " . _twonote_notepath . " :execute \"" . autoWriteCMD . "\""
		execute ":autocmd BufWritePost " . _twonote_notepath . " :execute 'redraw!'"
endfunction
