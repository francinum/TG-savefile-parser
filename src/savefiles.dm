/proc/getallfiles(path, recursion = 1, listtype = "text") //"text" or "file"
	set background = 1
/*
	Returns a list of all files (as file objects) in the directory path provided, as well as all files in any subdirectories, recursively!
	The list returned is flat, so all items can be accessed with a simple loop.
	This is designed to work with browse_rsc(), which doesn't currently support subdirectories in the browser cache.
*/
	. = list()
	for(var/f in flist(path))
		if(copytext("[f]", -1) == "/")
			if(recursion)
				. += .("[path][f]")
		else
			if(listtype == "text")
				. += text("[path][f]")
			if(listtype == "file")
				. += file("[path][f]")

// Example that outputs all files in the game directory:
/client/verb/printdir()
	var/list/files = getallfiles(recursion = 0)
	// Since recursion is set to 0, files in any subfolders are not included.
	for(var/f in files)
		world << "[f]"

/client/verb/dumpallsavefiles()
	var/list/files = getallfiles("player_saves/", recursion = 2)
	// Since recursion is set to 0, files in any subfolders are not included.
	for(var/f in files)
		if(splittext(f,"/")[4] != "preferences.sav") //Something else?
			world << "SKIPPED: [f]"
			continue
		dumpsavefile(f) //Dump it to text
		world << "DUMPED: [f]"
	world << "DumpAll Completed Successfully"

/client/verb/dumpsavefile(savefile_path as text)
	var/list/textitems = splittext(savefile_path,"/") //playersaves, firstcar, username, file
	var/savefile/svf = new(savefile_path)
	svf.ExportText("/", "save_exports/[textitems[3]].savtext")