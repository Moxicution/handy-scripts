$findFolder = "node_modules";
$inPath = "P:\dev\";
$depth = 6;
$total = 0;
$folderPaths = (Get-ChildItem -Path $inPath -Directory -Filter $findFolder -Depth $depth -Force -ErrorAction SilentlyContinue).FullName;
foreach ($folderPath in $folderPaths)
{ 
    $total += (Get-ChildItem -Path $folderPath -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum;
    $folderSizeFormatted = "{0:N2}" -f ((Get-ChildItem -Path $folderPath -Recurse -Force -ErrorAction SilentlyContinue | Measure-Object -Property Length -Sum).Sum / 1MB); 
    "Size: $folderSizeFormatted MB - $folderPath" 
};
"totalSize: {0:N2} MB" -f ($total / 1MB)
