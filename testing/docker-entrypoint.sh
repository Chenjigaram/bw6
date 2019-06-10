#!/bin/bash


cd /opt/tibco/bw/6.5/bin

/opt/tibco/bw/6.5/bin/bwadmin upload -d defaultdomain bwapp.ear

/opt/tibco/bw/6.5/bin/bwadmin start -d defaultdomain -appspace defaultappspace

ln -sf /dev/stdout /opt/tibco/bw/6.5/domains/defaultdomain/appnodes/defaultappspace/defaultappnode/log/bwappnode.log

/opt/tibco/bw/6.5/bin/bwadmin deploy -as -d defaultdomain -appspace defaultappspace bwapp.ear

tail -f /opt/tibco/bw/6.5/domains/defaultdomain/appnodes/defaultappspace/defaultappnode/log/bwappnode.log

