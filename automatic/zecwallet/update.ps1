import-module au

$release_url = 'https://github.com/ZcashFoundation/zecwallet/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum64\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*url64bit\s*=\s*)'(.*)'"   = "`$1'$($Latest.Url64)'"
            
        }
     }
}

function global:au_GetLatest {
    $jsonAnswer = Invoke-RestMethod `
        -Uri "https://api.github.com/repos/ZcashFoundation/zecwallet/releases/latest" `
        -Headers $headers `
        -UseBasicParsing
    $version = $jsonAnswer.tag_name -Replace '[^0-9.]' 
    $jsonAnswer.assets | Where { $_.name -Match "\.msi$" } | ForEach-Object {
        $url64 = $_.browser_download_url
    }

    @{
        URL64 = $url64
        Version = $version
    }
}

update -NoCheckUrl -ChecksumFor 64