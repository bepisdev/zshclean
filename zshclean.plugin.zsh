# zshclean.plugin.zsh
# Description: Zsh plugin to clean up temporary files and clutter from $HOME

zshclean_common_temp_files=(
	".cache"
	".lesshst"
	".viminfo"
	".zcompcache"
	".zcompdump"
	".zsh_history"
	".zsh_sessions"
	"*.zwc"
)

zshclean_macos_temp_files=()
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

zshclean_linux_temp_files=()
	".local/share/Trash"
	".sudo_as_admin_successful"
	".xsession-errors"
	".thumbnails"
)

zshclean_detect_os() {
	local unameOut
	unameOut=$(uname -s)
	case "${unameOut}" in
		Linux*) echo "linux";;
		Darwin*) echo "macos";;
		*) echo "unknown";;
	esac
}

zshclean() {
	local os_type
	os_type=$(zshclean_detect_os)

	if [[ "$os_type" == "unknown" ]]; then
		echo "Unsupported OS type: $os_type"
		return 1
	fi

	if [[ "$os_type" == "macos" ]]; then
		local temp_files=("${zshclean_common_temp_files[@]}" "${zshclean_macos_temp_files[@]}")
	elif [[ "$os_type" == "linux" ]]; then
		local temp_files=("${zshclean_common_temp_files[@]}" "${zshclean_linux_temp_files[@]}")
	fi

	for file in "${temp_files[@]}"; do
		local zshclean_file_path="$HOME/$file"
		
		if [[ -e "$zshclean_file_path" ]]; then
			if [[ -d "$zshclean_file_path" ]]; then
				echo "Removing directory: $zshclean_file_path"
				rm -rf "$zshclean_file_path"
			else
				echo "Removing file: $zshclean_file_path"
				rm -f "$zshclean_file_path"
			fi
		else
			echo "File/Directory does not exist: $zshclean_file_path"
		fi
	done
}
