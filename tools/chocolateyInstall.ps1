$packageName = 'github-hub'
$url = 'https://github.com/github/hub/releases/download/v2.2.1/hub-windows-386-2.2.1.tar.gz'
$url64 = 'https://github.com/github/hub/releases/download/v2.2.1/hub-windows-amd64-2.2.1.tar.gz'

try {
  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $file = Join-Path $installDir "${packageName}.tar.gz"
  
  Get-ChocolateyWebFile $packageName $file $url $url64
  
  # File is in tar.gz format so use 7z to extract and decompress
  Start-Process "cmd" -ArgumentList "/c 7z x `"$file`" -so | 7z x -aoa -si -ttar -o`"$installDir`"" -Wait
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}
