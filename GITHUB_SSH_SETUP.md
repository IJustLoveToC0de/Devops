# GitHub SSH Key Setup Guide 🔐

This guide will help you set up SSH authentication with GitHub.

## Step 1: Generate SSH Key

Run the following command in PowerShell or Git Bash:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

**Note**: Replace `your_email@example.com` with your GitHub email address.

### Options:
- **Press Enter** to accept the default file location (`C:\Users\YourUsername\.ssh\id_ed25519`)
- **Enter a passphrase** (recommended for security) or press Enter for no passphrase
- **Confirm the passphrase** if you entered one

### Alternative: RSA Key (if ed25519 is not supported)
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

## Step 2: Start SSH Agent

```powershell
# Start the ssh-agent service
Start-Service ssh-agent

# Add your SSH key to the agent
ssh-add ~/.ssh/id_ed25519
```

If you used RSA instead:
```powershell
ssh-add ~/.ssh/id_rsa
```

## Step 3: Copy Your Public Key

```powershell
# Display and copy your public key
cat ~/.ssh/id_ed25519.pub
```

Or use:
```powershell
Get-Content ~/.ssh/id_ed25519.pub | Set-Clipboard
```

This copies the key to your clipboard automatically.

## Step 4: Add SSH Key to GitHub

1. **Go to GitHub**: https://github.com/settings/keys
2. **Click "New SSH key"**
3. **Title**: Give it a descriptive name (e.g., "Windows Dev Machine")
4. **Key**: Paste your public key (from clipboard)
5. **Click "Add SSH key"**
6. **Enter your GitHub password** if prompted

## Step 5: Test the Connection

```bash
ssh -T git@github.com
```

You should see:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

## Step 6: Configure Git to Use SSH

If you haven't already, update your remote URL:

```bash
# Check current remote URL
git remote -v

# Change HTTPS to SSH (if needed)
git remote set-url origin git@github.com:username/repository.git
```

## Troubleshooting

### SSH Agent Not Running
```powershell
# Start ssh-agent
Start-Service ssh-agent

# Add key
ssh-add ~/.ssh/id_ed25519
```

### Permission Denied
- Make sure your public key is correctly added to GitHub
- Verify the key is added to ssh-agent: `ssh-add -l`
- Check SSH connection: `ssh -vT git@github.com`

### Key Not Found
- Verify key exists: `ls ~/.ssh/`
- Regenerate if needed: `ssh-keygen -t ed25519 -C "your_email@example.com"`

## Security Best Practices

1. ✅ Use a strong passphrase for your SSH key
2. ✅ Never share your private key (`id_ed25519` or `id_rsa`)
3. ✅ Only share your public key (`id_ed25519.pub` or `id_rsa.pub`)
4. ✅ Use different keys for different machines
5. ✅ Regularly rotate your SSH keys

## Multiple SSH Keys

If you need multiple SSH keys (e.g., for different GitHub accounts):

1. Generate keys with different names:
   ```bash
   ssh-keygen -t ed25519 -C "work@example.com" -f ~/.ssh/id_ed25519_work
   ssh-keygen -t ed25519 -C "personal@example.com" -f ~/.ssh/id_ed25519_personal
   ```

2. Create/edit `~/.ssh/config`:
   ```
   # Work GitHub
   Host github-work
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_work

   # Personal GitHub
   Host github-personal
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_personal
   ```

3. Use different hosts when cloning:
   ```bash
   git clone git@github-work:work-org/repo.git
   git clone git@github-personal:personal-org/repo.git
   ```

---

**Need help?** Check GitHub's official guide: https://docs.github.com/en/authentication/connecting-to-github-with-ssh
