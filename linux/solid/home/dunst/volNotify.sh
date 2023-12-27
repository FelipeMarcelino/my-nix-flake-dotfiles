## -*- coding: utf-8 -*-
set +o pipefail

# Function to send notification
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ':' -f 2 | tr -d ' ' )
muted=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep 'MUTED' | awk '{print $3}')
mult=50

if [ "$muted" = "[MUTED]" ]; then
   dunstify -i audio-volume-muted -t 8000 -r 2593 -u normal "Mute" # Change Icon
else
    result=$(echo "$volume * $mult" | bc)
    result=${result%.*}
    bar=$(seq -s "■" "$result" | sed 's/[0-9]//g')
    dunstify -i audio-volume-muted-blocking -t 8000 -r 2593 -u normal "    $bar" # Change Icon
fi

