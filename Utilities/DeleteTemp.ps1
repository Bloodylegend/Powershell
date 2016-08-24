#Clean C:\Windows\Temp
Get-Job | Remove-Job -Force
Clear-Host
# Get Computer names
$ComputerNames = Get-Content -Path "C:\Users\USERNAME\Desktop\DeleteTemp.txt"
#Clear temp Folder as a job
$Job = {
	param([string]$ComputerName)

    Remove-Item "\\$ComputerName\c$\windows\temp\*" -Recurse -verbose -ErrorAction SilentlyContinue 
}
#Loop through the computers and run the script block
foreach($ComputerName in $ComputerNames){
    Start-Job -ScriptBlock $Job -Name $ComputerName -ArgumentList $ComputerName
}

while((Get-Job | Where { $_.State -ne "Completed" -and $_.State -ne "Failed" } | Measure).Count -ne 0){
    Write-Host "Waiting for all jobs to complete"

    Start-Sleep 2
}

Clear-Host

Write-Host "All jobs complete, showing job list..."
Get-Job
