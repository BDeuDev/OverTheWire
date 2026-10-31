# Bandit — Level 28 → 29

> Official description: <https://overthewire.org/wargames/bandit/bandit29.html>

| Info | Value |
|------|-------|
| **User** | `bandit28` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | git history |

---

## Goal

Another git repository, this time for `bandit28-git`. Clone it and find the password.

## Thought process

1. **README is censored.** `README.md` shows the password as `xxxxxxxxxx`.
2. **Was it there before?** Git keeps every past version, so I check the history with `git log`.
3. **Suspicious commit.** One commit message says it fixed an info leak.
4. **See the change.** `git show` on that commit shows the diff, including the removed password.

## Commands

```bash
# 1. Clone the repo
sshpass -p "bandit28_pass" git clone ssh://bandit28-git@bandit.labs.overthewire.org:2220/home/bandit28-git/repo

# 2. Inspect the history
cd repo
git log

# 3. Show the commit that removed the password
git show <commit_hash>
```

## Result

The diff shows the line that was removed, which contains the password for `bandit29`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Deleting a secret in a new commit doesn't remove it from history.
- `git log` lists commits, `git show <hash>` shows what a commit changed.

## References

- `man git-log`
- `man git-show`

---

⬅️ [Level 27](../27/README.md) · [Back to index](../README.md) · ➡️ [Level 29](../29/README.md)
