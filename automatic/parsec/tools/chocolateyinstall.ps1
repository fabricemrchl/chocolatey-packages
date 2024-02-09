
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
  checksum       = 'be670f55b4aa74ef49b7b1f6b9373a156e012eff9cd2163fd65f509265dfdf50'
  checksumType   = 'sha256'
  checksum64     = '42f4705695ca287a2195981da61957a19d1d2f90858e70f54bafccbf77747d86'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "$sa /S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
