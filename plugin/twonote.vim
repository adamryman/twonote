" Stuff for early dev
map <leader><leader>j :TwoNote<enter>
map <leader><leader>k :call TwoNoteInit()<enter>

source $HOME/.vim/bundle/twonote-vim/plugin/config.vim

" Start plugin
"autocmd BufReadPost $HOME/.vim/bundle/twonote-vim/notes/* :TwoNoteHook
augroup _twonote_init
autocmd!
execute "autocmd BufReadPost " . g:_twonote_path . "* :TwoNoteHook"
execute "autocmd BufReadPost " . g:_twonote_path . "* call TwoNotePre()"
"execute "autocmd BufDelete " . g:_twonote_path . "* call TwoNotePost()"
"execute "autocmd BufUnload " . g:_twonote_path . "* call TwoNotePost()"
"autocmd BufReadPre  g:_twonote_path . '*' call TwoNotePre()
"autocmd BufWritePost g:_twonote_path . '*' call TwoNotePost()
augroup END


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


		let _twonote_gitadd = "git add " . _twonote_note_path . ";"
		execute ":silent !cd " . g:_twonote_path . ";" . _twonote_gitadd . "git commit -m \"" . _twonote_RFC3339 . ".md created at " . strftime("%s") . "\""
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
		echom "DEBUGL TwoNoteHook()"
		let _twonote_note_path=expand('%:p')
		let _twonote_RFC3339_md=expand('%:t')
		let _twonote_gitadd = "git add " . _twonote_note_path . ";"
		let autoWriteCMD="! " . _twonote_gitadd . "git commit -m 'Updating " . _twonote_RFC3339_md . "'"
		execute ":autocmd BufWritePost " . _twonote_note_path . " :execute \"" . autoWriteCMD . "\""
		"execute "autocmd BufWritePost " . _twonote_note_path . " :execute 'redraw!'"
		execute "autocmd BufUnload " . g:_twonote_path . "* call TwoNotePost()"
endfunction

function! TwoNotePre()
	echo 'pulling notes... '
	execute ":silent ! cd " . g:_twonote_path
	let g:_twonote_message = system("cd " . g:_twonote_path . "; git pull")
	execute ":redraw!"
	echo g:_twonote_message
endfunction

function! TwoNotePost()
	echo 'pushing notes... '
	execute ":silent ! cd " . g:_twonote_path . "; git push"
	execute ":redraw!"
endfunction
