$statuss = Get-MpComputerStatus
$sodien = Get-Date
if (-not $statuss.realtimeprotectionenabled -or ($statuss.quickscanage).Days -gt 3) {
    write-host "sistema ir apdraudeta!" -foregroundcolor red
} else {
    write-host "sistema ir drosa." -foregroundcolor green
}