
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Parsec*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  
  url            = "https://builds.parsecgaming.com/package/parsec-windows32.exe"
  url64bit       = "https://builds.parsecgaming.com/package/parsec-windows.exe"
  checksum       = 'aa9b939134d7d11f953f1c04980f44b4588c0c0401e4b3a8c41dd102caa56831'
  checksumType   = 'sha256'
  checksum64     = 'f6590375fcddf8e055309bb225a3e94b31af7932b9337a664cab925c0dd2ad56'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
