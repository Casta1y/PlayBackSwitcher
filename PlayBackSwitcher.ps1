# Get the current default device
$currentDefaultDevice = (Get-AudioDevice -List | Where-Object {$_.Default -eq $True -and $_.Type -eq "Playback"}).Name
# Get other non-default devices
$otherDevices = (Get-AudioDevice -List | Where-Object {$_.Default -ne $True -and $_.Type -eq "Playback"}).Name

# Check if there are other devices
if ($otherDevices.Count -ge 1) {
    # Switch to next device
    Set-AudioDevice -ID $($otherDevices[0])
}
else {
    Write-Host "Not enough audio devices to switch to"
}