# Bandit — Level 29 → 30

> Official description: <https://overthewire.org/wargames/bandit/bandit30.html>

| Info | Value |
|------|-------|
| **User** | `bandit29` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | git branches |

---

## Goal

Another git repository, for `bandit29-git`. Clone it and find the password.

## Thought process

1. **README hint.** It says "no passwords in production!", so the password might be somewhere other than the main branch.
2. **List all branches.** `git branch -a` includes remote branches.
3. **Switch to `dev`.** The `dev` branch has a different `README.md`.

## Commands

```bash
# 1. Clone the repo
sshpass -p "bandit29_pass" git clone ssh://bandit29-git@bandit.labs.overthewire.org:2220/home/bandit29-git/repo
cd repo

# 2. List local and remote branches
git branch -a

# 3. Switch to the dev branch and read the README
git switch dev
cat README.md
```

## Result

The `README.md` on the `dev` branch contains the password for `bandit30`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `git branch -a` shows remote branches that aren't checked out locally.
- `git switch <branch>` creates a local tracking branch automatically if a remote one exists.

## References

- `man git-branch`
- `man git-switch`

---

⬅️ [Level 28](../28/README.md) · [Back to index](../README.md) · ➡️ [Level 30](../30/README.md)
