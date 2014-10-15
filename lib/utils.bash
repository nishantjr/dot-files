
function graphical_fail() {
    notify-send -u critical "$1"
}

function check_binary() {
    local bin=$1
    type $bin >/dev/null 2>&1 && return
    graphical_fail "'$bin' is not installed."
    exit 1
}

function bash_enable_exit_on_error() {
    set -e
}

function print_percent_intervals() {
    for level in $(seq 0 10 100); do
        echo $level
    done
}

function dmenu_command() {
    local title=$1
    local input_gen=$2
    local answer_handler=$3

    answer=$($input_gen | dmenu -p "$title:") || return
    echo >&2 "$title: $answer"
    $answer_handler "$answer"
}
