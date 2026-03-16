Get-Process | 
    Where-Object { $_.Name -ne "svchost" } | 
    Sort-Object -Property WorkingSet -Descending | 
    Select-Object -First 5 -Property Name, 
        @{Name="RAM(MB)"; Expression={[math]::Round($_.WorkingSet / 1MB, 2)}} |
    Format-Table -AutoSize
