$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.5/JoalDesktop-2.0.5-win.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = 'e20898440389d1a7d6a383be14f7ffb0e2934c7da293a627c26015600b0b8e0b'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
