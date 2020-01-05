
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/adityapk00/zecwallet-lite/releases/download/v1.0.3/Windows-installer-zecwallet-lite-v1.0.3.msi'

  softwareName  = 'zecwallet-lite*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'C24D1EE7466DEB0F1DE86A2A38AAE79C2A0D23A665FEB221F6E8D74E7CAC472B'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
