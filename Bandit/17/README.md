# Bandit — Level 17 → 18

> Official description: <https://overthewire.org/wargames/bandit/bandit18.html>

| Info | Value |
|------|-------|
| **User** | `bandit17` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | `diff` |

---

## Goal

There are two files in the home directory: `passwords.old` and `passwords.new`. The password is in `passwords.new` and is the only line that was changed between them.

## Thought process

1. **Log in with the key from level 16.** `ssh -i sshkey.private bandit17@...`.
2. **Compare the files.** `diff` shows only the lines that differ.
3. **Read the output.** Lines starting with `<` come from the first file (`passwords.new`), lines with `>` from the second.

## Commands

```bash
# 1. Log in using the key from the previous level
ssh -p 2220 -i sshkey.private bandit17@bandit.labs.overthewire.org

# 2. Show the changed line
diff passwords.new passwords.old
```

## Result

The `<` line is the password for `bandit18`. (Logging into `bandit18` prints "Byebye!" and disconnects, which is the next level's challenge.)

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `diff A B` marks lines from A with `<` and lines from B with `>`.

## References

- `man diff`

---

⬅️ [Level 16](../16/README.md) · [Back to index](../README.md) · ➡️ [Level 18](../18/README.md)
