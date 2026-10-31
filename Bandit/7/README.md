# Bandit — Level 7 → 8

> Official description: <https://overthewire.org/wargames/bandit/bandit8.html>

| Info | Value |
|------|-------|
| **User** | `bandit7` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | `grep` |

---

## Goal

The password is stored in `data.txt`, next to the word `millionth`.

## Thought process

1. **Big file.** `data.txt` has thousands of lines of `word password` pairs, so reading it is not an option.
2. **Search for the keyword.** `grep` prints only the lines that contain `millionth`.

## Commands

```bash
# Print the line that contains the keyword
grep "millionth" data.txt
```

## Result

The matching line shows the password for `bandit8` next to `millionth`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `grep` is the go-to tool for finding text in large files.

## References

- `man grep`

---

⬅️ [Level 6](../6/README.md) · [Back to index](../README.md) · ➡️ [Level 8](../8/README.md)
