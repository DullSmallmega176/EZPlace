#Requires AutoHotkey v2.0
#SingleInstance Force
toggle:=0
F1:: {
    global toggle^=1
    toggle?(Click("down"),ToolTip("on"),Sleep(500),ToolTip()):(Click("up"),ToolTip("off"),Sleep(500),ToolTip())
}
F2::Cleanup(),Reload()
F3::Cleanup(),ExitApp()
Up::toggle?DllCall("user32.dll\mouse_event","UInt", 0x0001,"Int",0,"Int",-1):Send("{Up}")
Down::toggle? DllCall("user32.dll\mouse_event","UInt", 0x0001,"Int",0,"Int",1):Send("{Down}")
Left::toggle? DllCall("user32.dll\mouse_event","UInt", 0x0001,"Int",-1,"Int",0):Send("{Left}")
Right::toggle? DllCall("user32.dll\mouse_event","UInt", 0x0001,"Int",1,"Int",0):Send("{Right}")
Cleanup()=>(Click("up"),Send("{Up up}{Down up}{Left up}{Right up}"))
