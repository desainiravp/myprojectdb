# backup.ps1
$date = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$backupPath = ".\backup\mydatabase_$date.sql"

docker exec mariadb mysqldump -u root -prootpassword mydatabase > $backupPath

if ($LASTEXITCODE -eq 0) {
    Write-Host "Backup created: $backupPath"
} else {
    Write-Host "Backup failed"
    exit 1
}

