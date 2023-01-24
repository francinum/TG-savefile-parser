/mob
	icon = 'icons/mobs.dmi'
	icon_state = "player"


// /proc/get_dirlist(path) // Get the dir listing of a particular path
// 	var/randifier = rand(1,100)
// 	shell("dir [path] > dir.dirlist")
// 	return splittext(file2text("dir.dirlist"), "\n") //Return a list of directories

// /mob/verb/process_player_saves()
// 	// Recursively collect all savefiles.
// 	if(!shell())
// 		world << "SHELL UNAVAILABLE??"
// 		return
// 	var/list/savefile/collected_items = list()
// 	world << "Test"
// /*
// 	TG savefile tree structure is:
// 	a [STAGE1]
// 		aname [STAGE2]
// 			preferences.sav - the one we care about
// 			scars.sav - The one we do not care about
// 		anothername
// 	b
// 		bannedguy

// */
// 	for(var/firstchar in get_dirlist("player_saves")) //[STAGE1]
// 		var/list/username_dirs = get_dirlist("player_saves/[firstchar]")
// 		world << "Collected [username_dirs.len] firstchar directory names"
// 		for(var/uname in username_dirs) //[STAGE2]
// 			collected_items.Add(new/savefile("player_saves/[firstchar]/[uname]/preferences.sav"))
