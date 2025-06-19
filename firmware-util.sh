#!/bin/bash
#
# Offline version of MrChromebox Firmware Utility Script
#

# Set script directory
script_dir="$(dirname "$(readlink -f "$0")")"

# Ensure output of system tools in en-US for parsing
export LC_ALL=C

# Set working dir
if grep -q "Chrom" /etc/lsb-release ; then
    mkdir -p /usr/local/bin
    cd /usr/local/bin
else
    cd /tmp
fi

# Clear screen / show banner
printf "\ec"
echo -e "\nMrChromebox Firmware Utility Script (Offline Mode) starting up"

# Assume support files exist in same directory
source "$script_dir/sources.sh"
source "$script_dir/firmware.sh"
source "$script_dir/functions.sh"

# Run preliminary setup
cd /tmp
prelim_setup
prelim_setup_result="$?"

# Save diagnostics if setup failed
diagnostic_report_save
troubleshooting_msg=(
    " * diagnostics report has been saved to /tmp/mrchromebox_diag.txt"
    " * consult local documentation or support resources"
)
if [ "$prelim_setup_result" -ne 0 ]; then
    IFS=$'\n'
    echo "Setup unsuccessful." >&2
    echo "${troubleshooting_msg[*]}" >&2
    exit 1
fi

# Trap for unsupported hardware
trap 'check_unsupported' EXIT
check_unsupported() {
    if [ "$isUnsupported" = true ]; then
        IFS=$'\n'
        echo "Device not recognized as supported." >&2
        echo "${troubleshooting_msg[*]}" >&2
    fi
}

# Launch firmware update menu
menu_fwupdate
