
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/adityapk00/zecwallet-lite/releases/download/v1.2.1/Zecwallet.Lite.1.2.1.msi'

  softwareName  = 'zecwallet-lite*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'feb73a0af1ea6fe08a0cc2d7d14a3c28c8fe49c47c035e6482b07dae3d599f26'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
