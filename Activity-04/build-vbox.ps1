# Clean up older run
& $vbox unregistervm $vm --delete 2>$null
Remove-Item $disk -Force -ErrorAction SilentlyContinue

$vbox = "C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"

$vm   = "IT390R-Win10"
$iso  = "C:\ISO Folder\en-us_windows_10_consumer_editions_version_22h2_x64_dvd_8da72ab3.iso"
$ans = "C:\Users\User1\Desktop\activities-manumuaed96\Activity-04\answer.iso"
$disk = "$env:TEMP\Win10-$env:USERNAME.vdi"


# 2  Create fresh VM
& $vbox createvm --name $vm --ostype Windows10_64 --register
& $vbox modifyvm $vm --memory 3072 --cpus 2 --ioapic on --boot1 dvd
& $vbox createhd --filename $disk --size 40000 --variant Standard
& $vbox storagectl $vm --add sata --name "SATA"
& $vbox storageattach $vm --storagectl "SATA" --port 0 --type hdd     --medium $disk
& $vbox storageattach $vm --storagectl "SATA" --port 1 --type dvddrive --medium $iso
& $vbox storageattach $vm --storagectl "SATA" --port 2 --type dvddrive --medium $ans

# 3  Boot headless
& $vbox startvm $vm --type headless

Write-Host " VM started. Windows setup running..."
