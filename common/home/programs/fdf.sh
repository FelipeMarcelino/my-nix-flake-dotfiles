fzf_cd_or_open() {
    local item
    item=$(fd --glob "*" | fzf --prompt '> ' \
        --header 'CTRL-D: Directories / CTRL-F: Files' \
        --bind 'ctrl-d:change-prompt(Directories> )+reload(fd --glob "*" --type d)' \
        --bind 'ctrl-f:change-prompt(Files> )+reload(fd --glob "*" --type f)')

    if [[ -n "$item" ]]; then
        if [[ -d "$item" ]]; then
            # For directories, use 'builtin cd' to ensure it affects the current shell
            builtin cd "$item" || return
        elif [[ -f "$item" ]]; then
            # Open files with the specified editor
            ${EDITOR:-nvim} "$item"
        fi
    fi
}

