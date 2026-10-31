# OverTheWire — Wargames

> My solutions, notes and scripts for the [OverTheWire](https://overthewire.org/) wargames.

![Platform](https://img.shields.io/badge/platform-OverTheWire-black)
![Wargames](https://img.shields.io/badge/wargames-1-blue)
![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-lightgrey)

---

## What is this?

[OverTheWire](https://overthewire.org/) hosts free wargames that teach security concepts through hands-on challenges. Each game is a series of levels: you log in over SSH, find the password for the next level, and move on.

This repo is my learning log. For each level I write down **how I reasoned through it**, the **commands I used**, and **what I learned**.

## Wargames

| Wargame | Focus | Levels | Status | Notes |
|---------|-------|:------:|:------:|:-----:|
| [Bandit](https://overthewire.org/wargames/bandit/) | Linux basics, shell, SSH, networking, cron, git | 0 → 33 | ✅ Completed | [View](Bandit/README.md) |

## Repo structure

```
OverTheWire/
├── README.md            ← you are here
└── Bandit/
    ├── README.md        ← wargame overview + progress table
    ├── .gitignore       ← keeps passwords and keys out of git
    ├── 0/
    │   ├── README.md    ← level writeup
    │   └── commands.txt ← raw commands I used
    ├── ...
    └── 32/
```

Each wargame lives in its own folder, and inside it folder `N/` has the solution for **level N → N+1**.

## Secrets

Level passwords (`password.txt`) and private keys (`sshkey.private`) are kept locally but **not committed**: each wargame folder has a `.gitignore` that excludes them.

## Spoiler warning

This repo contains solutions. If you're playing these games, try each level on your own first — the fun is in the struggle.

## Credits

All credit for the wargames goes to **[OverTheWire](https://overthewire.org/)** and its community, who create and maintain them for free.

This repository is not affiliated with OverTheWire; it's just personal study material.
