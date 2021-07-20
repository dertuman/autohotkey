#SingleInstance, force  ;Only one instance of script at the same time

ScriptStat := false
^+s::
	Suspend	; Make this hotkey immune to suspend, so it can Un-Suspend
	If ScriptStat
	{
		ScriptStat := false
		Tooltip, ACTIVE
    Sleep, 300
    Tooltip
		Suspend, Off
	} else {
		ScriptStat := true
		Tooltip, SUSPENDED
    Sleep, 300
    Tooltip
  }

;This converts the jkli into alt hotkeys without the need to toggle. 
;#: Windows
;!: Alt
;+:Shift
;^:Control
!i::Send,{PgUp}
!+i::Send,+{PgUp}
!^i::Send,^{PgUp}
!+^i::Send,^+{PgUp}
!k::Send,{PgDn}
!+k::Send,+{PgDn}
!^k::Send,^{PgDn}
!+^k::Send,+^{PgDn}
!l::Send,{End}
!+l::Send,+{End}
!^l::Send,^{End}
!+^l::Send,+^{End}
!j::Send,{Home}
!+j::Send,+{Home}
!^j::Send,^{Home}
!+^j::Send,+^{Home}

; Middle mouse button is enter in visual studio code
MButton::gosub, RemapMButon
RemapMButon:
IfWinActive, ahk_exe Code.exe
{
  Send, {Enter}
  Return
}
send, {MButton}

; ~CapsLock::
; KeyWait, CapsLock
; If (A_ThisHotkey = "~CapsLock") {
; if (toggle=1) {
;   SetCapsLockState, Off
;   tooltip, OFF
;   toggle=0
;   Sleep, 300
;   tooltip
;  }
;   else {
;   SetCapsLockState, On
;   toggle=1
;   ToolTip, ON
;   ControlGet, TTHWND, HWND,,,ahk_class tooltips_class32
;   ; Run tooltip update every 50ms
;   SetTimer, EE, 50
;   Return
;  }
; return
; }

CapsLock & i::
  If GetKeyState("Shift", "P")
		send +{up}  
	Else If GetKeyState("CapsLock", "P")  ; For some reason only one of these is needed to prevent unwanted firing. (Check else statement before "send {left}": Doesn't have it)
        ; SetCapsLockState, Off
		send {up}
return

CapsLock & j::
  If (GetKeyState("Control", "P") && GetKeyState("Shift", "P"))
  	send +^{left}
  Else If GetKeyState("Alt", "P")
    send ^{Left}  
  Else If GetKeyState("Shift", "P")
		send +{left}
	Else 
		send {left}
return

CapsLock & k::
	If GetKeyState("Shift", "P")
		send +{down}
  Else If GetKeyState("CapsLock", "P")
    send {down}
return

CapsLock & l::
  If (GetKeyState("Control", "P") && GetKeyState("Shift", "P"))
  	send +^{right}
  Else If GetKeyState("Alt", "P")
    send ^{Right}  
  Else If GetKeyState("Shift", "P")
		send +{right}
	Else 
		send {right}
return

CapsLock & g::
  loop, 2 {
    send {Click, WheelDown}
    sleep, 40
  }
return

CapsLock & t::
  loop, 2 {
    send {Click, WheelUp}
    sleep, 40
  }
return

CapsLock & n::
  If GetKeyState("CapsLock", "T") = 1 
    send {ñ}
  Else If GetKeyState("CapsLock", "T") = 0
    send {Ñ}
return

CapsLock & /::
    send {¿}
return

CapsLock & 1::
    send {¡}
return

; Alt tab configurations
LShift & Right::AltTab
LShift & Left::ShiftAltTab

; For google chrome developer tools quick access 
~LButton & RButton::
  send ^+{c}
return  

; Undo
CapsLock & z:: 
  send ^{z}
return

; Undo
CapsLock & y:: 
  send ^{y}
return

; Select all
CapsLock & a:: 
  send ^{a}
return
  
; Copy paste actions
CapsLock & c::
  send ^{c}
return

CapsLock & x::
  send ^{x}
return 

CapsLock & v::
  send ^{v}
return

CapsLock & 2::
  send ^{2}
return

CapsLock & 3::
  send ^{3}
return

CapsLock & 4::
  send ^{4}
return

CapsLock & 5::
  send ^{5}
return

; Refresh the browser
CapsLock & r::
  send ^{r}
return

; Search  
CapsLock & f::
  send ^{f}
return

; Select duplicate  
CapsLock & d::
  send ^{d}
return

; Search Replace
Capslock & h::
  send ^{h}
return

; Ctrl+alt+`
; Used to jump through breakpoints in VSCode (this shortcut must also be set in vs code in "keybindings.json") 
CapsLock & q::
  send ^!{x}
return




; ; If caps lock is toggled, send these hotkeys
; #If (toggle=1)
; i::Send,{Up}
; +i::Send,+{Up}
; ^i::Send,^{Up}
; +^i::Send,^+{Up}
; k::Send,{Down}
; +k::Send,+{Down}
; ^k::Send,^{Down}
; +^k::Send,+^{Down}
; l::Send,{Right}
; +l::Send,+{Right}
; ^l::Send,^{Right}
; +^l::Send,+^{Right}
; j::Send,{Left}
; +j::Send,+{Left}
; ^j::Send,^{Left}
; #l::Send,!{Right}
; #j::Send,!{Left}
; +^j::Send,+^{Left}

; m::^c
; ,::^v
; .::^x

; o::Send,{BackSpace}
; ^o::Send,^{BackSpace}
; !o::Send,!{BackSpace}
; p::Send,{Delete}
; ^p::Send,^{Delete}
; !p::Send,!{Delete}
; h::Send,{Enter}
; !h::Send,!{Enter}
; ^h::Send,^{Enter}
; u::Send,{Tab}
; +u::Send,+{Tab}
; ^u::Send,^{Tab}
; !u::Send,!{Tab}
; +^u::Send,+^{Tab}
; +!u::Send,+!{Tab}
; y::AppsKey
; +o::Send,!{Left}
; +p::Send,!{Right}
; [::Send,{Esc}

; ; Mouse actions
; a::
;    if (not GetKeyState("LButton", "P"))
;     Click down
; return
; a UP::Click up
; q::MouseClick, right
; g::MouseClick, WheelDown
; t::MouseClick, WheelUp
; z::MouseClick, middle
; +t::MouseClick, WheelLeft
; +g::MouseClick, WheelRight

; Tooltip follows mouse when ON
; EE:
;     Coordmode, ToolTip, Screen
;     Coordmode, Mouse, Screen
;     MouseGetPos,X,Y
;     WinMove, ahk_id %TTHWND%,,% x+10,% y+20
;     Return


; Make sure capslock is always in the correct state
; $CapsLock UP:: 
;   if (toggle=1) {
;   SetCapsLockState, Off
;   tooltip, OFF
;   toggle=0
;   Sleep, 300
;   tooltip
;  }
; return
