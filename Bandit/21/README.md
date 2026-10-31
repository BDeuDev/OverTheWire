# Bandit — Level 21 → 22

> Official description: <https://overthewire.org/wargames/bandit/bandit22.html>

| Info | Value |
|------|-------|
| **User** | `bandit21` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | cron jobs |

---

## Goal

A program is running automatically at regular intervals from `cron`. I have to look in `/etc/cron.d/` to see what command is being executed.

## Thought process

1. **Find the job.** `/etc/cron.d/` has a file `cronjob_bandit22`.
2. **See what it runs.** The job runs `/usr/bin/cronjob_bandit22.sh` as `bandit22`.
3. **Read the script.** It copies `bandit22`'s password into a file in `/tmp` with a random-looking name and makes it world-readable.
4. **Read that file.**

## Commands

```bash
# 1. Look at the cron configuration
cd /etc/cron.d
cat cronjob_bandit22

# 2. Read the script the job runs
cat /usr/bin/cronjob_bandit22.sh

# 3. Read the file the script writes to
cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```

## Result

The file in `/tmp` contains the password for `bandit22`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `/etc/cron.d/` holds system cron jobs; each line is `schedule user command`.
- Reading scripts run by privileged jobs often reveals how to get their output.

## References

- `man cron`
- `man 5 crontab`

---

⬅️ [Level 20](../20/README.md) · [Back to index](../README.md) · ➡️ [Level 22](../22/README.md)
