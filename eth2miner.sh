#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=stratum1+tls://eth.2miners.com:12020
WALLET=0x70278496f0eaa3810d9dbdd7f388425e029013db.lol-eth-124a

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

chmod +x ./lolMiner && ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
