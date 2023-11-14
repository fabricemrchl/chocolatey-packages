
$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'FPS Monitor*'
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  
  url            = 'https://www.fpsmon.com/bin/fpsmon-5472.exe'
  checksum       = '9b56449030e3f9059034035f7a5694ac5d9a8ef91589827ef7595fe7cc49bed6'
  checksumType   = 'sha256'

  # MSI
  silentArgs    = "/silent /verysilent"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
