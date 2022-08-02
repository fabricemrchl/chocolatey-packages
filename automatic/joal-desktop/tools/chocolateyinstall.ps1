$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.12/JoalDesktop-2.0.12-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = '85f9a132f2b79841a0b9948d53d9ae2ca6e7206576ecff7d534ffd0afd9e2016'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
