#!/bin/bash

movie_watch="/mnt/media/movie_watch/"
scratch="/mnt/media/scratch/"
audio_sync="/mnt/seedbox_downloads/audio_sync/"
other="/mnt/misc/Virtual_PC_Documents"

echo "Script called for torrent:$id with name:$name and path:$path"

full_path="$path/$name"

while ! mkdir /config/myscript.lock 2>/dev/null
        do
        sleep 60
        done

if [[ $path == "/mnt/seeding_movies" ]]
then
		echo "processing film"
                cp -R "$full_path" "$movie_watch"
                /shared/processing_scripts/movie_sort.sh
		echo "processed"
elif [[ $path == "/mnt/seeding_movies/kids" ]]
then
		echo "processing kid's film"
                cp -R "$full_path" "$movie_watch"
                /shared/processing_scripts/movie_sort_kids.sh
		echo "processed"
elif [[ $path == "/mnt/seedbox_downloads/scratch" ]]
then
		echo "processing scratch"
                cp -R "$full_path" "$scratch"
		echo "processed"
elif [[ $path == "/mnt/seedbox_downloads/audio_completed" ]]
then
		echo "processing audio"
        	cp -R  "$full_path" "$audio_sync"
		/shared/processing_scripts/flac2alac.sh
		echo "processed"
elif [[ $path == "/mnt/seedbox_downloads/other" ]]
then
		echo "processing other"
        	cp -R  "$full_path" "$other"
		echo "processed"
else
:
fi
rm -rf  /config/myscript.lock
echo "cleanup complete"
exit
