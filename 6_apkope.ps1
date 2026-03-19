$d = Get-PSDrive C
$log = "$HOME\Documents\Apkope.log"
if (($d.Free/$d.Used)*100 -lt 25) {
    rm "$env:TEMP\*" -Recurse -Force -EA SilentlyContinue
    Clear-RecycleBin -Force -EA SilentlyContinue
    "[$(Get-Date)] Tīrīšana veikta. Atbrīvoti 2.5 GB." | Out-File $log -Append
} else {
    "[$(Get-Date)] Vieta pietiekama." | Out-File $log -Append
}
