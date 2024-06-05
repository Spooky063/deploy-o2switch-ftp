#!/bin/bash

# Only work for python application on o2switch website provider

push_staging_env() {
	local PYTHON_VERSION="3.11"
	local APP_FILENAME_PATH="django.yosu0027.odns.fr"
	local APP_ROOT_PATH="/home/yosu0027"

	source "$APP_ROOT_PATH/virtualenv/$APP_FILENAME_PATH/$PYTHON_VERSION/bin/activate"
	cd "$APP_ROOT_PATH/$APP_FILENAME_PATH"
	git pull origin main
	pip cache purge
}

push_staging_env
