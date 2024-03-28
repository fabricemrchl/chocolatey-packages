
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters

$sa = " /silent "

# Prevent clean user settings by default, if you want to clean settings at each update add parameter /CleanUser
$sa += if (-Not $pp['CleanUser']) { " /nocleanuser " }

#Use the same Parsec account for all users on this computer
$sa += if ($pp['Shared']) { " /shared " }

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Parsec*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  
  url            = "https://builds.parsecgaming.com/package/parsec-windows32.exe"
  url64bit       = "https://builds.parsecgaming.com/package/parsec-windows.exe"
  checksum       = 'f6250ee5d02cbc50ee0128b9b0eecfdfb3b13cabf176777958b6971b6ed988d1'
  checksumType   = 'sha256'
  checksum64     = 'ae5b66322e5a7c26ad21ccc556bdc1618796166565d2939142c5aa3d76c38ace'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "$sa /S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
