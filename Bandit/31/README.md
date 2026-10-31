# Bandit — Level 31 → 32

> Official description: <https://overthewire.org/wargames/bandit/bandit32.html>

| Info | Value |
|------|-------|
| **User** | `bandit31` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | git push and `.gitignore` |

---

## Goal

Another git repository, for `bandit31-git`. Clone it and find the password.

## Thought process

1. **Read the instructions.** The README asks me to push a file `key.txt` with the content `May I come in?` to the `master` branch.
2. **Obstacle.** The repo's `.gitignore` contains `*.txt`, so `git add` silently skips `key.txt`.
3. **Fix it.** I remove that rule from `.gitignore` (alternatively, `git add -f key.txt`).
4. **Push.** The server checks the file in a hook and prints the result in the push output.

## Commands

```bash
# 1. Clone the repo
sshpass -p "bandit31_pass" git clone ssh://bandit31-git@bandit.labs.overthewire.org:2220/home/bandit31-git/repo
cd repo

# 2. Remove the '*.txt' rule
nvim .gitignore

# 3. Create the file with the required content
echo "May I come in?" > key.txt

# 4. Commit and push to master
git add .
git commit -m "add key.txt"
git push origin master
```

## Result

The push is rejected, but the remote output (lines starting with `remote:`) includes the password for `bandit32`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `.gitignore` can hide files from `git add`; `git add -f` overrides it.
- Servers can run hooks on push and send messages back to the client.

## References

- `man gitignore`
- `man git-push`

---

⬅️ [Level 30](../30/README.md) · [Back to index](../README.md) · ➡️ [Level 32](../32/README.md)
