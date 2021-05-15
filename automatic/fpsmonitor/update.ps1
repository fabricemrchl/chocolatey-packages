import-module au

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*checksum\s*=\s*)'(.*)'"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*url\s*=\s*)'(.*)'"   = "`$1'$($Latest.URL)'"
        }
     }
}

Function Get-RedirectedUrl {

    Param (
        [Parameter(Mandatory=$true)]
        [String]$URL
    )

    $request = [System.Net.WebRequest]::Create($url)
    $request.AllowAutoRedirect=$false
    $response=$request.GetResponse()

    If ($response.StatusCode -eq "Found")
    {
        $response.GetResponseHeader("Location")
    }
}


function global:au_GetLatest {
    #get URL of latest version and extract version number
    $url = (Get-RedirectedUrl "https://fpsmon.com/bin/get-install-fpsmon.php")
    $FileName = [System.IO.Path]::GetFileName($url)
    $FileName -match "(\d+\.?\d*).exe"
    $version = $matches[1]
    if ($version -notcontains "."){
        $version = $version+".00"
    }
    
    @{
        URL = $url    
        Version = $version
    }
}

update -NoCheckUrl