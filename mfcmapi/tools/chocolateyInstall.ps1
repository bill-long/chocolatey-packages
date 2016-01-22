try {
  $packageName = 'mfcmapi'
  $binRoot = Get-BinRoot
  Write-Debug "Bin Root is $binRoot"
  $installDir = Join-Path "$binRoot" "$packageName"

  # We're going to copy both the 32-bit and 64-bit executables, because
  # the bitness of Outlook won't necessarily match the bitness of the
  # OS.
  
  # These links map to September 2015 Release, build 15.0.0.1043
  $x86Url = 'http://mfcmapi.codeplex.com/downloads/get/1482127'
  $x64Url = 'http://mfcmapi.codeplex.com/downloads/get/1482129'

  $x86InstallDir = Join-Path "$installDir" "x86"
  $x64InstallDir = Join-Path "$installDir" "x64"
  
  Install-ChocolateyZipPackage ($packageName + " 32 bit") $x86Url $x86InstallDir
  Install-ChocolateyZipPackage ($packageName + " 64 bit") $x64Url $x64InstallDir

  Write-ChocolateySuccess 'mfcmapi'
} catch {
  Write-ChocolateyFailure 'mfcmapi' $($_.Exception.Message)
  throw
}
