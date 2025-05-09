if [[ "$OSTYPE" =~ ^darwin ]]; then
	export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

	export BASH_SILENCE_DEPRECATION_WARNING=1

	if [ "$(arch)" = "arm64" ]; then
		eval "$(/opt/homebrew/bin/brew shellenv)"
		export PATH="/opt/homebrew/opt/curl/bin:$PATH"
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
		export LDFLAGS="-L$HOMEBREW_PREFIX/lib"
		export CPPFLAGS="-I$HOMEBREW_PREFIX/include"
	fi

	export HOMEBREW_CASK_OPTS="--no-quarantine"

	export HOMEBREW_NO_INSTALL_FROM_API=1

	ulimit -S -n 8192

	export SSH_AUTH_SOCK="$HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh"

	export CURL_SSL_BACKEND=secure-transport

	export PATH="$HOME/.jenv/bin:$PATH"
	# https://github.com/jenv/jenv/issues/148#issuecomment-230259636
	eval "$(jenv init - --no-rehash)"
	(jenv rehash &) 2>/dev/null

	export PATH="$PATH:$HOME/.pub-cache/bin"

	export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
	export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

	export CHROME_EXECUTABLE="/opt/homebrew/bin/chromium"

	export PROXYCHAINS_CONF_FILE="$HOME/.config/proxychains/proxychains.conf"

	export PATH="$(brew --prefix llvm@18)/bin:$PATH"
	export PATH="$HOME/.linkerd2/bin:$PATH"

	source ~/.orbstack/shell/init.bash 2>/dev/null || :

	export MODULAR_HOME="$HOME/.modular"
	export PATH="$HOME/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
fi
