$basics = @(
    'git', 
    'github-desktop',
    'git',
    'github-desktop',
    'microsoft-windows-terminal',
    'firefox',
    'googlechrome',
    'vlc',
    'r',
    'r.studio',
    'anaconda3',
    'julia',
    'notion',
    'sharex',
    'everything',
    'jabref',
    'discord',
    'signal',
    'slack',
    'zoom',
    'notion',
    'adobereader',
    'sumatrapdf',
    'wiztree',
    'honeyview',
    'vim'
)

$other = @(
    'vscode',
    'wsl2',
    'docker-desktop',
 #  'https://raw.githubusercontent.com/frycast/system-init/master/common/.gitconfig' -OutFile (Join-Path $env:USERPROFILE '.gitconfig'),
    'git-lfs',
    'powertoys',
    'golang',
    'qgis',
    'autohotkey'
)

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
$basics | ForEach-Object { Install-FromChocolatey $_ }
#$other | ForEach-Object { Install-FromChocolatey $_ }







