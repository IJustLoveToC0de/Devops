# SSH Troubleshooting Guide 🔧

## Problem: Permission Denied (publickey)

If you get `git@github.com: Permission denied (publickey)`, here's how to fix it.

## Solution Applied ✅

Created SSH config file at `~/.ssh/config` to tell SSH which key to use for GitHub.

### What Was Done

1. **Created SSH config file** (`C:\Users\YourUsername\.ssh\config`):
   ```
   Host github.com
       HostName github.com
       User git
       IdentityFile ~/.ssh/id_ed25519_github
       IdentitiesOnly yes
   ```

2. **Why this works**: SSH was looking for default key names (`id_rsa`, `id_ed25519`) but we created a custom-named key (`id_ed25519_github`). The config file tells SSH to use our specific key for GitHub.

## Verify It's Working

```bash
ssh -T git@github.com
```

You should see:
```
Hi username! You've successfully authenticated, but GitHub does not provide shell access.
```

**Note**: Exit code 1 is normal - GitHub returns this even on successful authentication.

## Common Issues & Solutions

### Issue 1: Key Not Added to GitHub

**Symptom**: Still getting permission denied after config setup

**Solution**:
1. Display your public key:
   ```bash
   cat ~/.ssh/id_ed25519_github.pub
   ```
2. Copy the entire key
3. Go to: https://github.com/settings/keys
4. Click "New SSH key"
5. Paste and save

### Issue 2: Wrong Key Format

**Symptom**: GitHub rejects the key

**Solution**: Make sure you're copying the **public** key (ends in `.pub`), not the private key!

### Issue 3: Multiple GitHub Accounts

**Symptom**: Need different keys for different accounts

**Solution**: Update `~/.ssh/config`:
```
# Personal GitHub
Host github.com
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_github
    IdentitiesOnly yes

# Work GitHub
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_ed25519_work
    IdentitiesOnly yes
```

Then use: `git@github-work:org/repo.git` for work repos.

### Issue 4: SSH Agent Not Running

**Symptom**: Need to enter passphrase every time

**Solution**:
```powershell
# Start ssh-agent
Start-Service ssh-agent

# Add key to agent
ssh-add ~/.ssh/id_ed25519_github
```

### Issue 5: File Permissions (Linux/Mac)

**Symptom**: SSH complains about permissions

**Solution**:
```bash
chmod 600 ~/.ssh/id_ed25519_github
chmod 644 ~/.ssh/id_ed25519_github.pub
chmod 600 ~/.ssh/config
```

## Testing Connection

### Basic Test
```bash
ssh -T git@github.com
```

### Verbose Test (for debugging)
```bash
ssh -vT git@github.com
```

Look for lines like:
- `debug1: Offering public key: ...` - Shows which key is being tried
- `debug1: Server accepts key` - Key was accepted
- `debug1: Authentication succeeded` - Success!

## Current Configuration

Your SSH config is set up at:
- **Config file**: `C:\Users\YourUsername\.ssh\config`
- **Private key**: `C:\Users\YourUsername\.ssh\id_ed25519_github`
- **Public key**: `C:\Users\YourUsername\.ssh\id_ed25519_github.pub`

## Next Steps

Now that SSH is working:

1. **Clone a repo**:
   ```bash
   git clone git@github.com:username/repo.git
   ```

2. **Update existing repo remote**:
   ```bash
   git remote set-url origin git@github.com:username/repo.git
   ```

3. **Push/Pull**: Should work without password prompts!

## Security Notes

- ✅ Never share your **private** key (`id_ed25519_github`)
- ✅ Only share your **public** key (`id_ed25519_github.pub`)
- ✅ Use a passphrase for extra security
- ✅ Regularly rotate SSH keys

---

**Status**: ✅ SSH authentication is working!
