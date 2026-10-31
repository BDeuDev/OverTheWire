# Bandit — Level 12 → 13

> Official description: <https://overthewire.org/wargames/bandit/bandit13.html>

| Info | Value |
|------|-------|
| **User** | `bandit12` |
| **Host** | `bandit.labs.overthewire.org` |
| **Port** | `2220` |
| **Difficulty** | ⭐⭐⭐☆☆ |
| **Topics** | Hexdumps and repeated compression |

---

## Goal

The password is stored in `data.txt`, which is a hexdump of a file that has been repeatedly compressed.

## Thought process

1. **Work somewhere writable.** The home directory is read-only, so I create a temporary directory with `mktemp -d` and copy the file there.
2. **Undo the hexdump.** `xxd -r` turns the hexdump back into the original binary.
3. **Peel the layers.** I run `file` on the result to see which compression it uses (gzip, bzip2 or tar), rename it with the right extension and decompress it.
4. **Repeat.** I keep doing `file` → rename → decompress until `file` says "ASCII text".

## Commands

```bash
# 1. Create a working directory and copy the file
cd $(mktemp -d)
cp ~/data.txt .

# 2. Reverse the hexdump into binary
xxd -r data.txt > bin

# 3. Check the type of the current layer
file bin

# 4. Rename and decompress depending on what 'file' says
mv bin bin.gz   && gzip -d bin.gz       # gzip compressed data
mv bin bin.bz2  && bzip2 -d bin.bz2     # bzip2 compressed data
mv bin bin.tar  && tar -xvf bin.tar     # POSIX tar archive (extracts a new file)

# 5. Repeat steps 3-4 until it's ASCII text, then read it
cat bin
```

## Result

After all the layers are removed, the final file contains the password for `bandit13`.

> I store it in `password.txt`, which is **not committed** to the repo.

## What I learned

- `xxd -r` converts a hexdump back into binary data.
- `file` is essential when the extension is missing or wrong.
- `gzip` and `bzip2` expect the right extension when decompressing.
- `mktemp -d` creates a safe, unique temporary directory.

## References

- `man xxd`
- `man file`
- `man gzip`
- `man bzip2`
- `man tar`

---

⬅️ [Level 11](../11/README.md) · [Back to index](../README.md) · ➡️ [Level 13](../13/README.md)
