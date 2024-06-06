# backup.ps1
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupPath = ".\backup\mydatabase_$date.sql"

# Create the backup directory if it doesn't exist
if (-not (Test-Path -Path ".\backup")) {
    New-Item -ItemType Directory -Path ".\backup"
}

# Execute the backup command using Docker
$backupCommand = "docker exec mariadb mysqldump -u root -prootpassword mydatabase"
$backupContent = Invoke-Expression -Command $backupCommand

# Write the backup content to the file
$backupContent | Out-File -FilePath $backupPath -Encoding utf8

if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup created: $backupPath"
} else {
    Write-Host "Backup failed"
    exit 1
}


