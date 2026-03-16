$days = 7
$outputPath = "$HOME\Documents\Errors.txt"
$startDate = (Get-Date).AddDays(-$days)
$errors = Get-WinEvent -FilterHashtable @{
    LogName = 'System'
    Level   = 2
    StartTime = $startDate
} -ErrorAction SilentlyContinue
if ($errors.Count -gt 10) {
    $header = "[CRITICAL] System is unstable!"
} else {
    $header = "[OK] Error level is normal."
}
$report = New-Object System.Collections.Generic.List[string]
$report.Add($header)
$report.Add("-" * 30)
foreach ($err in $errors) {
    $report.Add("$($err.TimeCreated) - $($err.Message)")
}
$report | Out-File -FilePath $outputPath -Encoding utf8
Write-Host "Scan complete. Report saved to $outputPath"
