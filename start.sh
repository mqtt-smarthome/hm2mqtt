#!/bin/sh


## configurations

# mqtt server string like "tcp://[IP ADDRSS]:[PORT]"
MQTT_SERVER="tcp://127.0.0.1:1883"

# homematic server
HM_SERVER="127.0.0.1"

# java location
JAVA=/usr/bin/java

# logfile location directory or /dev/null for no logging
currentDate=$(date +%F_%H-%M-%S)
#LOGFILE=/dev/null
LOGFILE="/srv/hm2mqtt/logs/"$currentDate".log"

# locatin for hm2mqtt.jar file
EXECUTEDIR=/srv/hm2mqtt

## user configuration ends here



# start hm2mqtt
java \
	-jar $EXECUTEDIR/hm2mqtt.jar \
	hm.host=$HM_SERVER \
	mqtt.server=$MQTT_SERVER \
	> $LOGFILE 2>&1 &

# exit after starting
exit 0
