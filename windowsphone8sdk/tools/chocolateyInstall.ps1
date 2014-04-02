$packageName = 'WindowsPhone8SDK'
$installerType = 'EXE'
$url = 'http://download.microsoft.com/download/9/3/8/938A5074-461F-4E3D-89F4-5CE2F42C1E36/WPexpress_full.exe'
$silentArgs = '/Passive' # We're using /passive instead of /quiet so we can see progress, because this installer can take a really long time
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
