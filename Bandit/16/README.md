# Bandit — Level 16 → 17

> Official description: <https://overthewire.org/wargames/bandit/bandit17.html>

| Info | Value |
|------|-------|
| **User** | `bandit16` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | Port scanning with `nmap` |

---

## Goal

The credentials for the next level are returned when submitting the current password to a port on `localhost` in the range `31000-32000`. Only one port speaks SSL/TLS and gives back the credentials; the others just echo the input.

## Thought process

1. **Find open ports.** Scan the range with `nmap`.
2. **Find which ones speak TLS.** The `ssl-cert` script only gets a result on ports that use TLS.
3. **Test the candidates.** I send the password to each TLS port; most echo it back, but one returns an RSA private key.
4. **Save the key.** That key is the login for `bandit17` (saved as `sshkey.private` in this folder, not committed).

## Commands

```bash
# 1. Scan the range and check which ports use TLS
nmap -p 31000-32000 --script ssl-cert localhost

# 2. Try each TLS candidate (replace 31xxx with the port)
openssl s_client -connect localhost:31xxx -ign_eof

# 3. Plain-text ports just echo the input
cat /etc/bandit_pass/bandit16 | nc localhost 31xxx

# 4. The right port returns a private key
cat /etc/bandit_pass/bandit16 | openssl s_client -connect localhost:31790 -ign_eof
```

## Result

Port `31790` replies with an RSA private key used to log in as `bandit17`.

> I store the key in `sshkey.private`, which is **not committed** to the repo.

## What I learned

- `nmap -p <range>` scans a range of ports.
- NSE scripts like `ssl-cert` help identify services that use TLS.
- Credentials aren't always passwords; sometimes they're keys.

## References

- `man nmap`
- `man s_client`

---

⬅️ [Level 15](../15/README.md) · [Back to index](../README.md) · ➡️ [Level 17](../17/README.md)
