#HotIf WinActive("ahk_exe PathofExile.exe")
#MaxThreadsPerHotkey 10
#SingleInstance Force
global x := 100
global y := 900
global vMyStatus := "OFF"

CoordMode "Tooltip", "Screen"
ToolTip vMyStatus, x, y

SetTimer TimerLoop, 1000
TimerLoop() {
	global vMyStatus, x, y	
	loop {
		if (WinActive("ahk_exe PathofExile.exe"))
		{
			if (vMyStatus = "SLEEP")
			{
				vMyStatus := "ON"
				CoordMode "Tooltip", "Screen"
				ToolTip vMyStatus, x, y
				myloop()
			}
		} else {
			if (vMyStatus = "ON") {
				vMyStatus := "SLEEP"
				CoordMode "Tooltip", "Screen"
				ToolTip vMyStatus, x, y
			}
		}
	}
}

myloop() {
	global vMyStatus, x, y
	CoordMode "Tooltip", "Screen"
	ToolTip vMyStatus, x, y
	loop {
		if (vMyStatus = "OFF")
		{
			exit
		}
		if (!WinActive("ahk_exe PathofExile.exe"))
		{
			vMyStatus := "SLEEP"
			CoordMode "Tooltip", "Screen"
			ToolTip "SLEEP", x, y
			Exit
		}
		Send "{t}"
		CoordMode "Tooltip", "Screen"
		ToolTip vMyStatus, x, y
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
