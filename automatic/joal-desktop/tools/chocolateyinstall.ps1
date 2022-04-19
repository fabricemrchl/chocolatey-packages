$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.11/JoalDesktop-2.0.11-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = '8a3f06aebc2a1f6eee9da81fdea49871c3a7d1a5c2482cf6df4074358b741c05'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
