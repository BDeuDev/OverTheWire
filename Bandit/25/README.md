# Bandit — Level 25 → 26

> Official description: <https://overthewire.org/wargames/bandit/bandit26.html>

| Info | Value |
|------|-------|
| **User** | `bandit25` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐⭐☆ |
| **Topics** | Escaping `more` and `vim` |

---

## Goal

Logging in to `bandit26` from `bandit25` should be easy, but the shell for `bandit26` is not `/bin/bash`. I have to find out what it is and break out of it.

## Thought process

1. **Get the key.** The home of `bandit25` has `bandit26.sshkey` (saved here as `sshkey.private`, not committed).
2. **What's the shell?** `/etc/passwd` shows that `bandit26` uses `/usr/bin/showtext`, which runs `more` on a file and then exits.
3. **Make `more` pause.** `more` only waits for input if the text doesn't fit on the screen, so I make my terminal tiny.
4. **`more` → `vim`.** Pressing `v` inside `more` opens the file in `vim`.
5. **`vim` → shell.** In `vim` I set a real shell and launch it.

## Commands

```bash
# 1. Check bandit26's login shell (on the server, as bandit25)
grep bandit26 /etc/passwd
cat /usr/bin/showtext

# 2. On my machine: shrink the terminal so 'more' paginates, then log in
stty rows 5 columns 80
ssh -p 2220 -i sshkey.private bandit26@bandit.labs.overthewire.org

# 3. Inside 'more': open vim
v

# 4. Inside vim: set a real shell and start it
:set shell=/bin/sh
:!sh
```

## Result

I get a real shell as `bandit26`, where `cat /etc/bandit_pass/bandit26` shows its password.

> I store the key in `sshkey.private`, which is **not committed** to the repo.

## What I learned

- A user's login shell is defined in `/etc/passwd` and can be any program.
- Pagers like `more` and editors like `vim` can often spawn shells.
- `stty rows N columns M` changes the terminal size reported to programs.

## References

- `man more`
- `man stty`
- [GTFOBins: more](https://gtfobins.github.io/gtfobins/more/)
- [GTFOBins: vim](https://gtfobins.github.io/gtfobins/vim/)

---

⬅️ [Level 24](../24/README.md) · [Back to index](../README.md) · ➡️ [Level 26](../26/README.md)
