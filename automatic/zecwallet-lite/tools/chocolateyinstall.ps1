
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/adityapk00/zecwallet-lite/releases/download/v1.4.0/Zecwallet.Lite.1.4.0.msi'

  softwareName  = 'zecwallet-lite*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'e89c3cacb4206e69a5bb8660c947a1f9200af212a0ac17f17a22ea2841cb2f58'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
