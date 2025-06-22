#!/bin/bash

# times are in seconds
SLEEP_TIME=3600
PROD_START_TIME=000000 # UTC. 
PROD_END___TIME=235959 # UTC. We're sleeping 12 hours a day so this is not really necessary

function wake_up_app {
  echo "... Publishing" >> ./publish.log
  git add publish.log
  git commit -m "Automatic publish commit"
  git pull && git push &&   echo "... Success" >> ./publish.log
}

while true
do
  currentTime=`date --utc +"%H%M%S"`
  currentTimeFull=`date --utc +"%Y-%m-%d %H%M%S"`
  echo "Running Publisher @$currentTimeFull UTC. PID=$$" >> ./publish.log
  if [[ ! "$currentTime" < "$PROD_START_TIME" && ! "$currentTime" > "$PROD_END___TIME" ]]; then
    wake_up_app
  fi

  sleep $SLEEP_TIME
done
