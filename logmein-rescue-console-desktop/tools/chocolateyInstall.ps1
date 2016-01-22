$packageName = 'logmein-rescue-console-desktop'
$installerType = 'MSI'
$url = 'https://secure.logmeinrescue.com/TechConsole/DesktopApp/Download.aspx'
$silentArgs = '/quiet'
$validExitCodes = @(0) 

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
