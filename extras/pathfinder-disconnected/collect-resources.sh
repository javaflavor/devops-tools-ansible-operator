#!/bin/sh

BASEDIR=`dirname "$0"`

urls='https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js
	https://rawgit.com/RedHatBrand/Overpass/master/webfonts/overpass-webfont/overpass.css
	https://www.w3counter.com/tracker.js
	https://cdn.datatables.net/v/bs/dt-1.10.18/datatables.min.js
	https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js
	https://unpkg.com/lodash@4.17.10/lodash.min.js
	https://unpkg.com/jquery
	https://surveyjs.azureedge.net/1.0.23/survey.jquery.js
	https://surveyjs.azureedge.net/1.0.23/survey.css
	https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/js/select2.min.js
	https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.4/css/select2.min.css
	https://unpkg.com/surveyjs-widgets
	https://unpkg.com/icheck@1.0.2
	https://unpkg.com/icheck@1.0.2/skins/square/blue.css
	https://unpkg.com/icheck@1.0.2/skins/square/blue@2x.png'

getfile () {
    nohost=$(echo $1 | sed 's/https:\/\///')
    todir=$(dirname $nohost)
    mkdir -p $todir
    if [ "$url" = 'https://unpkg.com/icheck@1.0.2' ]; then
        nohost=unpkg.com/icheck@1.0.2.js
    fi
    curl $1 -o $nohost
}

mkdir -p $BASEDIR/ext
cd $BASEDIR/ext

for url in $urls; do
    #wget -x $url
    getfile $url
done

fonts=$(cat rawgit.com/RedHatBrand/Overpass/master/webfonts/overpass-webfont/overpass.css |grep 'url(' | sed "s/.*url('\([^)]*\)').*/\1/" | sed 's/\?.*//' | sort |uniq)
for font in $fonts; do
    #wget -x https://rawgit.com/RedHatBrand/Overpass/master/webfonts/overpass-webfont/$font
    getfile https://rawgit.com/RedHatBrand/Overpass/master/webfonts/overpass-webfont/$font
done
