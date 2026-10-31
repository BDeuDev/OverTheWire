# Bandit — Level 6 → 7

> Official description: <https://overthewire.org/wargames/bandit/bandit7.html>

| Info | Value |
|------|-------|
| **User** | `bandit6` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | `find` by owner, group and size |

---

## Goal

The password is stored somewhere on the server in a file that is owned by user `bandit7`, owned by group `bandit6`, and 33 bytes in size.

## Thought process

1. **"Somewhere on the server".** The search has to start at `/`, not in the home directory.
2. **Filter by metadata.** `find` supports `-user`, `-group` and `-size`, which match the three hints exactly.
3. **Hide the noise.** Searching `/` as an unprivileged user produces many "Permission denied" errors; I send them to `/dev/null`.
4. **Confirm the match.** `-printf` shows the path with its owner and group, then I `cat` it.

## Commands

```bash
# 1. Search the whole filesystem
cd /
find . -type f -size 33c -user bandit7 -group bandit6 -printf "%p (User: %u, Group: %g)\n" 2>/dev/null

# 2. Read the file that was found
cat <path_found>
```

## Result

A single file matches, and it contains the password for `bandit7`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `-user` and `-group` filter by ownership.
- `2>/dev/null` discards error messages (stderr).
- `-printf` lets `find` print custom output per match.

## References

- `man find`

---

⬅️ [Level 5](../5/README.md) · [Back to index](../README.md) · ➡️ [Level 7](../7/README.md)
