$ErrorActionPreference = 'Stop';

$ver = $env:ChocolateyPackageVersion

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  silentArgs    = '/VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES' `
                  + '"/MERGETASKS=!stationary\env_path"' # Don't add to PATH
  softwareName  = 'dictpw'

  url           = "https://github.com/guijan/dictpw/releases/download/v${ver}/setup-dictpw-${ver}-x86.exe"
  url64bit      = "https://github.com/guijan/dictpw/releases/download/v${ver}/setup-dictpw-${ver}-x64.exe"

  checksum    = 'a3f3341bfd8d69bb758b363e4e0523cc10bfe3049061dc812146910f26f5fd1b'
  checksumType  = 'sha256'
  checksum64      = '31b802365dc494f780bd959d1254c39e9d274fedb28eba275fbb5c33b0f463c6'
  checksumType64= 'sha256'

}

Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
Install-Binfile -Name $packageName -Path "$installLocation/bin/dictpw.exe"
Write-Host "$packageName installed to '$installLocation'"
