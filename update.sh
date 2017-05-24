#!/bin/bash

set -e

export MODULE_IS_INSTALLED=`drush pm-list | grep locale | grep Enabled`

drush updb -y
drush config-import --partial -y

# @TODO Remove this if locale translations are already imported.
if [ -z "$MODULE_IS_INSTALLED" ]; then
  drush cr
  drush locale-check -y
  drush locale-update -y
  drush config-import --partial -y
fi

drush cr
