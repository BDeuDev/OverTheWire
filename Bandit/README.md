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
├── 0/
│   ├── README.md      ← level writeup (thought process + commands)
│   └──commands.txt   ← raw commands I used
├── 1/
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
| 0 | SSH login, reading a file | [View](0/README.md) |
| 1 | Special filenames (`-`) | [View](1/README.md) |
| 2 | Filenames with spaces and dashes | [View](2/README.md) |
| 3 | Hidden files | [View](3/README.md) |
| 4 | File types | [View](4/README.md) |
| 5 | `find` with filters | [View](5/README.md) |
| 6 | `find` by owner, group and size | [View](6/README.md) |
| 7 | `grep` | [View](7/README.md) |
| 8 | `sort` and `uniq` | [View](8/README.md) |
| 9 | `strings` on binary data | [View](9/README.md) |
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
