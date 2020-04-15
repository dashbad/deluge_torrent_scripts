# deluge_torrent_scripts

A few scripts I use to manage torrents on my server:

get_label.py - gets the label of a torrent based on the deluge ID passed to the processing script

scp_torrent.sh - hands off to a forked process to ensure deluge doesn't hang or crash when multiple torrents complete in proximity

scp_torrent.sh - sorts torrents based on their label

deluge_purge.py - deletes torrent data that is not seeded in deluge
