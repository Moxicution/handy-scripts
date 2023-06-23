$rootDirectory = "P:\"
$targetFolderName = "node_modules"

function FindNodeModulesFolder($path) {
    if ((Get-Item -Path $path).Name -eq $targetFolderName) {
        Write-Host "Found one at: $path"
    }
    else {
        Get-ChildItem -Path $path -Directory | ForEach-Object {
            FindNodeModulesFolder $_.FullName
        }
    }
}

FindNodeModulesFolder $rootDirectory
