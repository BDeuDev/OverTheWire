# Bandit — Level 8 → 9

> Official description: <https://overthewire.org/wargames/bandit/bandit9.html>

| Info | Value |
|------|-------|
| **User** | `bandit8` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | `sort` and `uniq` |

---

## Goal

The password is stored in `data.txt` and is the only line of text that occurs only once.

## Thought process

1. **Find the unique line.** `uniq -u` prints lines that are not repeated.
2. **Catch.** `uniq` only compares adjacent lines, so duplicates spread around the file would be missed.
3. **Sort first.** Piping through `sort` groups identical lines together, then `uniq -u` works correctly.

## Commands

```bash
# Sort so duplicates are adjacent, then keep only unique lines
sort data.txt | uniq -u
```

## Result

A single line is printed: the password for `bandit9`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `uniq` needs sorted input to detect all duplicates.
- `uniq -u` shows unique lines, `uniq -d` shows repeated ones, `uniq -c` counts them.

## References

- `man sort`
- `man uniq`

---

⬅️ [Level 7](../7/README.md) · [Back to index](../README.md) · ➡️ [Level 9](../9/README.md)
