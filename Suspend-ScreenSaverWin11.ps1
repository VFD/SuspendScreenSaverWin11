<#
.SYNOPSIS
	Prevents the computer from being put to sleep.

.DESCRIPTION
	Starts the Notepad application, makes it active, and injects characters (.) through an infinite loop.
    Stop with CTRL+C or stop button if start with ISE.

    To be used after a command is issued that would take longer than the standby time.

.NOTES
    Author : Vincent Dubois

#>

# Start a Notepad Process
# To Do, need to be alone, or test for the empty one
# & mean another instance
#& Start-Process notepad.exe -PassThru
$notepad = Start-Process notepad.exe -PassThru

$process = $notepad.id

# Wait for Notepad
Start-Sleep -Seconds 1

#Show process ID
Write-Host $("Process: ", $process)
Write-Host $("To kill in CLI: Stop-Process -Id ", $process)

# Send Welcome message.
[System.Windows.Forms.SendKeys]::SendWait("`nPrevents the computer from being put to sleep.`n")
[System.Windows.Forms.SendKeys]::SendWait("`nNotepad process= $process`n")
[System.Windows.Forms.SendKeys]::SendWait("`nEnter in an infinite Loop!`n")
[System.Windows.Forms.SendKeys]::SendWait("Stop the process manually.`n`n")

# Counter for minutes
$theTimer = 0


do {
    $theTimer++
    for ($sec = 0; $sec -lt 60; $sec+=5) {
        # evry 5s show seconds
        [System.Windows.Forms.SendKeys]::SendWait("$sec.")
        Start-Sleep -Seconds 5
    }
    # each minute show it
    [System.Windows.Forms.SendKeys]::SendWait("`n")
    [System.Windows.Forms.SendKeys]::SendWait("$theTimer")
    [System.Windows.Forms.SendKeys]::SendWait(" minutes.`n")

}until(0)

