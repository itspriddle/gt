if [[ ! -o interactive ]]; then
    return
fi

compctl -K _gt gt

_gt() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(gt commands)"
  else
    completions="$(gt completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
