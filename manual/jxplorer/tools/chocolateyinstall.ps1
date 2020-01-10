$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://downloads.sourceforge.net/project/jxplorer/jxplorer/version%203.3.1.2/jxplorer-3.3.1.2-windows-installer.exe'
  
  softwareName  = 'jxplorer*'

  checksum      = 'C1FE14A60BC6AA909EA8C1D5F09EB7426722BDD90634B451C12D1A32D10FF67B'
  checksumType  = 'sha256'
  silentArgs   = '--mode unattended' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
