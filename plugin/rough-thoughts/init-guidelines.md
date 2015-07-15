#4note

##User Experience

:4note

- Command in vim will open the 4note application, could also be from command line
- Opens a new note, has a created at time and a last updated time. This information is stored and accessible, but only written at the end, to the bottom of the file. - Maybe as part of a configurable footer. - can be a markdown comment by default - but I want it to show up
- Pretty much just markdown
- Checks for buffer save every 10 seconds, saves if buffer has changed and commits.
	- Possibly make a new branch for every file that is open, switch to that branch on write, merge branch on exit
		-	That could get slow with a lot of branches
- Syncs with remote on exit or command?
- Easy to get notes in reverse chronological order for updated or created field
- easy to grep/ack through all notes and see in reverse chronological order

##Parts to build

- Need to make the file structure part of it. Unique name creation.
	- Just ISO8062? How about ISO8062_GUID that would work
		- ISO8062_GUID_Title.md



## Fast and Dirty

- File is just ISO8062.md
- Folder structure yyyy/mm/dd/ISO8062.md
- git add and commit on creation
- git commit on exit
	- git commit -m "Modification to ISO8062.md at @UTC
