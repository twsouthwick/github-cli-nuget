$packageName = 'github-hub'
$url = 'https://github.com/github/hub/releases/download/v2.2.0-rc1/hub_2.2.0-rc1_windows_386.tar.gz'
$url64 = 'https://github.com/github/hub/releases/download/v2.2.0-rc1/hub_2.2.0-rc1_windows_amd64.tar.gz'

try {
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "$packageName"
  $file = Join-Path $tempDir "${packageName}Install"
  
  $checkSum = "";
  $checkSum64 = "";
  $checksumType64 = "";

  Install-ChocolateyZipPackage -packagename $packageName -url "$url" -url64bit "$url64" -unzipLocation $tempDir
  Get-ChocolateyUnzip -fileFullPath $file -destination "$installDir"
  
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}