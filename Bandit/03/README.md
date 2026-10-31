# Bandit — Level 3 → 4

> Official description: <https://overthewire.org/wargames/bandit/bandit4.html>

| Info | Value |
|------|-------|
| **User** | `bandit3` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐☆☆☆☆ |
| **Topics** | Hidden files |

---

## Goal

The password is stored in a hidden file in the `inhere` directory.

## Thought process

1. **Plain `ls` shows nothing.** Files whose names start with `.` are hidden by default.
2. **Show everything.** `ls -a` lists hidden files too.
3. **Read it.** The hidden file is `...Hiding-From-You`.

## Commands

```bash
# 1. Go into the directory
cd inhere

# 2. List all files, including hidden ones
ls -a

# 3. Read the hidden file
cat ./...Hiding-From-You
```

## Result

The password for `bandit4` is printed.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- In Linux, any file whose name begins with `.` is hidden from a plain `ls`.
- `ls -a` shows all entries, `ls -A` hides only `.` and `..`.

## References

- `man ls`

---

⬅️ [Level 2](../02/README.md) · [Back to index](../README.md) · ➡️ [Level 4](../04/README.md)
