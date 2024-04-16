#MaxThreadsPerHotkey 10
#SingleInstance,Force
vStatus := "OFF"
myloop:
CoordMode, Tooltip, Screen
ToolTip %vStatus%, 100, 900
loop {
	if(vStatus == "OFF")
	{
		exit
	} 	
	if (!WinActive("Path of Exile")) 
	{		
		CoordMode, Tooltip, Screen 
		ToolTip  SLEEP, 100, 900
		sleep 100	
		continue	
	}			
	Send {t}
	CoordMode, Tooltip, Screen 
	ToolTip  %vStatus%, 100, 900		
	Random, randtimesleep, 1801, 1950 ; 
	sleep randtimesleep ;
}
return

^1 Up::
{	
	if (vStatus == "OFF")
	{		
		vStatus := "ON"				
	} else {
		vStatus := "OFF"		
	}	
	goto myloop		
}
return
