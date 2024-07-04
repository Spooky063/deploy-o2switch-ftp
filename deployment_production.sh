#!/bin/bash

# Only work for python application on o2switch website provider

# If you want to pull from the hash and not from the branch main
# hash=$(< /home/yosu0027/deployment/production)
# git pull origin $hash

push_production_env() {
	local PYTHON_VERSION="3.11"
	local APP_FILENAME_PATH="jak-pot.com"
	local APP_ROOT_PATH="/home/yosu0027"

	source "$APP_ROOT_PATH/virtualenv/$APP_FILENAME_PATH/$PYTHON_VERSION/bin/activate"
	cd "$APP_ROOT_PATH/$APP_FILENAME_PATH"
 	git fetch -p
	git pull origin main
 	pip install --no-cache-dir -r requirements.txt
	pip cache purge
}

push_production_env
