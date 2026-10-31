# Bandit — Level 24 → 25

> Official description: <https://overthewire.org/wargames/bandit/bandit25.html>

| Info | Value |
|------|-------|
| **User** | `bandit24` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | Brute forcing a PIN |

---

## Goal

A daemon listens on port `30002`. It returns the next password if given the current password and a secret 4-digit PIN. The only way to get the PIN is to try all 10000 combinations.

## Thought process

1. **Brute force is required.** 4 digits is only 10000 options, so trying all of them is feasible.
2. **One connection, many attempts.** Opening 10000 connections is slow; the daemon accepts many lines on the same connection.
3. **Generate all attempts.** A loop with `seq -w 0 9999` prints `password PIN` with zero-padded PINs, piped into a single `nc` (see `script.sh`).
4. **Find the hit.** Among all the "Wrong!" replies, one says "Correct!" and shows the password.

## Commands

```bash
# 1. Work in a temporary directory
cd $(mktemp -d)

# 2. Write the brute-force script (contents in script.sh)
vim script.sh

# 3. Run it
chmod +x script.sh
./script.sh
```

## Result

One of the replies is "Correct!" followed by the password for `bandit25`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `seq -w` pads numbers with leading zeros (`0000`, `0001`, ...).
- Piping a loop into one `nc` sends every attempt over a single connection.
- Short PINs are trivially brute-forceable without rate limiting.

## References

- `man seq`
- `man nc`
- `script.sh` in this folder

---

⬅️ [Level 23](../23/README.md) · [Back to index](../README.md) · ➡️ [Level 25](../25/README.md)
