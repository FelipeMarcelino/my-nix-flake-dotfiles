## -*- coding: utf-8 -*-
set +o pipefail

function send_notification {
    mult=50
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ':' -f 2 | tr -d ' ' )
    result=$(echo "$volume * $mult" | bc)
    result=${result%.*}
    bar=$(seq -s "■" "$result" | sed 's/[0-9]//g')
    dunstify -i audio-volume-muted-blocking -t 8000 -r 2593 -u normal "    $bar" # Change Icon
}

case $1 in 
    up)
	   muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 'MUTED' | awk '{print $3}')
	   if [ "$muted" = "[MUTED]" ]; then
		   dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "MUTE" # Change Icon
	   else
              send_notification 
	   fi
    ;;
    down)
	   muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 'MUTED' | awk '{print $3}')
	   if [ "$muted" = "[MUTED]" ]; then
	      dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "MUTE" # Change Icon
	   else
              send_notification 
	   fi
    ;;
    mute)
	muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 'MUTED' | awk '{print $3}')
	if [ "$muted" = "[MUTED]" ]; then
	   dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "MUTE" # Change Icon
	else
	   send_notification
	fi
    ;;
esac




	
