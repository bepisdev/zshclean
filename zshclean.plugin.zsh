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
	".local/state/nvim/swap/*.swp"
)

zshclean_macos_temp_files=(
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

zshclean_linux_temp_files=(
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
	# define options
	local dry_run=0
	local inspect_flag=0

	# Look for -n or --dry-run option
	if [[ "$1" == "-n" || "$1" == "--dry-run" ]]; then
		echo "Dry run mode: No files will be deleted."
		dry_run=1
	else
		echo "Cleaning up temporary files and clutter from \$HOME..."
	fi

	if [[ "$1" == "-i" || "$1" == "--inspect" ]]; then
		echo "zshclean inspection. Listing target file lists"
		echo "\n"
		echo "Common Files: (Applies to all systems)"
		echo "======================================================"
		for i in "${zshclean_common_temp_files[@]}"; do
			echo "$i"
		done
		echo "Linux Files: (Applies to Linux based systems)"
		echo "======================================================"
		for i in "${zshclean_linux_temp_files[@]}"; do
			echo "$i"
		done
		echo "MacOS Files: (Applies to MacOS / Darwin systems)"
		echo "======================================================"
		for i in "${zshclean_macos_temp_files[@]}"; do
			echo "$i"
		done
		exit 0
	fi

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
				if [[ $dry_run -eq 0 ]]; then
					echo "Removing directory: $zshclean_file_path"
					rm -rf "$zshclean_file_path"
				else
					echo "Dry run: Would remove directory: $zshclean_file_path"
				fi
			else
				if [[ $dry_run -eq 0 ]]; then
					echo "Removing file: $zshclean_file_path"
					rm -f "$zshclean_file_path"
				else
					echo "Dry run: Would remove file: $zshclean_file_path"
				fi
			fi
		else
			echo "File/Directory does not exist: $zshclean_file_path"
		fi
	done
}
