# Bandit — Level 10 → 11

> Official description: <https://overthewire.org/wargames/bandit/bandit11.html>

| Info | Value |
|------|-------|
| **User** | `bandit10` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | Base64 |

---

## Goal

The password is stored in `data.txt`, which contains base64 encoded data.

## Thought process

1. **Recognise the encoding.** The content is letters, digits, `+`, `/` and ends with `=` padding, typical of base64.
2. **Decode it.** `base64 -d` reverses the encoding.

## Commands

```bash
# Decode the base64 content
base64 -d data.txt
```

## Result

The decoded text contains the password for `bandit11`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- Base64 is an encoding, not encryption: anyone can decode it.
- Trailing `=` characters are a strong hint that data is base64.

## References

- `man base64`

---

⬅️ [Level 9](../9/README.md) · [Back to index](../README.md) · ➡️ [Level 11](../11/README.md)
