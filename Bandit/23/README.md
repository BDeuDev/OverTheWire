# Bandit — Level 23 → 24

> Official description: <https://overthewire.org/wargames/bandit/bandit24.html>

| Info | Value |
|------|-------|
| **User** | `bandit23` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | Writing a script for cron |

---

## Goal

A cron job runs regularly as `bandit24`. This time I need to write my own shell script for it to execute.

## Thought process

1. **Read the job.** `cronjob_bandit24.sh` runs every script in `/var/spool/bandit24/foo` as `bandit24` and then deletes it.
2. **Plan.** If I drop a script there, it runs with `bandit24`'s permissions, so it can read `/etc/bandit_pass/bandit24`.
3. **Write the script.** It creates a directory in `/tmp`, writes the password into it and makes it readable for me (see `script.sh`).
4. **Deploy and wait.** Make it executable, copy it to the spool directory and wait up to a minute for cron to run it.

## Commands

```bash
# 1. Read the cron job and its script
cd /etc/cron.d
cat cronjob_bandit24
cat /usr/bin/cronjob_bandit24.sh

# 2. Write the script in a temporary directory
cd $(mktemp -d)
vim script.sh          # contents in script.sh

# 3. Make it executable and drop it in the spool directory
chmod a+x script.sh
cp script.sh /var/spool/bandit24/foo

# 4. Wait for cron, then read the output
cat /tmp/tetete/password
```

## Result

After cron runs the script, `/tmp/tetete/password` contains the password for `bandit24`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Anything executed by a privileged cron job inherits its privileges.
- Output must go somewhere I can read, so permissions on the output matter.
- The script has to be executable (`chmod +x`), or it won't run.

## References

- `man cron`
- `man chmod`
- `script.sh` in this folder

---

⬅️ [Level 22](../22/README.md) · [Back to index](../README.md) · ➡️ [Level 24](../24/README.md)
