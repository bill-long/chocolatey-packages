#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

$packageName = 'logmein-rescue-console-desktop' # arbitrary name for the package, used in messages
$installerType = 'MSI' #only one of these: exe, msi, msu
$url = 'https://secure.logmeinrescue-enterprise.com/TechConsole/DesktopApp/Download.aspx' # download url
$silentArgs = '/quiet' # "/s /S /q /Q /quiet /silent /SILENT /VERYSILENT" # try any of these to get the silent installer #msi is always /quiet
$validExitCodes = @(0) #please insert other valid exit codes here, exit codes for ms http://msdn.microsoft.com/en-us/library/aa368542(VS.85).aspx

# main helpers - these have error handling tucked into them already
# installer, will assert administrative rights
# if removing $url64, please remove from here
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes
