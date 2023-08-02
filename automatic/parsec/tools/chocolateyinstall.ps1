
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
  checksum       = 'f61c70d979155e4a7cb30000c91fdb897030777436f5f8a813896b1e1147b24e'
  checksumType   = 'sha256'
  checksum64     = '26ad62d32de464eab6e08a3aa5957523381209854a98144409a29348b88b74be'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "$sa /S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
