sh ./recvid.sh &  PIDIOS=$!
sh ./recaud.sh &  PIDMIX=$!
wait $PIDIOS
wait $PIDMIX
