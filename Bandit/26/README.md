# Bandit — Level 26 → 27

> Official description: <https://overthewire.org/wargames/bandit/bandit27.html>

| Info | Value |
|------|-------|
| **User** | `bandit26` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | setuid binaries (again) |

---

## Goal

Now that I have a shell as `bandit26`, I need to get the password for `bandit27`.

## Thought process

1. **Keep the shell from level 25.** The login shell is still `showtext`, so I use the shell spawned from `vim`.
2. **Look around.** The home directory has `bandit27-do`, a setuid binary like the one in level 19.
3. **Same trick.** Run `cat` on the password file through it.

## Commands

```bash
# From the shell spawned in vim
ls
./bandit27-do cat /etc/bandit_pass/bandit27
```

## Result

The command prints the password for `bandit27`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Techniques repeat: recognising a setuid helper saves time.

## References

- `man chmod` (setuid)

---

⬅️ [Level 25](../25/README.md) · [Back to index](../README.md) · ➡️ [Level 27](../27/README.md)
