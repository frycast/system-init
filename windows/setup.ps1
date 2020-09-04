function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

function Install-FromChocolatey {
    param(
        [string]
        [Parameter(Mandatory = $true)]
        $PackageName
    )

    choco install $PackageName --yes
}

Install-Chocolatey

Install-FromChocolatey 'git'
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/frycast/system-init/master/common/.gitconfig' -OutFile (Join-Path $env:USERPROFILE '.gitconfig')
Install-FromChocolatey 'git-lfs'

Install-FromChocolatey 'vscode'
Install-FromChocolatey 'microsoft-windows-terminal'
Install-FromChocolatey 'firefox'
Install-FromChocolatey 'googlechrome'
Install-FromChocolatey 'vlc'
Install-FromChocolatey 'r'
Install-FromChocolatey 'r.studio'
Install-FromChocolatey 'notion'
Install-FromChocolatey 'sharex'
Install-FromChocolatey 'everything'
Install-FromChocolatey 'jabref'



