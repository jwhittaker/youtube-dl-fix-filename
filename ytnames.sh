#!/bin/bash

# get all files in dir which are complete but have only a uuid for file name
for YT_UUID in $(ls -1 | grep -P "^_" | cut -d\. -f1 | sort | uniq | grep -vP "\.part$"); do
  # clean up the UUID to suit a url
  YT_UUID=$(echo $YT_UUID | sed -e 's/_-//g')
  name=`curl -s https://www.youtube.com/watch?v=${YT_UUID} | grep '<meta property="og:title" content="' | cut -d= -f 3- |  sed -e 's/"\|>//g'`
  if [ -z "$name" ]; then
    echo "could not retrieve a title for $YT_UUID"
  else
    # clean up characters
    name=${name//&#39;/_}
    name=${name//&#39/_}
    name=${name//&quot;/_}
    # only allow ascii characters
    name=${name//[^a-zA-Z0-9_%&: ()\[\]-]/}

    # rename files that match the uuid with the "_-" seperator in the front
    for xx in `ls -1 | grep "^_-${YT_UUID}"`; do
      # rename the file the way it should be
      mv "${xx}" "${name}${xx}";
    done
  fi
done
