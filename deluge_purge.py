import os
import subprocess
import shutil

directory='/mnt/seedbox_downloads'

command = subprocess.Popen("su dash -c \"deluge-console info\"",shell=True, stdout=subprocess.PIPE)
deluge_active = command.stdout
deluge_active_string = deluge_active.read()
deluge_active_list = deluge_active_string.split("\n");

active = []
for torrent in deluge_active_list:
        s = torrent.split("\n")
        name = s[0][6:]
	active.append(name)

ls_output = os.listdir(directory)
os.chdir(directory)
deleted = 0
for each in ls_output:
	if each not in active and each != 'temp' and each != '.htaccess' and each !='audio_sync':
		print each
		if os.path.isfile(each):
			os.remove(each)
		elif os.path.isdir(each):
			shutil.rmtree(each)
		deleted += deleted

print 'deleted',deleted, 'orphaned torrents' 
