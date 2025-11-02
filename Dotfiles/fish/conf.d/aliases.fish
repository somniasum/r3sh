# Modern CLI tool aliases
if type -q eza
    alias ls='eza --icons'
    alias ll='eza -l --icons'
    alias la='eza -la --icons'
    alias lt='eza --tree --icons'
end

if type -q bat
    alias cat='bat --style=plain'
    alias ccat='bat'
end

if type -q fd
    alias find='fd'
end

if type -q rg
    alias grep='rg'
end

if type -q dust
    alias du='dust'
end

if type -q procs
    alias ps='procs'
end

if type -q delta
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
end
