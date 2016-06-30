#!/bin/bash

label=$(python /mnt/media/scripts/getlabel.py $id)

if [[ $label == "film" ]]
then
	while ! mkdir ~/myscript.lock 2>/dev/null
	do
	sleep 60
	done
		cp -R /mnt/seedbox_downloads/"$name" /mnt/media/movie_watch/
		/mnt/media/processing_scripts/movie_sort.sh
		rm -rf ~/myscript.lock
elif [[ $label == "kids_film" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done
                cp -R /mnt/seedbox_downloads/"$name" /mnt/media/movie_watch/
                /mnt/media/processing_scripts/movie_sort_kids.sh
                rm -rf ~/myscript.lock
elif [[ $label == "scratch" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
	done
		cp -R /mnt/seedbox_downloads/"$name" /mnt/media/scratch/
		rm -rf  ~/myscript.lock
elif [[ $label == "audio" ]]
then	
	cp -R  "$path/$name" /mnt/seedbox_downloads/audio_sync/
elif [[ $label == "pon" ]]
then
        while ! mkdir ~/myscript.lock 2>/dev/null
        do
        sleep 60
        done
		cp -R /mnt/seedbox_downloads/"$name" /mnt/misc/Virtual_PC_Documents/
		rm -rf  ~/myscript.lock
else 
:
fi

