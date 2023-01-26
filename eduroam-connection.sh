#!/bin/sh
# sets up eduroam with username
# use nmcli connection up eduroam --ask to give password afterwards
set -e

interface="wlo1"
conname="eduroam"

username="jonatahh@uio.no"
ssid="eduroam"

nmcli connection add \
	type wifi \
	con-name "${connname:?}" \
	ifname "${interface:?Must provide interface}" \
	ssid "${ssid:?Must provide ssid}" -- \
		wifi-sec.key-mgmt wpa-eap \
		802-1x.eap ttls \
		802-1x.phase2-auth mschapv2 \
		802-1x.identity "${username:?Must provide username}"

printf "You've succesfully created the connection for %s with username %s\n" "${ssid}" "${username}"
printf "To continue, run the following command, and type the password:\n\tnmcli connection up %s --ask\n" "${connname}"

