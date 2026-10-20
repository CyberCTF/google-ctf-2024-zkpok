#!/bin/sh
# >>> isoloom-1.0 secret-from-file shim (auto-added by convert-lab.py) >>>
# Inputs now arrive as files (isoloom.yml `files:`), not environment variables.
# Read each into its old variable when unset, keeping the dev/CI fallback working.
for __p in CTF_FLAG_MAIN:/run/lab/ctf_flag_main; do
  __n=${__p%%:*}; __f=${__p#*:}
  eval "__v=\${$__n:-}"
  if [ -z "$__v" ] && [ -s "$__f" ]; then
    __v=$(tr -d '\r\n' < "$__f"); eval "export $__n=\"\$__v\""
  fi
done
unset __p __n __f __v 2>/dev/null || true
# <<< isoloom-1.0 secret-from-file shim <<<
# Places the player's flag (CTF_FLAG_MAIN, given by the launcher) in the message the challenge
# reveals (/chroot/home/user/message.txt); without one (CI, a run by hand) the development flag.
dev='CTF{dev-google-ctf-2024-zkpok}'
v="${CTF_FLAG_MAIN:-$dev}"
f=/chroot/home/user/message.txt
printf 'I am convinced that you have the plaintext, so I am willing to send you once more.\nHere is the flag: %s.\n\nCongratulations!\n' "$v" > "$f"
chmod 444 "$f"
