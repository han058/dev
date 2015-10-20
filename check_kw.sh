#!/bin/bash

if [[ $# -eq 0 ]]
  then
    echo "Keyword Needed"
	exit 1
fi

KEYWORD=$1

KEY=ced8b09757a8d93152aa09a7fe3f877a

D_LOCAL_NUM=$(curl -s "http://map.search.daum.net/mapsearch/map.daum?callback=jQuery1810876719664549455_1445242813277&q=$KEYWORD&msFlag=A&sort=0" \
-H 'Referer: http://map.daum.net/' | grep -oE "\"place_totalcount\" : [0-9]+," | grep -oE "[0-9]+")

N_LOCAL_NUM=$(curl -s "http://openapi.naver.com/search?key=$KEY&query=$KEYWORD&target=local&start=1&display=10" \
-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36' |\
grep -oE "<total>[0-9]+</total>" | grep -oE "[0-9]+")

sleep 3

N_SHOP_NUM=$(curl -s "http://openapi.naver.com/search?key=$KEY&query=$KEYWORD&target=shop&start=1&display=10" \
-H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36'|\
grep -oE "<total>[0-9]+</total>" | grep -oE "[0-9]+")

sleep 3
echo $KEYWORD $D_LOCAL_NUM $N_LOCAL_NUM $N_SHOP_NUM
