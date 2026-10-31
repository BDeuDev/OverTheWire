# Bandit — Level 32 → 33

> Official description: <https://overthewire.org/wargames/bandit/bandit33.html>

| Info | Value |
|------|-------|
| **User** | `bandit32` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | Escaping a restricted shell |

---

## Goal

After logging in as `bandit32`, I'm dropped into an "uppercase shell" that converts everything I type to uppercase before running it.

## Thought process

1. **Commands break.** `ls` becomes `LS`, which doesn't exist, so normal commands are useless.
2. **What isn't affected by uppercase?** Special shell variables like `$0` have no letters.
3. **`$0` is the shell itself.** Running `$0` starts a new `sh`, which doesn't convert my input.
4. **Who am I?** The uppercase shell is setuid, so the new shell runs as `bandit33`.

## Commands

```bash
# 1. Inside the uppercase shell: start a normal shell
$0

# 2. Check the current user
whoami

# 3. Read the next password
cat /etc/bandit_pass/bandit33
```

## Result

`whoami` returns `bandit33`, and the password file can be read.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `$0` holds the name of the running shell or script; executing it spawns a new one.
- Input filters can often be bypassed with characters they don't touch.

## References

- `man sh` (Special Parameters)

---

⬅️ [Level 31](../31/README.md) · [Back to index](../README.md)
