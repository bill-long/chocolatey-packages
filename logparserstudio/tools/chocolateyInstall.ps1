try {
  $packageName = 'logparserstudio'
  $binRoot = Get-BinRoot
  Write-Debug "Bin Root is $binRoot"
  $installDir = Join-Path "$binRoot" "$packageName"
  $url = 'http://gallery.technet.microsoft.com/Log-Parser-Studio-cd458765/file/53920/5/LPSV2.D2.zip'

  Install-ChocolateyZipPackage $packageName $url $installDir

  Write-ChocolateySuccess 'logparserstudio'
} catch {
  Write-ChocolateyFailure 'logparserstudio' $($_.Exception.Message)
  throw
}
