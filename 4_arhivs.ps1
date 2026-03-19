$datums = get-date -format "yyyy-mm-dd"
$avots = "$home\documents\errors.txt"
$arhivs = "$home\documents\atskaite_$datums.zip"
if (test-path $avots) { compress-archive -path $avots -destinationpath $arhivs -force 
$izmers = (get-item $arhivs).length / 1kb 
    write-host "arhiva izmers: $([math]::round($izmers, 2)) kb" 
} else {
    write-host "fails errors.txt netika atrasts!" 
}