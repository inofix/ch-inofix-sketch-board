#!/bin/bash
# little helper script to get the original js and convert it for
# liferay, i.e. babel..
# TODO: find out how to do it in a smoother way..

if [ -n "$1" ] ; then
    source_js="$1"
else
    echo "Please specify the path to the original noteit.board.es.js"
    exit 1
fi

echo "import * as d3 from 'd3/dist/d3';" > sketch-board-web/src/main/resources/META-INF/resources/js/noteit.board.es.js

sed 's;^class;export class;' $source_js >> sketch-board-web/src/main/resources/META-INF/resources/js/noteit.board.es.js
