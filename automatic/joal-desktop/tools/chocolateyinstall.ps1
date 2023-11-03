$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.17/JoalDesktop-2.0.17-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = 'c077abb420e83e6a04bab3a6b37ab7d48dad249db7f60ed54ce1f9a5df4dc7f4'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
