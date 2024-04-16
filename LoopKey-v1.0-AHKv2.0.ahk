#HotIf WinActive("ahk_exe PathofExile.exe")
#MaxThreadsPerHotkey 10
#SingleInstance Force

global vMyStatus := "OFF"

ToolTip vMyStatus, 100, 900

SetTimer TimerLoop, 1000
TimerLoop() {
	global vMyStatus
	loop {
		if (WinActive("ahk_exe PathofExile.exe"))
		{
			if (vMyStatus = "SLEEP")
			{
				vMyStatus := "ON"
				ToolTip vMyStatus, 100, 900
				myloop()
			}
		} else {
			if (vMyStatus = "ON") {
				vMyStatus := "SLEEP"
				ToolTip vMyStatus, 100, 900
			}
		}
	}
}

myloop() {
	global vMyStatus
	CoordMode "Tooltip", "Screen"
	ToolTip vMyStatus, 100, 900
	loop {
		if (vMyStatus = "OFF")
		{
			exit
		}
		if (!WinActive("ahk_exe Skype.exe"))
		{
			vMyStatus := "SLEEP"
			CoordMode "Tooltip", "Screen"
			ToolTip "SLEEP", 100, 900
			Exit
		}
		Send "{t}"
		CoordMode "Tooltip", "Screen"
		ToolTip vMyStatus, 100, 900
		sleep Random(1800, 1900)
	}
}


^1 Up::
{
	global vMyStatus
	if (vMyStatus = "OFF")
	{
		vMyStatus := "ON"
	} else {
		vMyStatus := "OFF"
	}
	myloop()
}