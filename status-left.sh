#!/usr/bin/env bash
#Print the status-left for tmux.
#
# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Mute this statusbar?
mute_status_check "left"

# Segments

declare -A tmux_session_info
tmux_session_info+=(["script"]="${segments_path}/tmux_session_info.sh")
tmux_session_info+=(["foreground"]="colour234")
tmux_session_info+=(["background"]="colour148")
tmux_session_info+=(["separator"]="${separator_right_bold}")
#tmux_session_info+=(["separator_fg"]="default")
register_segment "tmux_session_info"

declare -A hostname
hostname+=(["script"]="${segments_path}/hostname.sh")
hostname+=(["foreground"]="colour0")
hostname+=(["background"]="colour33")
hostname+=(["separator"]="${separator_right_bold}")
register_segment "hostname"

declare -A pwd
pwd+=(["script"]="${segments_path}/pwd.sh")
pwd+=(["foreground"]="colour211")
pwd+=(["background"]="colour89")
pwd+=(["separator"]="${separator_right_bold}")
register_segment "pwd"

declare -A vcs_branch
vcs_branch+=(["script"]="${segments_path}/vcs_branch.sh")
vcs_branch+=(["foreground"]="colour88")
vcs_branch+=(["background"]="colour29")
vcs_branch+=(["separator"]="${separator_right_bold}")
register_segment "vcs_branch"

declare -A vcs_compare
vcs_compare+=(["script"]="${segments_path}/vcs_compare.sh")
vcs_compare+=(["foreground"]="white")
vcs_compare+=(["background"]="colour60")
vcs_compare+=(["separator"]="${separator_right_bold}")
register_segment "vcs_compare"

declare -A vcs_staged
vcs_staged+=(["script"]="${segments_path}/vcs_staged.sh")
vcs_staged+=(["foreground"]="white")
vcs_staged+=(["background"]="colour64")
vcs_staged+=(["separator"]="${separator_right_bold}")
register_segment "vcs_staged"

declare -A vcs_modified
vcs_modified+=(["script"]="${segments_path}/vcs_modified.sh")
vcs_modified+=(["foreground"]="white")
vcs_modified+=(["background"]="red")
vcs_modified+=(["separator"]="${separator_right_bold}")
register_segment "vcs_modified"

declare -A vcs_others
vcs_others+=(["script"]="${segments_path}/vcs_others.sh")
vcs_others+=(["foreground"]="black")
vcs_others+=(["background"]="colour245")
vcs_others+=(["separator"]="${separator_right_bold}")
register_segment "vcs_others"

# Print the status line in the order of registration above.
print_status_line_left

exit 0
