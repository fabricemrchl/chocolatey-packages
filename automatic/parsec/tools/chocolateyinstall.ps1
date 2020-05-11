
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Parsec*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  
  url            = "https://builds.parsecgaming.com/package/parsec-windows32.exe"
  url64bit       = "https://builds.parsecgaming.com/package/parsec-windows.exe"
  checksum       = 'd4d31e15a6a5d6f5a3828855e2e783db84d8aae41f38d058a44034dc363264b6'
  checksumType   = 'sha256'
  checksum64     = 'ecd4f7528d2f737f6ba9632599cf810484b6c9e6c9bc99212cdb7aaf846ab01b'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
