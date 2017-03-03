#!/usr/bin/env python

# chwall.py generates an Openbox pipe menu to allow the wallpaper to be changed.
# Author: kuad at ubuntuforums. 15 Jan 2006
#
# NOTE: gnome-settings-daemon MUST be running! If it isn't it won't work
#
# This script doesn't use any separate programs to set the wallpaper, but uses
# Gnome's existing ability to set the wallpaper. It isn't recursive so it will only
# find and list files that match extensions in the wallpaper_dir specified. It also
# can set a random wallpaper from that folder.
#
# USAGE:
# Remove the txt extension
# Put this script somewhere relevant; eg. ~/.config/openbox/scripts/
# Make the script executable; chmod +x chwall.py
# Change wallpaper_dir and extensions to suit you
# In your menu.xml somewhere near the top (inside the <openbox_menu> tags but 
# outside the root-menu), put the following entry:
# <menu id="chwall" label="Wallpaper" execute="~/.config/openbox/scripts/chwall.py" />
# Wherever you want the menu to show up, put: <menu id="chwall" />

import os, random

wallpaper_dir = '/usr/share/backgrounds/'
extensions = '.jpeg|.jpg|.png|.svg'
command = "feh --bg-scale"

def main():
	files = os.listdir(wallpaper_dir)
	files.sort()

	print "<openbox_pipe_menu>"
	
	for f in files:
		fullpath = os.path.join(wallpaper_dir, f)
		(path, fullname) = os.path.split(fullpath)
		(name, ext) = os.path.splitext(fullname)

		if ext in extensions:
			action = command + " \"%s\"" % fullpath
			print "  <item label=\"%s\">" % fullname
			print "    <action name=\"Execute\"><execute>%s</execute></action>" % action
			print "  </item>"

	wall = random.choice(files)
	action = command + " \"%s\"" % os.path.join(wallpaper_dir, wall)
	print "  <separator />"
	print "  <item label=\"Random\">"
	print "    <action name=\"Execute\"><execute>%s</execute></action>" % action
	print "  </item>"

	print "</openbox_pipe_menu>"

if __name__ == "__main__":
	main()
