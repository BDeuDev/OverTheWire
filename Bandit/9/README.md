# Bandit — Level 9 → 10

> Official description: <https://overthewire.org/wargames/bandit/bandit10.html>

| Info | Value |
|------|-------|
| **User** | `bandit9` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | `strings` on binary data |

---

## Goal

The password is stored in `data.txt` in one of the few human-readable strings, preceded by several `=` characters.

## Thought process

1. **`cat` is useless here.** The file is mostly binary, so it prints garbage.
2. **Extract readable text.** `strings` prints sequences of printable characters found in a binary file.
3. **Look for the hint.** Among the output, the password is on a line starting with `====`. Piping into `grep` narrows it down.

## Commands

```bash
# Print readable strings in the file
strings data.txt

# Optional: show only the lines with '=='
strings data.txt | grep "=="
```

## Result

The line preceded by `=` signs contains the password for `bandit10`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `strings` is a quick way to peek at readable text inside binaries.

## References

- `man strings`

---

⬅️ [Level 8](../8/README.md) · [Back to index](../README.md) · ➡️ [Level 10](../10/README.md)
