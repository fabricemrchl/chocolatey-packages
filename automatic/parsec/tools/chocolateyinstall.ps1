
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
  checksum       = '0774c238478b26b583de9565473a29828e15d9bb4721ffcecc9987ada6909e08'
  checksumType   = 'sha256'
  checksum64     = '23e15fbc0092d9b1c5c39ff703d407a8a496bdef4e8705652f856bd091e6ac8a'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "$sa /S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
