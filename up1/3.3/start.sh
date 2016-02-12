#!/bin/sh

if [ ! -e /Up1/server/server.conf ]
then
        APIKEY=$(date +%s | md5sum | head -c 32)
        sleep 5
        DELETEKEY=$(date +%s | md5sum | head -c 32)
        echo $APIKEY
        echo $DELETEKEY

        sed -re 's/"api_key": "c61540b5ceecd05092799f936e27755f"/"api_key": "'$APIKEY'"/;s/"delete_key": ""/"delete_key": "'$DELETEKEY'"/' server.conf.example > server.conf
        
        if [ -f certs/cert.pem ] && [ -f certs/key.pem ]
        then
                sed -ri 's#"cert": "./cert.pem"#"cert": "certs/cert.pem"#;s#"key": "./key.pem"#"key": "certs/key.pem"#;s#"enabled": false#"enabled": true#' server.conf
        fi
fi


node server.js
