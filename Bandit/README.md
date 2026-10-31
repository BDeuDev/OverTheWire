# OverTheWire — Bandit

> My solutions and notes for the **Bandit** wargame by [OverTheWire](https://overthewire.org/wargames/bandit/).

![Wargame](https://img.shields.io/badge/wargame-Bandit-blue)
![Platform](https://img.shields.io/badge/platform-OverTheWire-black)
![Levels](https://img.shields.io/badge/levels-0%E2%86%9233-green)
![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-lightgrey)

---

## What is this?

**Bandit** is OverTheWire's first wargame, designed to teach the basics of Linux and security: navigating the filesystem, text manipulation, permissions, SSH, networking, `cron`, `git` and more. Each level hides the password for the next one, and finding it means using the right tools.

This repo is my learning log: for each level I record **how I reasoned through the problem**, the **commands I used**, and what I learned.

## Repo structure

```
bandit/
├── README.md          ← you are here
├── 00/
│   ├── README.md      ← level writeup (thought process + commands)
│   └──commands.txt   ← raw commands I used
├── 01/
├── ...
└── 32/
```

- Folder `N/` contains the solution for **level N → N+1**.
- Some levels include scripts (`script.sh`, `script.zsh`) I wrote to solve them.
- Passwords (`password.txt`) and private keys (`sshkey.private`) are **not committed** (they're in `.gitignore`).

## How to connect

```bash
ssh -p 2220 bandit0@bandit.labs.overthewire.org
# level 0 password: bandit0
```

For the other levels, change the user (`bandit1`, `bandit2`, ...) and use the password found in the previous level.

## Progress

| Level | Main topic | Writeup |
|:-----:|------------|:-------:|
| 00 | SSH login, reading a file | [View](00/README.md) |
| 01 | Special filenames (`-`) | [View](01/README.md) |
| 02 | Filenames with spaces and dashes | [View](02/README.md) |
| 03 | Hidden files | [View](03/README.md) |
| 04 | File types | [View](04/README.md) |
| 05 | `find` with filters | [View](05/README.md) |
| 06 | `find` by owner, group and size | [View](06/README.md) |
| 07 | `grep` | [View](07/README.md) |
| 08 | `sort` and `uniq` | [View](08/README.md) |
| 09 | `strings` on binary data | [View](09/README.md) |
| 10 | Base64 | [View](10/README.md) |
| 11 | ROT13 with `tr` | [View](11/README.md) |
| 12 | Hexdumps and repeated compression | [View](12/README.md) |
| 13 | SSH private keys | [View](13/README.md) |
| 14 | Netcat | [View](14/README.md) |
| 15 | SSL/TLS with `openssl` | [View](15/README.md) |
| 16 | Port scanning with `nmap` | [View](16/README.md) |
| 17 | `diff` | [View](17/README.md) |
| 18 | Running commands over SSH | [View](18/README.md) |
| 19 | setuid binaries | [View](19/README.md) |
| 20 | Network listener + setuid client | [View](20/README.md) |
| 21 | cron jobs | [View](21/README.md) |
| 22 | Reading shell scripts | [View](22/README.md) |
| 23 | Writing a script for cron | [View](23/README.md) |
| 24 | Brute forcing a PIN | [View](24/README.md) |
| 25 | Escaping `more` and `vim` | [View](25/README.md) |
| 26 | setuid binaries (again) | [View](26/README.md) |
| 27 | Cloning a git repo over SSH | [View](27/README.md) |
| 28 | git history | [View](28/README.md) |
| 29 | git branches | [View](29/README.md) |
| 30 | git tags | [View](30/README.md) |
| 31 | git push and `.gitignore` | [View](31/README.md) |
| 32 | Escaping a restricted shell | [View](32/README.md) |

## Frequently used tools

`ssh` · `sshpass` · `ls` · `cat` · `file` · `find` · `grep` · `sort` · `uniq` · `strings` · `base64` · `tr` · `xxd` · `tar` / `gzip` / `bzip2` · `nc` · `openssl` · `nmap` · `cron` · `git`

## Spoiler warning

This repo contains solutions. If you're playing Bandit, I recommend trying it on your own first — the fun is in struggling with each level.

## Credits

All credit for the wargame goes to **[OverTheWire](https://overthewire.org/)** and its community, who create and maintain Bandit and many other wargames for free.

- Official site: <https://overthewire.org/wargames/bandit/>
- Home page: <https://overthewire.org/>

This repository is not affiliated with OverTheWire; it's just personal study material.
