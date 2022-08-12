
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/FreeTubeApp/FreeTube/releases/download/v0.17.1-beta/freetube-0.17.1-setup-x64.exe'

  softwareName  = 'FreeTube*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '7da9965a8da55b819f2d8c5184f065c4f4d7009031a7ceff73bee2bb4f2f0ee9'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/S" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
