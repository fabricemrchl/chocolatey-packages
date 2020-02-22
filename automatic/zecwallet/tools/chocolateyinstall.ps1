
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'msi' #only one of these: exe, msi, msu
  url64bit      = 'https://github.com/ZcashFoundation/zecwallet/releases/download/v0.9.1/Zecwallet.FullNode.0.9.1.msi'

  softwareName  = 'zecwallet-lite*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = 'F8E5BDE71B5CFCCD24DF05E105AC9BE0DF36C19CC8BED47D7E4F9768C1ACA043'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`"" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
