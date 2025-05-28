# Builds answer.iso containing only Autounattend.xml
$iso = "answer.iso"
$xml = "Autounattend.xml"
$temp = "temp-xml"

if (-Not (Test-Path $xml)) {
    Write-Error "❌ Missing $xml"
    exit 1
}

# Ensure temp folder exists and copy the XML into it
if (Test-Path $temp) { Remove-Item $temp -Recurse -Force }
New-Item -ItemType Directory -Path $temp | Out-Null
Copy-Item $xml "$temp\$xml"

$oscdimg = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"

if (-Not (Test-Path $oscdimg)) {
    Write-Error "❌ oscdimg.exe not found. Check ADK installation."
    exit 1
}

& $oscdimg -u2 -udfver102 -lANS -m $temp $iso
Write-Host "YES Created $iso"

# Optional cleanup
Remove-Item $temp -Recurse -Force

