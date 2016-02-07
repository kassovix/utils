#!/bin/bash

function usage(){
    echo "Usage : set_time [DATE|now]"
    echo "        avec DATE au format \"yyyy-mm-jj\""
}

# 
if [ "$1" == "now" ]; then
    sudo date -u -s "$(curl -sD - google.com | grep ^Date: | cut -d' ' -f3-6)" >> /dev/null
    echo -n "Retour à la date courante : "
    date
# Vérif du format yyyy-mm-jj
elif [[ "$1" == [1-2][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9] ]]; then
    sudo date --set="$1"  >> /dev/null
    echo -n "Nouvelle date : "
    date
else
    usage
fi


 
exit 0
