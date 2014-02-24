Opt('WinDetectHiddenText', 1)
;Path and filename of the installer executable
$APPTOINSTALL="""" & $CmdLine[1] & """"
Run($APPTOINSTALL)
If @error <> 0  Then 
	MsgBox(0, "Run failed", "The ""Run"" command failed for " & $APPTOINSTALL & " /S - exiting", 5)
	Exit
EndIf

$begin = TimerInit()
While 1
	If WinActive("End-User License Agreement") Then
		ControlClick("End-User License Agreement","","[TEXT:Agree]")
	ElseIf WinActive("[REGEXPTITLE:Source Insight .* Installation .*]") Then
		If ControlClick("[REGEXPTITLE:Source Insight .* Installation .*]","","[TEXT:&Next >]") == 0 Then
			ControlClick("[REGEXPTITLE:Source Insight .* Installation .*]","","[TEXT:&Finish]")
		EndIf
	ElseIf WinActive("[REGEXPTITLE:Source Insight .* Installation]") Then
		If ControlClick("[REGEXPTITLE:Source Insight .* Installation]","","[TEXT:&Next >]") == 0 Then
			ControlClick("[REGEXPTITLE:Source Insight .* Installation]","","[TEXT:&Finish]")
		EndIf
	ElseIf WinActive("Backup Replaced Files") Then
		ControlClick("Backup Replaced Files","","[TEXT:&Next >]")
	ElseIf WinActive("Select Components") Then
		ControlClick("Select Components","","[TEXT:&Next >]")
	ElseIf WinActive("[REGEXPTITLE:Source Insight .* Trial License]") Then
		ControlClick("[REGEXPTITLE:Source Insight .* Trial License]","","[TEXT:Exit]")
	ElseIf WinActive("Recovery Alert!") Then
		ControlClick("Recovery Alert!", "", "[TEXT:Quit]")
	ElseIf WinActive("Source Insight") Then
		If ControlClick("Source Insight","","[Text:&No]") Then
			ExitLoop
		EndIf
	EndIf
	If TimerDiff($begin)/1000 > 180 Then
		MsgBox(0, "Timed out", "Timed out waiting for Source Insight installer. The application may not have installed successfully. Exiting.", 5)
		ExitLoop
	Else
		Sleep(250)
	EndIf
WEnd

;Installation complete
Exit