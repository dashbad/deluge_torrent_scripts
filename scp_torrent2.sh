#!/bin/bash
exec 1> >(logger -s -t $(basename $0)) 2>&1

movie_watch="/mnt/media/movie_watch/"
scratch="/mnt/media/scratch/"
audio_sync="/mnt/seedbox_downloads/audio_sync/"
other="/mnt/misc/Virtual_PC_Documents"

echo "Script called for torrent:$id with name:$name and path:$path"

label=$(python /mnt/media/scripts/getlabel.py $id)
full_path="$path/$name"

while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done

if [[ $label == "film" ]]
then
		echo "processing film"
                cp -R "$full_path" "$movie_watch"
                /mnt/media/processing_scripts/movie_sort.sh
elif [[ $label == "kids_film" ]]
then
		echo "processing kid's film"
                cp -R "$full_path" "$movie_watch"
                /mnt/media/processing_scripts/movie_sort_kids.sh
elif [[ $label == "scratch" ]]
then
		echo "processing scratch"
                cp -R "$full_path" "$scratch"
elif [[ $label == "audio" ]]
then
		echo "processing audio"
        	cp -R  "$full_path" "$audio_sync"
		/home/dash/Documents/other_scripts/flac2alac.sh

elif [[ $label == "other" ]]
then
		echo "processing other"
        	cp -R  "$full_path" "$other"

else
:
fi
rm -rf  ~/myscript.lock
echo "cleanup complete"
exit
