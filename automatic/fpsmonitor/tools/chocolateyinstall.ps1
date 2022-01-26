
$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'FPS Monitor*'
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  
  url            = 'https://www.fpsmon.com/bin/fpsmon-5420.exe'
  checksum       = 'ddad0bf00956aa1c6c4c34f9c89baae558f7fe3e05b92ee829c88fa0b21e4dbc'
  checksumType   = 'sha256'

  # MSI
  silentArgs    = "/silent /verysilent"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
