#twonote

Version controlled markdown notes plugin for vim.

###Overview

twonote is a vim plugin that manages a git repo to version control your notes automatically. Eventually to be synced.


###Usage

```
:TwoNoteInit
```

Call this only once to initialize a git repo in $HOME/.vim/bundle/twonote/notes

```
:TwoNote
```

Used to start writing a new note

```
:e $HOME/.vim/bundle/twonote/notes/*
```

Open file in $HOME/.vim/bundle/twonote/notes and when saved it all be added and commited

###TODO
- Create an autocmd to auto write the file every 10 seconds, this will be configurable
- Create a way to push the note repo from twonote
- Create a way to pull notes from repo from twonote
- Create a way to view notes in reverse chronological order from twonote
- Create a way to grep/ack notes in reverse chronological order from twonote
- Create gui with note pane / search on left + editing pane on right
- Create rendering commands for a nice web view
- Render for Evernote
- Push to Evernote
- Render for OneNote
- Sync for OneNote
