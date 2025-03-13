
$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'FPS Monitor*'
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  
  url            = 'https://www.fpsmon.com/bin/fpsmon-5510.exe'
  checksum       = 'c86b75493b2e416e3135aaa14be8d21a00cbafad95ed904d9803715ef752c77a'
  checksumType   = 'sha256'

  # MSI
  silentArgs    = "/silent /verysilent"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
