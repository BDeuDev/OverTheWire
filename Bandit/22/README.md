# Bandit — Level 22 → 23

> Official description: <https://overthewire.org/wargames/bandit/bandit23.html>

| Info | Value |
|------|-------|
| **User** | `bandit22` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | Reading shell scripts |

---

## Goal

Same as before: a cron job runs regularly. I have to read the script it executes to understand what it does.

## Thought process

1. **Find the job and its script.** `/etc/cron.d/cronjob_bandit23` runs `/usr/bin/cronjob_bandit23.sh` as `bandit23`.
2. **Understand the script.** It builds a filename with `md5sum` from the text `I am user $myname`, and copies the password to `/tmp/<that hash>`.
3. **Key insight.** When it runs as `bandit23`, `$myname` is `bandit23`. I can compute the same hash myself.
4. **Read the file at that path.**

## Commands

```bash
# 1. Find the job and read its script
cd /etc/cron.d
ls
cat cronjob_bandit23
cat /usr/bin/cronjob_bandit23.sh

# Important part of the script:
#   myname=$(whoami)
#   mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

# 2. Compute the target filename as if I were bandit23
echo "I am user bandit23" | md5sum | cut -d ' ' -f 1

# 3. Read the file
cat /tmp/8ca319486bfbbc3663ea0fbe81326349
```

## Result

The file in `/tmp` contains the password for `bandit23`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Reproducing a script's logic with different inputs is a powerful technique.
- `cut -d ' ' -f 1` extracts the first field of a line.

## References

- `man md5sum`
- `man cut`

---

⬅️ [Level 21](../21/README.md) · [Back to index](../README.md) · ➡️ [Level 23](../23/README.md)
