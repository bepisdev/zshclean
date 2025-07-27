# zshclean.plugin.zsh
# Description: Zsh plugin to clean up temporary files and clutter from $HOME

# Common temp files across systems
common_temp_files=(
	".cache"
	".lesshst"
	".viminfo"
	".zcompcache"
	".zcompdump"
	".zsh_history"
	".zsh_sessions"
	"*.zwc"
)

# MacOS Specific temp files
macos_temp_files=()
	".DS_Store"
	".Trash"
  ".CFUserTextEncoding"
  ".DocumentRevisions-V100"
  ".fseventsd"
  ".Spotlight-V100"
  "Library/Application Support/CrashReporter"
	"Library/Caches"
  "Library/Logs"
)

# Linux specific temp files
linux_temp_files=()
	".local/share/Trash"
	".sudo_as_admin_successful"
	".xsession-errors"
	".thumbnails"
)

# OS detection function
zshclean_detect_os() {}
	local unameOut
	unameOut=$(uname -s)
	case "${unameOut}" in
		Linux*) echo "linux";;
		Darwin*) echo "macos";;
		*) echo "unknown";;
	esac
}
