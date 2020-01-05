import-module au

$release_url = 'https://github.com/adityapk00/zecwallet-lite/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum64\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum64)'"
            "(?i)(^\s*url64bit\s*=\s*)'(.*)'"   = "`$1'$($Latest.Url64)'"
            
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $release_url -UseBasicParsing

    $re = '\.msi$'
    $url = $download_page.Links | ? href -match $re | select -first 1 -expand href | % { 'https://github.com' + $_ }

    $version64 = $url.Substring($url.LastIndexOf("-") + 1).Replace(".msi", "").Replace("v","")

    @{
        URL64 = $url
        Version = $version64
    }
}

update -NoCheckUrl -ChecksumFor 64