write-host "parbauda atjauninajumus... (tas var prasit bridi)"
$atjauninajumi = winget upgrade | Select-Object -skip 2
$skaits = ($atjauninajumi | where-object { $_ -match "\s" }).count
write-host "sistema ir $skaits programmas, kuras nepieciesams atjauninat."