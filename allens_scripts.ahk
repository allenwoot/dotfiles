#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

+Capslock::Capslock
Capslock::Ctrl

!1::
  Send allenwoot@gmail.com
Return

!2::
  Send allen@allenwoot.com
Return

!l::
  Send ^l
Return

!c::
  Send ^c
Return

!v::
  Send ^v
Return

!x::
  Send ^x
Return

!z::
  Send ^z
Return

!+z::
  Send ^+z
Return

!s::
  Send ^s
Return

!t::
  Send ^t
Return

!w::
  Send ^w
Return

!+]::
  Send ^`t
Return

!+[::
  Send ^+`t
Return

!+t::
  Send ^+t
Return

!f::
  Send ^f
Return

![::
  Send !{Left}
Return

!]::
  Send !{Right}
Return

!r::
  Send ^r
Return

!a::
  Send ^a
Return

!+^n::
  Send {Media_Next}
Return

!+p::
  Send {Media_Prev}
Return

!Space::
  Send ^{Esc}
Return

^[::
  Send {Esc}
Return

!Backspace::
  Send {Home}{Shift Down}{End}{Shift Up}{Backspace 2}
Return

#Backspace::
  Send ^+{Left}{Backspace}
Return

!i::
Sleep 50
  PostMessage, 0x50, 2, 0,, A ; 0x50 is WM_INPUTLANGCHANGEREQUEST
Return

!n::
  Send ^n
Return

!+n::
  Send ^+n
Return

!j::
  Send {Down}
Return

!k::
  Send {Up}
Return