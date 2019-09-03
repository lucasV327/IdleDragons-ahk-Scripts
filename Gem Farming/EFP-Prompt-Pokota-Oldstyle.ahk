; this is designed around farming GRAND TOUR OF THE SWORD COAST - MAD WIZARD
; the framework can be reused for other campaigns

CoordMode, Mouse, Client

target = IdleDragons.exe

Gui, Add, text, , DUE TO THE NATURE OF EVENTS, THIS SCRIPT NEEDS TO BE MANUALLY ADJUSTED
Gui, Add, text, , The keystroke to start this script is WIN+R`nThis does not change your active patron.
Gui, Add, text, , You'll need to change the waterdeep_x and waterdeep_y variables yourself.`nYou'll also need to change Line 112 to which Year you need.
Gui, Add, text, , In the map, enable Hide Locked and Hide Completed.`nIn the adventure, set your level strategy to "UPG".
Gui, Add, text, , This script will load your 3rd saved formation, using the E hotkey.
Gui, Add, text, , This script assumes you have Deekin, Gromma, Krond.`nThis script also assumes you have at least four familiars.
Gui, Add, text, , Minutes per run (starts from setting last familiar):
Gui, Add, Edit, vDduration_in_minutes
Gui, Add, Button, default, OK
Gui, Show
Return

GuiClose:
ButtonOK:
Gui, Submit 

duration_in_ms := (Dduration_in_minutes * 60 * 1000)

reset_yes_x = 550
reset_yes_y = 525

go_to_map_x = 650
go_to_map_y = 600

campaigns_x = 105
torm_y = 100
kelv_y = 170
helm_y = 240
eventy = 310

neverwinter_x = 500
neverwinter_y = 685

waterdeep_x = 645
waterdeep_y = 385

adventures_x = 400
pan_top_y = 110
pan_bot_y = 600
ror_fp_y = 90 ; Ring of Regeneration free play
mw_fp_y = 180 ; Mad Wizard free play
y1_fp_y = 90 ; Year 1 Event Free Play
y2_fp_y = 180 ; Year 2 Event Free Play

go_x = 800
go_y = 580

fam_box_x = 670
fam_box_y = 540

fam_out_x = 945
fam_in_x = 875
fam_far_x = 1015

fam_top_out_y = 260
fam_top_in_y = 330
fam_bot_in_y = 395
fam_bot_out_y = 465

upgrade_y = 700
swap_y = 580
click_x = 155
slot1_x = 245
slot1u_x = 335


shop_x = 75
shop_y = 85

spec2_choice_left = 500
spec2_choice_right = 750
spec3_choice_left = 390
spec3_choice_middle = 635
spec3_choice_right = 885
spec3_choice_y = 575
spec3_cancel_x = 890
spec3_cancel_y = 110

charsheet_cancel_x = 1100
charsheet_cancel_y = 130

#r::
Loop
{
	; RESET
	ControlFocus,, ahk_exe %target% ;
	ControlSend,, {r}, ahk_exe %target% ;
	Sleep, 1000 ;
	Click %reset_yes_x%, %reset_yes_y% ;
	Sleep, 20000 ;
	Send ^+h ; Take a screenshot with ShareX of the results screen. If you don't have ^+h set for ShareX, remove this line and the next sleep
	Sleep, 3000 ;
	ControlFocus,, ahk_exe %target% ;
	Click %go_to_map_x%, %go_to_map_y% ;
	Sleep, 2000 ;
	Click %campaigns_x%, %torm_y% ; Switch to Tomb of Annihilation...
	Sleep, 200 ;
	Click %campaigns_x%, %eventy% ; ...and then back to Grand Tour (to reset the map)
	Sleep, 200 ;
	Click %waterdeep_x%, %waterdeep_y% ; The location marker for Mad Wizard
	Sleep, 1000 ;
	Click %adventures_x%, %pan_top_y%, down
	Sleep, 300 ;
	Click %adventures_x%, %pan_bot_y%, up
	Sleep, 300 ;
	Click %adventures_x%, %y2_fp_y% ; Mad Wizard Free Play marker
	Sleep, 200 ;
	Click %go_x%, %go_y%
	Sleep, 7500 ;
	ControlSend,, {e}, ahk_exe %target% ; I have my Saved Formation #3 set to quickly tear through the orb on Z14. I suggest you do the same.
	
	Sleep, 1000
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100 
	Click %fam_far_x%, %fam_top_in_y%
	Sleep, 100
	Click %fam_out_x%, %fam_top_out_y%
	Sleep, 100
	Click %fam_in_x%, %fam_top_in_y%
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	
	
	Sleep, 3000
	
	Loop 9
	{
		Sleep, 100
		Click %slot1_x%, %upgrade_y% ;Deekin is eight upgrades off of Confidence in the Boss, requiring no Spec choice
	}
	Sleep, 100
	
	Click 360, %upgrade_y% ;Celeste
	Sleep, 100
	
	Loop 10
	{
		Sleep, 100
		Click 475, %upgrade_y% ; Gromma's spec choice (Mountain) helps her as tank
	}
	Sleep, 1000
	Click %spec3_choice_left%, %spec3_choice_y%
	Sleep, 1000
	Click %charsheet_cancel_x%, %charsheet_cancel_y%
	Sleep, 100
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100
	Click 475, %upgrade_y% ; We've taken Gromma's spec choice, so we can put a familiar on her.
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	
	Click 590, %upgrade_y% ;Ishi
	Sleep, 100
	
	Loop 8
	{
		Click 705, %upgrade_y% ;Calliope
		Sleep, 100
	}	
	Sleep, 1000
	Click %spec2_choice_right%, %spec3_choice_y%
	Sleep, 1000
	Click %charsheet_cancel_x%, %charsheet_cancel_y%
	Sleep, 100
	
	Loop 3
	{
		Sleep, 100
		Click 820, %upgrade_y% ; Krond is two upgrades off of Fire Bolt, requiring one 3spec choice (right)
	}	
	Sleep, 1000
	Click %spec3_choice_right%, %spec3_choice_y%
	Sleep, 1000
	Click %charsheet_cancel_x%, %charsheet_cancel_y%
	Sleep, 100
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100
	Click 820, %upgrade_y% ; We've taken Krond's spec choice, so we can put a familiar on him.
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	
	Click 935, %upgrade_y% ; Vlahnya
	Sleep, 100
	
	Loop 8
	{
		Click 1050, %upgrade_y% ; Hitch
		Sleep, 100
	}
	
	Sleep, 1000
	Click %spec2_choice_right%, %spec3_choice_y%
	Sleep, 1000
	Click %charsheet_cancel_x%, %charsheet_cancel_y%
	Sleep, 100
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100
	Click 1050, %upgrade_y% ; Hitch
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%	
	
	; Now we place our remaining familiars - we defer this to reduce number of variables in the champ upgrade process
	ControlSend,, {f down}, ahk_exe %target%
	Sleep, 100
	Click %click_x%, %upgrade_y%
	Sleep, 100
	Click %fam_in_x%, %fam_bot_in_y%
	Sleep, 100
	Click %fam_out_x%, %fam_bot_out_y%
	Sleep, 100
	Click %fam_far_x%, %fam_bot_in_y%
	Sleep, 100
	ControlSend,, {f up}, ahk_exe %target%
	Sleep, 1000
	
	ControlSend,, {e}, ahk_exe %target% 
	Sleep, %duration_in_ms%
}