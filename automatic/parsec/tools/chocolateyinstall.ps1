
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
  checksum       = '9bd8b6393c6806bee6c0fc389f5dd9032dd3327d3f54af32520081c45d365725'
  checksumType   = 'sha256'
  checksum64     = 'e1346b9cc2ed444075655c5dfc484f2b2706ed509ce3c1f732383529ea763334'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "$sa /S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
