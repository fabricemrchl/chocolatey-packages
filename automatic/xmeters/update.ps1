import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum64\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum64)'"
            
        }
     }
}

function global:au_GetLatest {
    #Download file and get version from EXE speciication
    $url = "https://entropy6.com/xmeters/downloads/XMetersSetup.exe"
    $output = "$PSScriptRoot\XMetersSetup.exe"

    (New-Object System.Net.WebClient).DownloadFile($url, $output)

    $version = (Get-Item $output).VersionInfo.ProductVersion
    $Checksum64 = (Get-FileHash ($output)).Hash
    

    @{
        
        Version = $version
        Checksum64 = $Checksum64
    }
}

update -NoCheckUrl -ChecksumFor none