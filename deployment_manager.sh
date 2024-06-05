#!/bin/bash

deployment_manager_watch() {
  watch -n10 "watch -t -g ls --full-time /home/yosu0027/deployment/staging >/dev/null && /home/yosu0027/deployment_staging.sh >> ~/logs/django.yosu0027.odns.fr/deployment.log" &
  watch -n5 "watch -t -g ls --full-time /home/yosu0027/deployment/production >/dev/null && /home/yosu0027/deployment_production.sh >> ~/logs/jak-pot.com/deployment.log"
}

deployment_manager_watch
