
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/adityapk00/zecwallet-lite/releases/download/v1.1.13/Zecwallet.Lite.1.1.13.msi'

  softwareName  = 'zecwallet-lite*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'f48ab0f0ad3e02f8767ba9f9c2f0ad8b59cc3147e4b67bfcc16ed3d66cd6b50f'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
