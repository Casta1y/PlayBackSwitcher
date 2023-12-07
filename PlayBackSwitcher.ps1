# Get the current default device
$currentDefaultDevice = (Get-AudioDevice -List | Where-Object {$_.Default -eq $True -and $_.Type -eq "Playback"}).Name
$currentDefaultDeviceIndex = (Get-AudioDevice -List | Where-Object {$_.Default -eq $True -and $_.Type -eq "Playback"}).Index
# Get other non-default devices
$AllDevices = (Get-AudioDevice -List | Where-Object {$_.Type -eq "Playback"}).Name
$AllDevicesID = (Get-AudioDevice -List | Where-Object {$_.Type -eq "Playback"}).ID

# Check if there are other devices
if ($AllDevicesID.Count -ge 2) {
    # Switch to next device
    Set-AudioDevice -ID $($AllDevicesID[$currentDefaultDeviceIndex % $AllDevices.Count])
}
else {
    Write-Host "Not enough audio devices to switch to"
}
