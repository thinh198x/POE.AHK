#MaxThreadsPerHotkey 15
#MaxThreadsBuffer True
#SingleInstance Force

global appName := "ahk_exe Skype.exe"
global x := 100, y := 900
CoordMode "Tooltip", "Screen"
MainGUI := Gui(, "Config")
MainGUI.AddText(, "Key ON/OFF")
MainGUI.AddText(, "Loop Key 1 ")
MainGUI.AddText(, "Loop Key 2 ")
MainGUI.AddText(, "Loop Key 3")
MainGUI.AddText(, "Loop Key 4")
MainGUI.AddHotkey("vChosenHotkey y1", "w10")
MainGUI.AddHotkey("vLoopKey1 xp")
MainGUI.AddHotkey("vLoopKey2")
MainGUI.AddHotkey("vLoopKey3")
MainGUI.AddHotkey("vLoopKey4")
MainGUI.AddText("ym3", "Time Loop")
MainGUI.AddEdit("w60")
MainGUI.AddUpDown("vTimeLoopKey1 Range0-60000", 0)
MainGUI.AddEdit("w60")
MainGUI.AddUpDown("vTimeLoopKey2 Range0-60000", 0)
MainGUI.AddEdit("w60")
MainGUI.AddUpDown("vTimeLoopKey3 Range0-60000", 0)
MainGUI.AddEdit("w60")
MainGUI.AddUpDown("vTimeLoopKey4 Range0-60000", 0)
MainGUI.AddButton("Section Center xs w250", "Save & Run").OnEvent("Click", SaveConfig)
MainGUI.OnEvent("Close", SaveConfig)
MainGUI.Show()

SaveConfig(*)
{
  global keyName1, keyName2, keyName3, keyName4
  global timeKey1, timeKey2, timeKey3, timeKey4
  Saved := MainGUI.Submit()
  keyName1 := Saved.LoopKey1
  keyName2 := Saved.LoopKey2
  keyName3 := Saved.LoopKey3
  keyName4 := Saved.LoopKey4

  timeKey1 := Saved.TimeLoopKey1
  timeKey2 := Saved.TimeLoopKey2
  timeKey3 := Saved.TimeLoopKey3
  timeKey4 := Saved.TimeLoopKey4
  ToolTip "OFF", x, y
  Hotkey Saved.ChosenHotkey " Up", TURN_ON_OFF
  MainGUI.Hide()
}

TURN_ON_OFF(ThisHotkey)
{
  static Toggle := false
  Toggle := !Toggle && WinActive(appName)
  ToolTip Toggle ? "ON" : "OFF", x, y
  SetTimer LoopKey1, Toggle ? timeKey1 : 0
  SetTimer LoopKey2, Toggle ? timeKey2 : 0
  SetTimer LoopKey3, Toggle ? timeKey3 : 0
  SetTimer LoopKey4, Toggle ? timeKey4 : 0
  return
}

Hotkey "^!f Up", ShowGUI
ShowGUI(MyHotKey)
{
  MainGUI.Restore()
}

LoopKey1()
{
  Sleep Random(1, 99)
  Send "{" keyName1 "}"
  return
}

LoopKey2()
{
  Sleep Random(1, 99)
  Send "{" keyName2 "}"
  return
}

LoopKey3()
{
  Sleep Random(1, 99)
  Send "{" keyName3 "}"
  return
}

LoopKey4()
{
  Sleep Random(1, 99)
  Send "{" keyName4 "}"
  return
}