if [[ $(whence -w gc) != function* ]]; then
	unalias gc 2>/dev/null   # clear alias if it exists
	function gc() { git commit -m "$1" -m "$2" }
fi
if [[ $(whence -w tg) != function* ]]; then
	unalias tg 2>/dev/null   # clear alias if it exists
	function tg() { git tag -a "$1" -m "$2" }
fi

nvim() {
	if ! pgrep -x socat > /dev/null; then
		socat UNIX-LISTEN:/tmp/discord-ipc-0,fork \
		EXEC:"/mnt/c/Users/elpib/go/bin/npiperelay.exe -ep -s //./pipe/discord-ipc-0" &
	fi
	command nvim "$@"
}

function sesh-sessions() {
	{
		exec </dev/tty
		exec <&1
		local session
		session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
		zle reset-prompt > /dev/null 2>&1 || true
		[[ -z "$session" ]] && return
		sesh connect $session
	}
}

zle     -N             sesh-sessions
bindkey -M emacs '\es' sesh-sessions
bindkey -M vicmd '\es' sesh-sessions
bindkey -M viins '\es' sesh-sessions
