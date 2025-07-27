# zshclean.plugin.zsh
# Description: Zsh plugin to clean up temporary files and clutter from $HOME

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

linux_temp_files=()
	".local/share/Trash"
	".sudo_as_admin_successful"
	".xsession-errors"
	".thumbnails"
)
