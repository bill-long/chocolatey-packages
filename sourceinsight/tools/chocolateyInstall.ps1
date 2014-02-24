try {
  $scriptDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $installerFile = Join-Path $scriptDir 'sourceinsight.au3'

  $tempDir = "$env:TEMP\chocolatey\sourceinsight"
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
  $file = Join-Path $tempDir "Si3572Setup.exe"
  Get-ChocolateyWebFile 'sourceinsight' "$file" 'http://www.sourceinsight.com/distribute/Si3572Setup.exe'
  
  write-host "Installing `'$file`' with AutoIt3 using `'$installerFile`'"
  $installArgs = "/c autoit3 `"$installerFile`" `"$file`""
  Start-ChocolateyProcessAsAdmin "$installArgs" 'cmd.exe'
  sleep(5)
  Write-ChocolateySuccess 'sourceinsight'
} catch {
  Write-ChocolateyFailure 'sourceinsight' "$($_.Exception.Message)"
  throw 
}