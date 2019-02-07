$folderpath = "C:\Users\User\Desktop\captions\"
function FormatCaptions {
    ForEach ($path in Get-ChildItem -Path $folderpath -Recurse -Include *.sbv) {
        $i = 1
        (gc $path) | ? {$_.trim() -ne "" } | set-content $path
        Get-Content $path | Where-Object { $i % 2 -eq 0; $i++ }
        Set-Content -Path $path -Value (Get-Content $path | Where-Object { $i % 2 -eq 0; $i++ })
        $name = (Get-Item $path).Basename
        $newFile = $folderpath + $name + ".txt"
        Get-Content $path | Out-File -FilePath $newFile
    }
}
FormatCaptions
