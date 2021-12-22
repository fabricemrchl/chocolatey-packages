$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.10/JoalDesktop-2.0.10-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = '934b7a343b26021c91e3718fc9d0063adfe8808b3cf90bebc430ed09620f17ef'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
