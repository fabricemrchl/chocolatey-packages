
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/ZcashFoundation/zecwallet/releases/download/v0.9.20/Zecwallet.Fullnode.0.9.20.msi'

  softwareName  = 'Zecwallet-Fullnode*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '7060f1b6eaec957bbbb5ce46770c09af606d566311f7d5e9929db6a0fdf2eed2'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
