$ErrorActionPreference = 'Stop';

$ver = $env:ChocolateyPackageVersion

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  url           = "https://github.com/guijan/dictpw/releases/download/v${ver}/setup-dictpw-${ver}-x86.exe"
  url64bit      = "https://github.com/guijan/dictpw/releases/download/v${ver}/setup-dictpw-${ver}-x64.exe"
  softwareName  = 'dictpw'

  checksum      = 'cf4a0af1de855053dc5ef389b2d94bed62c68e9340e7ba52ba374a5f7c21373f'
  checksumType  = 'sha256'
  checksum64    = '78224a2cefc00d7440410ad507fa2625e046a39fc2d1837068c3a1efb781096b'
  checksumType64= 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs

$installLocation = Get-AppInstallLocation $packageArgs.softwareName
if (!$installLocation)  {  Write-Warning "Can't find $PackageName install location"; return }
Install-Binfile -Name $packageName -Path "$installLocation/bin/dictpw.exe"
Write-Host "$packageName installed to '$installLocation'"
