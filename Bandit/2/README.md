# Bandit — Level 2 → 3

> Official description: <https://overthewire.org/wargames/bandit/bandit3.html>

| Info | Value |
|------|-------|
| **User** | `bandit2` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐☆☆☆☆ |
| **Topics** | Filenames with spaces and dashes |

---

## Goal

The password is stored in a file called `--spaces in this filename--` in the home directory.

## Thought process

1. **Two problems at once.** The name has spaces (the shell splits it into several arguments) and starts with `--` (looks like an option to `cat`).
2. **Fixing the spaces.** Wrap the name in quotes or escape each space with `\`.
3. **Fixing the dashes.** Prefix with `./` so it's a path, not an option.

## Commands

```bash
# Option A: quote the whole name
cat './--spaces in this filename--'

# Option B: escape each space
cat ./--spaces\ in\ this\ filename--
```

## Result

The password for `bandit3` is printed.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- The shell splits arguments on spaces; quoting or escaping keeps them together.
- Arguments starting with `-` or `--` are parsed as options unless written as a path (or after `--`).
- Tab completion escapes awkward names automatically.

## References

- `man bash` (QUOTING section)

---

⬅️ [Level 1](../1/README.md) · [Back to index](../README.md) · ➡️ [Level 3](../3/README.md)
