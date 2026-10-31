# Bandit — Level 1 → 2

> Official description: <https://overthewire.org/wargames/bandit/bandit2.html>

| Info | Value |
|------|-------|
| **User** | `bandit1` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐☆☆☆☆ |
| **Topics** | Special filenames (`-`) |

---

## Goal

The password for the next level is stored in a file called `-` in the home directory.

## Thought process

1. **What's in the home?** `ls` shows a single file named `-`.
2. **Why doesn't `cat -` work?** Many tools treat `-` as "read from standard input", so `cat -` just waits for keyboard input instead of opening the file.
3. **How do I make it a filename?** Giving a path instead of a bare name removes the ambiguity: `./-` means "the file called `-` in the current directory".

## Commands

```bash
# 1. List the home directory
ls

# 2. Read the file using a relative path so '-' isn't treated as stdin
cat ./-
```

## Result

The password for `bandit2` is printed.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `-` is a common convention for stdin/stdout in command-line tools.
- Prefixing a filename with `./` forces it to be interpreted as a path.

## References

- `man cat`

---

⬅️ [Level 0](../0/README.md) · [Back to index](../README.md) · ➡️ [Level 2](../2/README.md)
