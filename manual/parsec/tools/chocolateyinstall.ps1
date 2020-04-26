
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Parsec*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  
  file           = "$toolsDir\parsec-windows32.exe"
  file64         = "$toolsDir\parsec-windows.exe"
  checksum       = 'D4D31E15A6A5D6F5A3828855E2E783DB84D8AAE41F38D058A44034DC363264B6'
  checksumType   = 'sha256'
  checksum64     = 'ECD4F7528D2F737F6BA9632599CF810484B6C9E6C9BC99212CDB7AAF846AB01B'
  checksumType64 = 'sha256'

  # MSI
  silentArgs    = "/S"
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
