#   ██ ██         ██        ██
#  ░██░░   █████ ░██       ░██
#  ░██ ██ ██░░░██░██      ██████  ██████
#  ░██░██░██  ░██░██████ ░░░██░  ██░░░░
#  ░██░██░░██████░██░░░██  ░██  ░░█████
#  ░██░██ ░░░░░██░██  ░██  ░██   ░░░░░██
#  ███░██  █████ ░██  ░██  ░░██  ██████
# ░░░ ░░  ░░░░░  ░░   ░░    ░░  ░░░░░░
#

PARBS_LIGHTS_OFFICE=4,8
PARBS_LIGHTS_BED=5,7
PARBS_LIGHTS_LIVING=1,2,6

# Wrapper for hue lights with no output.
lights() {
	hue lights "$@" &>/dev/null;
}

# Control office lights.
office() {
	lights ${PARBS_LIGHTS_OFFICE} "$@";
}

# Control bedroom lights.
bed() {
	lights ${PARBS_LIGHTS_BED} "$@";
}

# Control living room lights.
living() {
	lights ${PARBS_LIGHTS_LIVING} "$@";
}

# Flash an alert in the office.
oalert() {
	office on;
	office ${1:-red};
	sleep 1;
	office white;
}

lightsrandom() {
	while true; do
		color=$((1 + ${RANDOM} % 65535))
		light=$((1 + ${RANDOM} % 7))

		curl --silent --location --request PUT \
		"http://${LIGHTS_IP}/api/${LIGHTS_TOKEN}/lights/${light}/state" \
		--header 'Content-Type: application/json' \
		--data-raw '{ "on":true, "sat":254, "bri":254, "hue":'"${color}"'}' > /dev/null

		sleep 1
	done
}

_light_completion() {
	local -a options=( \
		'on:⬜️  Turn on' \
		'off:⬛️  Turn off' \
		'red:🔴  Turn red' \
		'green:🟢  Turn green' \
		'blue:🔵  Turn blue' \
		'yellow:🟡  Turn yellow' \
		'purple:🟣  Turn purple' \
		'white:⚪️  Turn white'
	)
	_describe 'commands' options
}
compdef _light_completion office bed living
