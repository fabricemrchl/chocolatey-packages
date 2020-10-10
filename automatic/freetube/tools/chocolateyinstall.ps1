
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/FreeTubeApp/FreeTube/releases/download/v0.9.0-beta/freetube.Setup.0.9.0.exe'

  softwareName  = 'FreeTube*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '564aa2833497164d0d8b6df40a96d9dcb51252feff343b944e91fd92abef75d5'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/S" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
