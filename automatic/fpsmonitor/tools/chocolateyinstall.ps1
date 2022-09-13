
$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'FPS Monitor*'
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  
  url            = 'https://www.fpsmon.com/bin/fpsmon-5440.exe'
  checksum       = '671df787b3f69a0a438f263032cb7553817110e04f6d90e064124c7a8a93921f'
  checksumType   = 'sha256'

  # MSI
  silentArgs    = "/silent /verysilent"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
