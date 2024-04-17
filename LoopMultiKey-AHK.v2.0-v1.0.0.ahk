#MaxThreadsPerHotkey 15
#MaxThreadsBuffer True
#SingleInstance Force

;Tên ứng dụng auto hoạt động
global appName := "ahk_exe PathofExile.exe"
; KeyName: Phím cần loop, timeKey: Thời gian loop
global keyName1 := "1", timeKey1 := 1000
global keyName2 := "2", timeKey2 := 1000
global keyName3 := "3", timeKey3 := 1000
; Phím ON/OFF
global KeyLoop := "1"

global x := 100, y := 900
CoordMode "Tooltip", "Screen"
ToolTip "OFF", x, y

Hotkey KeyLoop " Up", TurnOnOff
TurnOnOff(ThisHotkey)
{
  static Toggle := false
  Toggle := !Toggle && WinActive(appName)
  ToolTip Toggle ? "ON" : "OFF", x, y
  SetTimer LoopKey1, timeKey1 > 0 && Toggle && WinActive(appName) ? timeKey1 : 0
  SetTimer LoopKey2, timeKey2 > 0 && Toggle && WinActive(appName) ? timeKey2 : 0
  SetTimer LoopKey3, timeKey3 > 0 && Toggle && WinActive(appName) ? timeKey3 : 0
  return
}

LoopKey1() 
{  
  Sleep Random(1,99)
  Send "{" keyName1 "}"
  return
}

LoopKey2() 
{
  Sleep Random(1,99)
  Send "{" keyName2 "}"
  return
}

LoopKey3() 
{
  Sleep Random(1,99)
  Send "{" keyName3 "}"
  return
}
