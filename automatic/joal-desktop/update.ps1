import-module au

$release_url = 'https://github.com/anthonyraymond/joal-desktop/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*url\s*=\s*)'(.*)'"   = "`$1'$($Latest.URL)'"
            
        }
     }
}

function global:au_GetLatest {
    $jsonAnswer = Invoke-RestMethod `
        -Uri "https://api.github.com/repos/anthonyraymond/joal-desktop/releases/latest" `
        -Headers $headers `
        -UseBasicParsing
    $version = $jsonAnswer.tag_name -Replace '[^0-9.]' 
    $jsonAnswer.assets | Where { $_.name -Match "\.exe$" } | ForEach-Object {
        $url64 = $_.browser_download_url
    }

    @{
        URL = $url64
        Version = $version
    }
}

update -NoCheckUrl -ChecksumFor 32