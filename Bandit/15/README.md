# Bandit — Level 15 → 16

> Official description: <https://overthewire.org/wargames/bandit/bandit16.html>

| Info | Value |
|------|-------|
| **User** | `bandit15` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | SSL/TLS with `openssl` |

---

## Goal

The password for the next level is returned when submitting the current password to port `30001` on `localhost` using SSL/TLS encryption.

## Thought process

1. **Same as before, but encrypted.** Plain `nc` won't work because the service expects a TLS handshake.
2. **Use a TLS client.** `openssl s_client -connect` opens an encrypted connection.
3. **Keep it open.** `-ign_eof` stops `openssl` from closing the connection as soon as stdin ends, so I get to see the reply.

## Commands

```bash
# Send the current password over TLS to port 30001
cat /etc/bandit_pass/bandit15 | openssl s_client -connect localhost:30001 -ign_eof
```

## Result

After the TLS handshake output, the service replies with the password for `bandit16`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `openssl s_client` is like netcat for TLS services.
- `-ign_eof` keeps the connection open after input ends.

## References

- `man s_client`

---

⬅️ [Level 14](../14/README.md) · [Back to index](../README.md) · ➡️ [Level 16](../16/README.md)
