# Bandit — Level 0 → 1

> Official description: <https://overthewire.org/wargames/bandit/bandit0.html> · <https://overthewire.org/wargames/bandit/bandit1.html>

| Info | Value |
|------|-------|
| **User** | `bandit0` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐☆☆☆☆ |
| **Topics** | SSH, reading files |

---

## Goal

Log into the server via SSH as `bandit0` (password `bandit0`). The password for the next level is stored in a file called `readme` in the home directory.

## Thought process

1. **What's being asked?** Log into a remote server and read a file. The first step is getting connected.
2. **How do I connect?** The description gives the host, user and port. The port isn't the default 22, so I need to specify it with `-p`.
3. **Once inside, where am I?** SSH drops me into my home directory. I list the files to confirm `readme` is there.
4. **Read the file.** It's a plain text file, so `cat` is enough.

## Commands

```bash
# 1. Connect to the server (port 2220)
ssh -p 2220 bandit0@bandit.labs.overthewire.org

# 2. See what's in the home directory
ls -la

# 3. Read the file containing the password
cat readme
```

## Result

The password for `bandit1` is printed when reading `readme`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `ssh -p <port> user@host` connects to a port other than 22.
- `ls -la` lists all files, including hidden ones.
- `cat` prints a file's contents to the terminal.

## References

- `man ssh`
- `man ls`
- `man cat`

---

⬅️ [Back to index](../README.md) · ➡️ [Level 1](../1/README.md)
