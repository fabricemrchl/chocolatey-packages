$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"


$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/anthonyraymond/joal-desktop/releases/download/v2.0.14/JoalDesktop-2.0.14-win-x64.exe'
  
  softwareName  = 'joal-desktop*'

  checksum      = '49118a5a52a1b71a45e22184d2ac38bb71ec3e4fe428bfa63692e5858ca6b89a'
  checksumType  = 'sha256'
  silentArgs   = '/S' 
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs 
