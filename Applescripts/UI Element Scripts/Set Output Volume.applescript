(*
Set Output Volume

This script uses UI element scripting to show how to change the sound
output volume using the Sound System Preference.

If "Enable access for assistive devices" is not checked,
this script will open the Universal Access System Preference and ask
the user to check the checkbox.

Copyright © 2007 Apple Inc.

You may incorporate this Apple sample code into your program(s) without
restriction.  This Apple sample code has been provided "AS IS" and the
responsibility for its operation is yours.  You are not permitted to
redistribute this Apple sample code as "Apple sample code" after having
made changes.  If you're going to redistribute the code, we require
that you make it clear that the code was descended from Apple sample
code, but that you've made changes.
*)

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.sound"
end tell

tell application "System Events"
	if UI elements enabled then
		tell slider 1 of group 1 of window 1 of process "System Preferences"
			if value is 0.5 then
				set value to 0.8
			else
				set value to 0.5
			end if
		end tell
	else
		tell application "System Preferences"
			activate
			set current pane to pane "com.apple.preference.universalaccess"
			display dialog "UI element scripting is not enabled. Check \"Enable access for assistive devices\""
		end tell
	end if
end tell