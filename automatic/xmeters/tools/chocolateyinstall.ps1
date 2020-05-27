
$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"



$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe' #only one of these: exe, msi, msu
  url64bit      = 'https://entropy6.com/xmeters/downloads/XMetersSetup.exe'

  softwareName  = 'XMeters*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique

  checksum64    = '7E88AC356DBCF8B33A17D52AB0178EA516471E7BC4D7D1C9814104FD74D584B3'
  checksumType64= 'sha256' #default is checksumType

  # MSI
  silentArgs    = "/quiet /passive /norestart" # ALLUSERS=1 DISABLEDESKTOPSHORTCUT=1 ADDDESKTOPICON=0 ADDSTARTMENU=0
  validExitCodes= @(0, 3010, 1641)

}

Install-ChocolateyPackage @packageArgs 
