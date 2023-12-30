#!/usr/bin/env bash

fzf_cd_or_open() {
	local file
	file=$(fd --glob "*" --type d | fzf --prompt '>Directories> ' --header 'CTRL-D: Directories / CTRL-F: Files' --bind 'ctrl-d:change-prompt(Directories> )+reload(fd --glob "*" --type d)' --bind 'ctrl-f:change-prompt(Files> )+reload(fd --glob "*" --type f)')
      
	if [[ -n "$file" ]]; then
	   if [[ -d "$file" ]]; then
		cd "$file" || return
	   elif [[ -f "$file" ]]; then
		${EDITOR} "$file"
	   fi
	fi
}

fzf_cd_or_open



