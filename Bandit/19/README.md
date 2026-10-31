# Bandit — Level 19 → 20

> Official description: <https://overthewire.org/wargames/bandit/bandit20.html>

| Info | Value |
|------|-------|
| **User** | `bandit19` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | setuid binaries |

---

## Goal

To gain access to the next level, I have to use the setuid binary in the home directory. The password is in `/etc/bandit_pass/bandit20`.

## Thought process

1. **What is this binary?** `bandit20-do` has the setuid bit and is owned by `bandit20`, so it runs with `bandit20`'s privileges.
2. **How do I use it?** Running it without arguments shows that it runs whatever command I give it as another user.
3. **Read the protected file.** Pass `cat /etc/bandit_pass/bandit20` to it.

## Commands

```bash
# 1. Check the usage
./bandit20-do

# 2. Run cat as bandit20
./bandit20-do cat /etc/bandit_pass/bandit20
```

## Result

The command prints the password for `bandit20`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- A setuid binary runs with its owner's privileges, not the caller's.
- In `ls -l`, setuid shows up as an `s` in the owner's execute slot (`-rwsr-x---`).

## References

- `man chmod` (setuid)
- `man ls`

---

⬅️ [Level 18](../18/README.md) · [Back to index](../README.md) · ➡️ [Level 20](../20/README.md)
