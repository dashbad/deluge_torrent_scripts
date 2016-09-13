#!/bin/bash
exec 1> >(logger -s -t $(basename $0)) 2>&1

echo "Script called for torrent:$id with name:$name and path:$path"

label=$(python /mnt/media/scripts/getlabel.py $id)
full_path="$path/$name"

if [[ $label == "film" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done
                cp -R "$full_path" /mnt/media/movie_watch/
                /mnt/media/processing_scripts/movie_sort.sh
                rm -rf ~/myscript.lock
elif [[ $label == "kids_film" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done
                cp -R "$full_path" /mnt/media/movie_watch/
                /mnt/media/processing_scripts/movie_sort_kids.sh
                rm -rf ~/myscript.lock
elif [[ $label == "scratch" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done
                cp -R "$full_path" /mnt/media/scratch/
                rm -rf  ~/myscript.lock
elif [[ $label == "audio" ]]
then
        cp -R  "$full_path" /mnt/seedbox_downloads/audio_sync/

else
:
fi
