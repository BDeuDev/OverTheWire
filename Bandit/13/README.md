# Bandit — Level 13 → 14

> Official description: <https://overthewire.org/wargames/bandit/bandit14.html>

| Info | Value |
|------|-------|
| **User** | `bandit13` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | SSH private keys |

---

## Goal

The password for the next level is stored in `/etc/bandit_pass/bandit14` and can only be read by `bandit14`. Instead of a password, I get a private SSH key to log in as `bandit14`.

## Thought process

1. **No password, but a key.** The home directory has `sshkey.private`, which is the key for `bandit14`.
2. **Use it from my machine.** I copy the key contents to a local file.
3. **Fix permissions.** SSH refuses private keys that other users can read, so I restrict them with `chmod`.
4. **Log in with the key.** `ssh -i` uses the key instead of a password.

## Commands

```bash
# 1. On the server: print the key and copy it to a local file
cat sshkey.private

# 2. On my machine: restrict the key's permissions
chmod 700 sshkey.private

# 3. Log in as bandit14 with the key
ssh -p 2220 -i sshkey.private bandit14@bandit.labs.overthewire.org

# 4. As bandit14, read its password
cat /etc/bandit_pass/bandit14
```

## Result

Logged in as `bandit14`, and `/etc/bandit_pass/bandit14` holds its password.

> I store the key in `sshkey.private`, which is **not committed** to the repo.

## What I learned

- `ssh -i <key>` authenticates with a private key.
- SSH rejects keys with permissions that are too open (`600` or `700` work).
- `/etc/bandit_pass/banditN` stores each level's password, readable only by that user.

## References

- `man ssh`
- `man chmod`

---

⬅️ [Level 12](../12/README.md) · [Back to index](../README.md) · ➡️ [Level 14](../14/README.md)
