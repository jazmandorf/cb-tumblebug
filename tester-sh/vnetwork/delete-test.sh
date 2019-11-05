#!/bin/bash
source ../setup.env

#for NAME in "${CONNECT_NAMES[@]}"
#do
#	ID=`curl -sX GET http://$TUMBLEBUG_IP:1323/ns/$NS_ID/resources/network |json_pp |grep "\"id\"" |awk '{print $3}' |sed 's/"//g' |sed 's/,//g'`
#	curl -sX DELETE http://$TUMBLEBUG_IP:1323/ns/$NS_ID/resources/network/$ID |json_pp
#done

TB_NETWORK_IDS=`curl -sX GET http://$TUMBLEBUG_IP:1323/ns/$NS_ID/resources/network`

if [ $TB_NETWORK_IDS != "null" ]
then
        TB_NETWORK_IDS=`curl -sX GET http://$TUMBLEBUG_IP:1323/ns/$NS_ID/resources/network |json_pp |grep "\"id\"" |awk '{print $3}' |sed 's/"//g' |sed 's/,//g'`
        for TB_NETWORK_ID in ${TB_NETWORK_IDS}
        do
                echo ....Delete ${TB_NETWORK_ID} ...
                curl -sX DELETE http://$TUMBLEBUG_IP:1323/ns/$NS_ID/resources/network/${TB_NETWORK_ID} | json_pp
        done
else
        echo ....no networks found
fi