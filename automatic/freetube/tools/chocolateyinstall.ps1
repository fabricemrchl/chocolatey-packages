
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/FreeTubeApp/FreeTube/releases/download/v0.7.2-beta/FreeTube.Setup.0.7.2.exe'

  softwareName  = 'FreeTube*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '106bf74fabfd40d1b6cfb4fe2d8de555b9ae1857a9595856c15b17352957ded5'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/S" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
