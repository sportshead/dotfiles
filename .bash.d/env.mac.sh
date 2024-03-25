if [[ "$OSTYPE" =~ ^darwin ]]; then
	export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

	export BASH_SILENCE_DEPRECATION_WARNING=1

	if [ "$(arch)" = "arm64" ]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
		export PATH="/opt/homebrew/opt/curl/bin:$PATH"
		[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
		export HOMEBREW_FORCE_BREWED_CURL=1
	else
		eval "$(/usr/local/bin/brew shellenv)"
	fi

	if type brew &>/dev/null; then
		HOMEBREW_PREFIX="$(brew --prefix)"
		if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
			source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
		else
			for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
				[[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
			done
		fi
	fi

	export HOMEBREW_CASK_OPTS="--no-quarantine"

	ulimit -S -n 8192

	export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

	export CURL_SSL_BACKEND=secure-transport

	export PATH="$HOME/.jenv/bin:$PATH"
	# https://github.com/jenv/jenv/issues/148#issuecomment-230259636
	eval "$(jenv init - --no-rehash)"
	(jenv rehash &) 2>/dev/null

	export PATH="$PATH:$HOME/.pub-cache/bin"

	export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
	export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
	export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

	export CHROME_EXECUTABLE="/opt/homebrew/bin/chromium"

	source "$(brew --prefix)/share/google-cloud-sdk/path.bash.inc"
	source "$(brew --prefix)/share/google-cloud-sdk/completion.bash.inc"

	export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

	export PATH="$(brew --prefix llvm@16)/bin:$PATH"
	export PATH="$HOME/.linkerd2/bin:$PATH"

	export PATH="$(brew --prefix)/anaconda3/bin:$PATH"

	if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
	fi

	source ~/.orbstack/shell/init.bash 2>/dev/null || :
fi
