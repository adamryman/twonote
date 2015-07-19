" Stuff for early dev
map <leader><leader>j :TwoNote<enter>
map <leader><leader>k :call TwoNoteInit()<enter>

source $HOME/.vim/bundle/twonote-vim/plugin/config.vim

" Start plugin
autocmd BufReadPost $HOME/.vim/bundle/twonote-vim/notes/* :TwoNoteHook
"autocmd BufReadPre $HOME/.vim/bundle/twonote-vim/notes/*


command! TwoNote call TwoNote()
command! TwoNoteHook call TwoNoteHook()
command! TwoNoteInit call TwoNoteInit()


function! TwoNote()
"		call TwoNoteUtil()
		let _twonote_datepath=strftime("%Y/%m/%d/")
		let _twonote_RFC3339=strftime("%FT%T%z")
		let _twonote_note_path = g:_twonote_path . _twonote_datepath . _twonote_RFC3339 . ".md"
		execute ":silent !mkdir -p " . g:_twonote_path  . _twonote_datepath
		execute ":redraw!"
		execute ":silent !touch " . _twonote_note_path
		execute ":redraw!"


		let _twonote_gitadd = "git add " . _twonote_notepath . ";"
		execute ":silent !cd " . g:_twonote_path
	   	execute	":silent ! " . _twonote_gitadd
	   	execute	":silent ! git commit -m \"" . _twonote_RFC3339 . ".md created at " . strftime("%s") . "\""
	    execute ":redraw!"
		execute ":e " . _twonote_note_path
endfunction

function! TwoNoteInit()
		"Both of these dont work for setting _twonote_path
		"execute ":call TwoNoteUtil()"
		"call TwoNoteUtil()
		"So I just set it directly

		execute ":silent !mkdir -p " . g:_twonote_path
		execute ":silent !cd " . g:_twonote_path
		execute ":silent !git init"
		execute ":silent !git remote set-url origin ". _notes_remotes
		execute ":silent !git pull"
		execute ":redraw!"
endfunction

function! TwoNoteUtil()
endfunction

function! TwoNoteHook()
		"call TwoNoteUtil()
		let _twonote_note_path=expand('%:p')
		let _twonote_RFC3339_md=expand('%:t')
		let _twonote_gitadd = "git add " . _twonote_note_path . ";"
		let autoWriteCMD="silent ! " . _twonote_gitadd . "git commit -m 'Updating " . _twonote_RFC3339_md . "'"
		execute ":autocmd BufWritePost " . _twonote_note_path . " :execute \"" . autoWriteCMD . "\""
		execute ":autocmd BufWritePost " . _twonote_note_path . " :execute 'redraw!'"
endfunction

function! TwoNotePre()

endfunction
