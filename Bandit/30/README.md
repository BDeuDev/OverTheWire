# Bandit — Level 30 → 31

> Official description: <https://overthewire.org/wargames/bandit/bandit31.html>

| Info | Value |
|------|-------|
| **User** | `bandit30` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | git tags |

---

## Goal

Another git repository, for `bandit30-git`. Clone it and find the password.

## Thought process

1. **Nothing obvious.** The README is empty of useful info, the log has a single commit, and there are no other branches.
2. **Other git objects.** Tags can point to any object, not only commits.
3. **Found one.** `git tag` lists a tag called `secret`.
4. **Show it.** `git show secret` prints what it points to.

## Commands

```bash
# 1. Clone the repo
sshpass -p "bandit30_pass" git clone ssh://bandit30-git@bandit.labs.overthewire.org:2220/home/bandit30-git/repo

# 2. List tags and show the suspicious one
cd repo
git tag
git show secret
```

## Result

The `secret` tag contains the password for `bandit31`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Tags are easy to overlook, but they can hold data.
- `git show` works on tags, commits, trees and blobs.

## References

- `man git-tag`
- `man git-show`

---

⬅️ [Level 29](../29/README.md) · [Back to index](../README.md) · ➡️ [Level 31](../31/README.md)
