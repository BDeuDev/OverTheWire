# Bandit — Level 27 → 28

> Official description: <https://overthewire.org/wargames/bandit/bandit28.html>

| Info | Value |
|------|-------|
| **User** | `bandit27` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | Cloning a git repo over SSH |

---

## Goal

There is a git repository at `ssh://bandit27-git@localhost/home/bandit27-git/repo` via port `2220`. The password for `bandit27-git` is the same as for `bandit27`. I have to clone it and find the password.

## Thought process

1. **Clone it from my machine.** The URL needs the real host and port `2220`.
2. **Authentication.** I use `sshpass` to pass the password non-interactively (a plain `git clone` would just prompt for it).
3. **Look inside.** The repo only has a `README`.

## Commands

```bash
# 1. Clone the repo (port 2220 goes in the URL)
sshpass -p "bandit27_pass" git clone ssh://bandit27-git@bandit.labs.overthewire.org:2220/home/bandit27-git/repo

# 2. Read the README
cd repo
cat README
```

## Result

The `README` contains the password for `bandit28`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- SSH git URLs can include a custom port: `ssh://user@host:port/path`.
- `sshpass -p` provides a password to SSH non-interactively (it ends up in shell history, so use it carefully).

## References

- `man git-clone`
- `man sshpass`

---

⬅️ [Level 26](../26/README.md) · [Back to index](../README.md) · ➡️ [Level 28](../28/README.md)
