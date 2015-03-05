#OwnCloud
killall owncloud

#CloudStation processes (GUI, logs, daemons)
for i in `ps -A | egrep "CloudStation" | egrep "javigon" | awk '{print $1}'`;
do
		sudo kill -9 $i
done

sudo kill -9 `ps -A | egrep "Synology Cloud Station" | egrep "Applications" | awk '{print $1}'` > /dev/null 2> /dev/null

