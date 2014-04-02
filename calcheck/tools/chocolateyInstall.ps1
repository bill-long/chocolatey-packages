$packageName = 'calcheck'
$url = 'http://download.microsoft.com/download/3/B/7/3B7A0C99-29AB-4189-AC96-DE86B579C4D2/CalCheck_x86.zip'
$url64 = 'http://download.microsoft.com/download/3/B/7/3B7A0C99-29AB-4189-AC96-DE86B579C4D2/CalCheck_x64.zip'

$binRoot = Get-BinRoot
Write-Debug "Bin Root is $binRoot"
$installDir = Join-Path "$binRoot" "$packageName"

Install-ChocolateyZipPackage "$packageName" "$url" "$installDir" "$url64"
