#!/bin/sh

BASEDIR=`dirname "$0"`

urls='https://cdnjs.cloudflare.com
	https://rawgit.com
	https://www.w3counter.com
	https://cdn.datatables.net
	https://unpkg.com
	https://surveyjs.azureedge.net'

for url in $urls; do
    urlpat=$(echo $url | sed 's/\//\\\//g')
    nohost=$(echo $url | sed 's/https:\/\///')
    echo $urlpat
    echo $nohost
    for f in $(find $BASEDIR -name \*.jsp -exec grep -l "$url" {} \;); do
        sed -i "s/${urlpat}/ext\\/${nohost}/g" $f
    done
done

for f in $(find $BASEDIR -name \*.jsp -exec grep -l 'icheck@1.0.2"' {} \;); do
    sed -i 's/icheck@1.0.2"/icheck@1.0.2.js"/g' $f
done
