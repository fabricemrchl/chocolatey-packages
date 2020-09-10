
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Parsec*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  
  url            = "https://builds.parsecgaming.com/package/parsec-windows32.exe"
  url64bit       = "https://builds.parsecgaming.com/package/parsec-windows.exe"
  checksum       = 'af1ef16a01b9b1cddbffcbd13c890959cc511fa1adafb34240ac3e539ea849af'
  checksumType   = 'sha256'
  checksum64     = '8a6bdcbfa1f01fcb4d8ad1f907a2c95736ee3f6310e3a733607a15bcc160db74'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
