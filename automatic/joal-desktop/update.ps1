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
    $download_page = Invoke-WebRequest -Uri $release_url -UseBasicParsing

    $re = '\.exe$'
    $url = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://github.com' + $_ }

    $version = [regex]::match($url,'\/v(\d*.*)\/').Groups[1].Value

    @{
        URL = $url
        Version = $version
    }
}

update -NoCheckUrl -ChecksumFor 32