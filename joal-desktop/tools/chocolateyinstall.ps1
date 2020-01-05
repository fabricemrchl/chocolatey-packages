$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.1/JoalDesktop-2.0.1-win.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  
  softwareName  = 'joal-desktop*'

  checksum      = '5D50C9CF0F8384445288C1DF7B77C5D167409ECD1E2B9D5E11E78ECDA84A212D'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 