#maxThreadsPerHotkey, 2

IfNotExist, %A_ScriptDir%\bin\w.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\a.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\s.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin\d.png
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
IfNotExist, %A_ScriptDir%\bin
{
    msgbox,, file missing,Look like you didn't extract file,3
    ExitApp 
}
MsgBox, 4,, Stamina or RunningSpeed? (press Yes for Stamina or No for RunningSpeed)
IfMsgBox Yes
{
    tread = false
}
else
{
	tread = true
}

InputBox, level, Treadmill Level, Please enter level., , 200, 150
if ErrorLevel = 1
{
	ExitApp
}

If not (level = "1" or level = "2" or level = "3" or level = "4" or level = "5")
{
    tooltip, Look like level %level% not exist in this version of macro
    SetTimer, removetooltip, -3000
    return
}

InputBox, logs,Auto Leave, how many tread you want to do?`nPlease enter Number., , 400, 150

MsgBox, 4, Stamina Detection
IfMsgBox Yes
{
	detect = true
}
Else
{
	detect = false
}
MsgBox, 0,Tutorial, F1 for activate macro. END for Stop, 3

if WinExist("Roblox") {
	WinActivate
	CenterWindow("ahk_exe RobloxPlayerBeta.exe")
}
CenterWindow(WinTitle)
{	
	WinGetPos,,, Width, Height, %WinTitle%
	WinMove, %WinTitle%,,, 400, 400
}




removetooltip()
{
	ToolTip
}

end::Reload

F1::
macro_on := !macro_on
if (macro_on)
{	
	CoordMode , Pixel, Window
	Loop ,
	{	   
		CoordMode , Click, Window
		toolTip, %A_Index%
		SetTimer, removetooltip, -3000
		if tread = true ; rs
		{
			Click , 520, 310
			Click , 520, 311
			Sleep 1000
		}
		if tread = false ; stam
		{
			Click , 290, 310
			Click , 290, 311
			Sleep 1000
		}

		if level = 5
		{
			Click , 340, 370
			Click , 340, 371
			Sleep 200
		}
		if level = 4
		{
			Click , 340, 340
			Click , 340, 341
			Sleep 200
		}
		if level = 3
		{
			Click , 340, 310
			Click , 340, 311
			Sleep 200
		}
		if level = 2
		{
			Click , 340, 280
			Click , 340, 281
			Sleep 200
		}
		if level = 1
		{
			Click , 340, 250
			Click , 340, 251
			Sleep 200
		}
		Sleep 100
		Click , 410, 355
		Click , 410, 351
		Sleep 3000
		StartTime := A_TickCount
		Loop ,
		{			
			CoordMode , Pixel, Window
			CoordMode , Click, Window
			SetBatchLines, -1
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\w.png
			if (errorlevel = 0)
			{				
				Send w
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\a.png
			if (errorlevel = 0)
			{				
				Send a
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\s.png
			if (errorlevel = 0)
			{				
				Send s
			}			
			ImageSearch , FoundX, FoundY, 200, 240, 600, 300, *50 %A_ScriptDir%\bin\d.png
			if (errorlevel = 0)
			{				
				Send d
			}
			if detect = true
			{
				PixelSearch , x, y, 30, 130, 40, 133, 0x3A3A3A, 40, Fast
				If ErrorLevel = 0
				{				
					;Loop,
					;{
					;Sleep 100
					;} Until A_TickCount - StartTime > 60000
Sleep 9000
				}	
			}
		} Until A_TickCount - StartTime > 60000
		PixelSearch , x, y, 70, 144, 75, 146, 0x3A3A3A, 40, Fast
		If ErrorLevel = 0
		{
			Sleep 5000
			Sendinput, 1234567890
			Sleep 300
			time := A_TickCount
			Loop, ; Eating part
			{
				Click, 400, 610, 10
				Sleep 100
				PixelSearch, x, y, 119, 144, 110, 146, 0x3A3A3A, 40, Fast ; full hunger
				If ErrorLevel = 1
				{
					Break
				}
				ImageSearch, x, y, 60, 515, 760, 600, *20 %A_ScriptDir%\bin\equip.png ;if not found equiped slot /and still not full hunger
				If ErrorLevel = 1
				{
					Break
				}
			} Until A_TickCount - time > 60000
			Send {BackSpace}
			
		}
		StartTime2 := A_TickCount
		Loop ,
		{			
			Click , 409, 296
			Click , 409, 295
		} Until A_TickCount - StartTime2 > 4000
			
		if A_Index = %logs%
		{			
			Send !{f4}
			ExitApp
		}		
		StartTime4 := A_TickCount
		Loop,
		{			
			Sleep 100
			PixelSearch , x, y, 249, 129, 250, 130, 0x3A3A3A, 40, Fast
			If ErrorLevel = 1
			{				
				Break
			}		
		} Until A_TickCount - StartTime4 > 17000
	}
}
else
{	
	ExitApp
}
Return
