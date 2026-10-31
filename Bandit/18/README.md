# Bandit — Level 18 → 19

> Official description: <https://overthewire.org/wargames/bandit/bandit19.html>

| Info | Value |
|------|-------|
| **User** | `bandit18` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | Running commands over SSH |

---

## Goal

The password is stored in a file `readme` in the home directory. Someone modified `.bashrc` to log me out as soon as I log in with SSH.

## Thought process

1. **Interactive login is useless.** `.bashrc` runs when an interactive shell starts and kicks me out.
2. **Skip the interactive shell.** `ssh` can run a single command on the server and return the output, without starting an interactive shell.
3. **Two commands.** First `ls` to confirm the file, then `cat readme`.

## Commands

```bash
# Run a command directly instead of opening a shell
ssh -p 2220 bandit18@bandit.labs.overthewire.org ls
ssh -p 2220 bandit18@bandit.labs.overthewire.org cat readme
```

## Result

The second command prints the password for `bandit19`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `ssh user@host <command>` runs the command remotely and exits.
- `.bashrc` only runs for interactive shells.

## References

- `man ssh`
- `man bash` (INVOCATION section)

---

⬅️ [Level 17](../17/README.md) · [Back to index](../README.md) · ➡️ [Level 19](../19/README.md)
