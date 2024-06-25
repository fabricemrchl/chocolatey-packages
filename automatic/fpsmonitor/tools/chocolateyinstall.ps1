
$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'FPS Monitor*'
  unzipLocation = $toolsDir
  fileType      = 'exe' 
  
  url            = 'https://www.fpsmon.com/bin/fpsmon-5490.exe'
  checksum       = '1398d9d857c42b77507e6f409c4b8021bf5f912a982743926e76dbabb9b87474'
  checksumType   = 'sha256'

  # MSI
  silentArgs    = "/silent /verysilent"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
