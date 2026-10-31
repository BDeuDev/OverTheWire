# Bandit — Level 11 → 12

> Official description: <https://overthewire.org/wargames/bandit/bandit12.html>

| Info | Value |
|------|-------|
| **User** | `bandit11` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐☆☆☆ |
| **Topics** | ROT13 with `tr` |

---

## Goal

The password is stored in `data.txt`, where all lowercase and uppercase letters have been rotated by 13 positions.

## Thought process

1. **Recognise the cipher.** Rotating letters by 13 is ROT13.
2. **ROT13 is its own inverse.** Applying it again decodes the text.
3. **Use `tr`.** `tr` maps one set of characters to another, so I map `N-ZA-M` back to `A-Z` (same for lowercase).

## Commands

```bash
# Rotate every letter back by 13 positions
cat data.txt | tr 'N-ZA-Mn-za-m' 'A-Za-z'
```

## Result

The decoded text contains the password for `bandit12`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `tr` translates characters set by set, which is perfect for simple substitution ciphers.
- ROT13 applied twice gives back the original text.

## References

- `man tr`

---

⬅️ [Level 10](../10/README.md) · [Back to index](../README.md) · ➡️ [Level 12](../12/README.md)
