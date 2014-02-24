try {
  $packageName = 'mailboxlogparser'
  $binRoot = Get-BinRoot
  Write-Debug "Bin Root is $binRoot"
  $installDir = Join-Path "$binRoot" "$packageName"
  $url = 'https://mailboxlogparser.codeplex.com/downloads/get/742261'
  
  Install-ChocolateyZipPackage $packageName $url $installDir

  Write-ChocolateySuccess 'mailboxlogparser'
} catch {
  Write-ChocolateyFailure 'mailboxlogparser' $($_.Exception.Message)
  throw
}
