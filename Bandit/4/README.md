# Bandit — Level 4 → 5

> Official description: <https://overthewire.org/wargames/bandit/bandit5.html>

| Info | Value |
|------|-------|
| **User** | `bandit4` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐☆☆☆☆ |
| **Topics** | File types |

---

## Goal

The password is stored in the only human-readable file in the `inhere` directory.

## Thought process

1. **Many candidates.** `inhere` has files `-file00` to `-file09`; most contain binary garbage.
2. **Don't guess, inspect.** `file` reports the type of each file, so I can spot the one that is ASCII text.
3. **Read the right one.** Only `-file07` is ASCII text. Again, `./` is needed because the names start with `-`.

## Commands

```bash
# 1. Go into the directory
cd inhere

# 2. Check the type of every file
file ./*

# 3. Read the only ASCII text file
cat ./-file07
```

## Result

The password for `bandit5` is printed.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `file` identifies content by inspecting the data, not the extension.
- Globs like `./*` are a quick way to run a command over every file.

## References

- `man file`

---

⬅️ [Level 3](../3/README.md) · [Back to index](../README.md) · ➡️ [Level 5](../5/README.md)
