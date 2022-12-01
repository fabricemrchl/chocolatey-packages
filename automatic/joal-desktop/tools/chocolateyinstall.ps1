$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.16/JoalDesktop-2.0.16-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = 'dadd99380254c85199ec0a54e2deb93fa598c0b8210913d64c275484343fadd8'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
