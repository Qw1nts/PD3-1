write-host "parbauda atjauninajumus... (tas var prasit bridi)"
$atjauninajumi = winget upgrade | select-object -skip
$skaits = ($atjauninajumi | where-object { $_ -match "\s" }).count
write-host "sistema ir $skaits programmas, kuras nepieciesams atjauninat."