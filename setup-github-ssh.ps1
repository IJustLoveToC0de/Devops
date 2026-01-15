# GitHub SSH Setup Script
# This script helps you set up SSH authentication with GitHub

Write-Host "=== GitHub SSH Key Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check if key exists
$keyPath = "$env:USERPROFILE\.ssh\id_ed25519_github"
$pubKeyPath = "$keyPath.pub"

if (Test-Path $pubKeyPath) {
    Write-Host "✓ SSH key found!" -ForegroundColor Green
    Write-Host ""
    
    # Display the public key
    Write-Host "Your public SSH key:" -ForegroundColor Yellow
    Write-Host "====================" -ForegroundColor Yellow
    $publicKey = Get-Content $pubKeyPath
    Write-Host $publicKey -ForegroundColor White
    Write-Host ""
    
    # Copy to clipboard
    $publicKey | Set-Clipboard
    Write-Host "✓ Public key copied to clipboard!" -ForegroundColor Green
    Write-Host ""
    
    Write-Host "Next steps:" -ForegroundColor Cyan
    Write-Host "1. Go to: https://github.com/settings/keys" -ForegroundColor White
    Write-Host "2. Click 'New SSH key'" -ForegroundColor White
    Write-Host "3. Paste the key (already in your clipboard)" -ForegroundColor White
    Write-Host "4. Give it a title (e.g., 'Windows Dev Machine')" -ForegroundColor White
    Write-Host "5. Click 'Add SSH key'" -ForegroundColor White
    Write-Host ""
    
    # Try to add to ssh-agent
    Write-Host "Attempting to add key to ssh-agent..." -ForegroundColor Yellow
    try {
        # Try to start ssh-agent if not running
        $agentProcess = Get-Process ssh-agent -ErrorAction SilentlyContinue
        if (-not $agentProcess) {
            Write-Host "Note: ssh-agent not running. This is okay - you can add the key manually later." -ForegroundColor Yellow
        }
        
        # Try to add the key
        ssh-add $keyPath 2>&1 | Out-Null
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Key added to ssh-agent!" -ForegroundColor Green
        } else {
            Write-Host "Note: Could not add to ssh-agent automatically. You can add it manually with:" -ForegroundColor Yellow
            Write-Host "   ssh-add $keyPath" -ForegroundColor White
        }
    } catch {
        Write-Host "Note: ssh-agent setup skipped. This is okay for now." -ForegroundColor Yellow
    }
    
    Write-Host ""
    Write-Host "To test the connection after adding to GitHub:" -ForegroundColor Cyan
    Write-Host "   ssh -T git@github.com" -ForegroundColor White
    Write-Host ""
    
} else {
    Write-Host "✗ SSH key not found at: $pubKeyPath" -ForegroundColor Red
    Write-Host ""
    Write-Host "Generate a new key with:" -ForegroundColor Yellow
    $cmd = "ssh-keygen -t ed25519 -C your_email@example.com -f $keyPath"
    Write-Host "   $cmd" -ForegroundColor White
}
