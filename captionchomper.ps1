$path = "C:\Users\notmyaccountusername\Desktop\captions.sbv"
function FormatSBV {
    $i = 1
    (gc $path) | ? {$_.trim() -ne "" } | set-content $path
    Get-Content $path | Where-Object { $i % 2 -eq 0; $i++ }
    Set-Content -Path $path -Value (Get-Content $path | Where-Object { $i % 2 -eq 0; $i++ })
}
function GetTXT {
    $path1 = "C:\Users\notmyusername\Desktop\captions.txt"
    Get-Content $path | Out-File -FilePath $path1
}
FormatSBV
GetTXT