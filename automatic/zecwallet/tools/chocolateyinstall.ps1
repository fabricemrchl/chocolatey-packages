
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/ZcashFoundation/zecwallet/releases/download/v1.8.2/Zecwallet.Fullnode.1.8.2.msi'

  softwareName  = 'Zecwallet-Fullnode*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '3d41e503881f4423d8322596f4c133f4a33510ede6c896932ec95b5078ec1d7f'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
