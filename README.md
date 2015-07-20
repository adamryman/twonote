#twonote

Version controlled markdown notes plugin for vim.

Will not be fully functional until v0.1.0. Currently fleshing things out and everything is subject to change.

###Overview

twonote is a vim plugin that manages a git repo to version control your notes automatically. Eventually to be synced.

###Install

If you are using [Vundle](https://github.com/VundleVim/Vundle.vim) then you should add this to where you add your plugsins in your `.vimrc`

```
Plugin 'adamryman/twonote-vim'
```

###Configure

After `:PluginInstall` with vundle you should have a file `$HOME\.vim\bundle\twonote-vim\plugin\config.vim`

Edit this file and configure where you want your notes directory to be and set your remote git repo.

Without a remote git repo, pushing and pulling will not work and may cause errors.

For private notes your own repo or a private github repo works best.

###Usage

Call this only once to initialize a git repo in configured location (DEFAULT: $HOME/.vim/bundle/twonote/notes)

```
:TwoNoteInit
```

Used to start writing a new note

```
:TwoNote
```

Open file in _twonote_path and when saved it all will be added and commited

###TODO
- IMPORTANT: Not allow user to call `:TwoNote` before `:TwoNoteInstall`
- Delete notes that are empty
	- Also if a user creates a note and closes without writing it, that should not be in history
- Create an autocmd to auto write the file every 10 seconds, this will be configurable
- Create a way to view notes in reverse chronological order from twonote
- Create a way to grep/ack notes in reverse chronological order from twonote
- Create gui with note pane / search on left + editing pane on right
- Create rendering commands for a nice web view
- Render for Evernote
- Push to Evernote
- Render for OneNote
- Sync for OneNote

###LICENCE
This work is the public domain, see the LICENCE.md file for details
