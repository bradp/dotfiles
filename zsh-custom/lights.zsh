#   ██ ██         ██        ██
#  ░██░░   █████ ░██       ░██
#  ░██ ██ ██░░░██░██      ██████  ██████
#  ░██░██░██  ░██░██████ ░░░██░  ██░░░░
#  ░██░██░░██████░██░░░██  ░██  ░░█████
#  ░██░██ ░░░░░██░██  ░██  ░██   ░░░░░██
#  ███░██  █████ ░██  ░██  ░░██  ██████
# ░░░ ░░  ░░░░░  ░░   ░░    ░░  ░░░░░░
#

LIGHTS_OFFICE=4,8
LIGHTS_BED=5,7
LIGHTS_LIVING=1,2,6

# Wrapper for hue lights with no output.
function lights() {
	hue lights $@ &>/dev/null;
}

# Control office lights.
function office() {
	lights ${LIGHTS_OFFICE} $@;
}

# Control bedroom lights.
function bed() {
	lights ${LIGHTS_BED} $@;
}

# Control living room lights.
function living() {
	lights ${LIGHTS_LIVING} $@;
}

# Turn all lights on.
function lighton() {
	office on;
	bed on;
	living on;
}

# Turn all lights off.
function lightoff() {
	office off;
	bed off;
	living off;
}

# Flash an alert in the office.
function oalert() {
	office on;
	office ${1:-red};
	sleep 1;
	office white;
}
