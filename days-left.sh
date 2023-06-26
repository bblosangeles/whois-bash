#!/bin/bash
DOMAIN="$1"
exdate=`whois $DOMAIN | grep -E '[Pp]aid|[Ee]xpir|[Ee]xpires' | grep -o -E '[0-9]{4}.[0-9]{2}.[0-9]{2}|[0-9]{2}\/[0-9]{2}\/[0-9]{4}|[0-9]{8}'`
expire=$((`date -d "$exdate" '+%s'`))
today=$((`date '+%s'`))
leftsec=$(($expire - $today))
leftdays=$(($leftsec/86400))
echo $leftdays
