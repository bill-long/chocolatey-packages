$packageName = 'OffCAT'
$binRoot = Get-BinRoot
Write-Debug "Bin Root is $binRoot"
$installDir = Join-Path "$binRoot" "$packageName"

# OffCAT has multiple files. Get em all.
# First, install the zip
$url = 'http://download.microsoft.com/download/5/F/D/5FD540BF-5AC6-4261-895F-676B38AA8406/OffCAT.zip'
Install-ChocolateyZipPackage "$packageName" "$url" "$installDir"

# Next, get the rules list
$url = 'http://download.microsoft.com/download/5/F/D/5FD540BF-5AC6-4261-895F-676B38AA8406/OffCAT_rules_list_March2014.xlsx'
$fileName = 'OffCAT_rules_list_March2014.xlsx'
Get-ChocolateyWebFile "$packageName rules file" (Join-Path $installDir $fileName) "$url"

# Now get the adm file
$url = 'http://download.microsoft.com/download/5/F/D/5FD540BF-5AC6-4261-895F-676B38AA8406/OffCATv12.adm'
$fileName = 'OffCATv12.adm'
Get-ChocolateyWebFile "$packageName adm file" (Join-Path $installDir $fileName) "$url"

# Finally, the readme
$url = 'http://download.microsoft.com/download/5/F/D/5FD540BF-5AC6-4261-895F-676B38AA8406/ReadMe_OffCATv1.2.docx'
$fileName = 'ReadMe_OffCATv1.2.docx'
Get-ChocolateyWebFile "$packageName readme file" (Join-Path $installDir $fileName) "$url"