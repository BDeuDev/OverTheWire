# Bandit — Level 14 → 15

> Official description: <https://overthewire.org/wargames/bandit/bandit15.html>

| Info | Value |
|------|-------|
| **User** | `bandit14` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | Netcat |

---

## Goal

The password for the next level is returned when submitting the current password to port `30000` on `localhost`.

## Thought process

1. **Send data to a port.** `nc` (netcat) opens a TCP connection and sends whatever it receives on stdin.
2. **Get the current password.** It's in `/etc/bandit_pass/bandit14`.
3. **Pipe one into the other.** `cat` the password into `nc localhost 30000`.

## Commands

```bash
# Send the current password to port 30000
cat /etc/bandit_pass/bandit14 | nc localhost 30000
```

## Result

The service replies "Correct!" followed by the password for `bandit15`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `nc host port` is the simplest way to talk to a TCP service.
- Pipes let me feed a file directly into a network connection.

## References

- `man nc`

---

⬅️ [Level 13](../13/README.md) · [Back to index](../README.md) · ➡️ [Level 15](../15/README.md)
