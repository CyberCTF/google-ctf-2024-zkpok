#!/bin/sh
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) in the message the challenge
# reveals (/chroot/home/user/message.txt); without one (CI, a run by hand) the development flag.
dev='CTF{dev-google-ctf-2024-zkpok}'
v="${CTF_FLAG_MAIN:-$dev}"
f=/chroot/home/user/message.txt
printf 'I am convinced that you have the plaintext, so I am willing to send you once more.\nHere is the flag: %s.\n\nCongratulations!\n' "$v" > "$f"
chmod 444 "$f"
