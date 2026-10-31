# Bandit — Level 5 → 6

> Official description: <https://overthewire.org/wargames/bandit/bandit6.html>

| Info | Value |
|------|-------|
| **User** | `bandit5` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | `find` with filters |

---

## Goal

The password is stored in a file somewhere under `inhere` with these properties: human-readable, 1033 bytes in size, not executable.

## Thought process

1. **Too many files to check by hand.** `inhere` has many `maybehereXX` directories, each with several files.
2. **First attempt: brute force.** I wrote `script.zsh`, which loops through every directory and prints each file with its size. It works but produces a lot of noise.
3. **Better: let `find` filter.** `find` can match on type, exact size (`-size 1033c`, `c` = bytes) and permissions (`! -executable`) all at once.
4. **Print and read the match.** `-exec` lets me show the path and the contents in one command.

## Commands

```bash
# 1. Go into the directory
cd inhere

# 2. Find the regular, non-executable file of exactly 1033 bytes and print it
find . -type f -size 1033c ! -executable -exec echo "-> Find: {}" \; -exec cat {} \;
```

## Result

Only one file matches, and its contents are the password for `bandit6`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `find -size Nc` matches an exact size in bytes.
- `!` negates a `find` test, e.g. `! -executable`.
- `-exec ... {} \;` runs a command on each match.
- Writing a loop by hand works, but a precise `find` query is faster and cleaner.

## References

- `man find`
- `script.zsh` in this folder (first brute-force attempt)

---

⬅️ [Level 4](../04/README.md) · [Back to index](../README.md) · ➡️ [Level 6](../06/README.md)
