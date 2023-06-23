$findFolder = "node_modules";
$inPath = "C:\"; 
$depth = 6;
Get-ChildItem -Path $inPath -Directory -Depth $depth | Where-Object { $_.Name -eq $findFolder } | ForEach-Object { Write-Host $_.FullName }
