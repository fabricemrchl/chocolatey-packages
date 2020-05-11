import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum64\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*checksum\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum32)'"
            
        }
     }
}

function global:au_GetLatest {
    #Get current version from nuspec file
    [xml]$nuspec = Get-Content -Path '.\parsec.nuspec'
    $version = $nuspec.package.metadata.version

    #Download the parsec installer 32bits and compute SHA256 hash
    $pkgurl = 'https://builds.parsecgaming.com/package/parsec-windows32.exe'
    $newChecksum = Get-FileHash -InputStream ([System.Net.WebClient]::new().OpenRead($pkgurl))
    
    #Download the parsec installer 64bits and compute SHA256 hash
    $pkgurl64 = 'https://builds.parsecgaming.com/package/parsec-windows.exe'
    $newChecksum64 = Get-FileHash -InputStream ([System.Net.WebClient]::new().OpenRead($pkgurl64))
    
    $input_path = '.\tools\chocolateyinstall.ps1'
    #get current SHA256 hash of parsec isntaller 32 bits from chocolateyinstall.ps1 file
    $regex = "(?i)(^\s*checksum\s*=\s*)'(.*)'"
    $currentChecksum = Select-String -Path $input_path -Pattern $regex | %{$_.Matches.Groups[2].value}
    #get current SHA256 hash of parsec isntaller 64 bits from chocolateyinstall.ps1 file
    $regex64 = "(?i)(^\s*checksum64\s*=\s*)'(.*)'"
    $currentChecksum64 = Select-String -Path $input_path -Pattern $regex64 | %{$_.Matches.Groups[2].value}

    If ($newChecksum.Hash -ne $currentChecksum -or $newChecksum64.Hash -ne $currentChecksum64) {
        $version = $(Get-Date -format "yyyyMMdd") + "." + $(Get-Date -format "HH")
    }
    

    @{
        
        Version = $version
    }
}

update -NoCheckUrl