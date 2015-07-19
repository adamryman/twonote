" Remote repo for notes
let _notes_remotes="git@github.com:adamryman/twonote-notes.git"

" Folder path to notes folder (does not have to exist)
" _twonote_path MUST be full path, _twonote_user_home allows us to get the
" full home path for any user
let _twonote_user_home = $HOME
let _twonote_path= _twonote_user_home . "/.vim/bundle/twonote-vim/notes/"
