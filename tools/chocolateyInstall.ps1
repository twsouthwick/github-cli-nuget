$packageName = 'github-hub'
$url = 'https://github.com/github/hub/releases/download/v2.2.0-rc1/hub-windows-386-2.2.0-rc1.tar.gz'
$url64 = 'https://github.com/github/hub/releases/download/v2.2.0-rc1/hub-windows-amd64-2.2.0-rc1.tar.gz'

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