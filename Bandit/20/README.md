# Bandit — Level 20 → 21

> Official description: <https://overthewire.org/wargames/bandit/bandit21.html>

| Info | Value |
|------|-------|
| **User** | `bandit20` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | Network listener + setuid client |

---

## Goal

There is a setuid binary `suconnect` in the home directory. It connects to `localhost` on the port I give it, reads a line, and if it matches the current password, sends back the next one.

## Thought process

1. **I need a server.** `suconnect` is a client, so something has to listen on a port first.
2. **Netcat as a server.** `nc -lp <port>` listens on a port; I pipe the current password into it so it's sent to whoever connects.
3. **Run both at once.** I put the listener in the background with `&`, then run `suconnect` against the same port.
4. **Read the reply.** The listener prints what `suconnect` sends back: the next password.

## Commands

```bash
# 1. Start a listener that sends the current password, in the background
cat /etc/bandit_pass/bandit20 | nc -lp 12345 &

# 2. Make suconnect connect to it
./suconnect 12345
```

## Result

`suconnect` confirms the password matches, and the listener prints the password for `bandit21`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `nc -l -p <port>` turns netcat into a simple TCP server.
- `&` runs a command in the background (`jobs` / `fg` to manage it).

## References

- `man nc`
- `man bash` (JOB CONTROL)

---

⬅️ [Level 19](../19/README.md) · [Back to index](../README.md) · ➡️ [Level 21](../21/README.md)
