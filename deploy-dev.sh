#!/bin/bash

set -ev

rsync -avzhe "ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" \
  --exclude 'web/sites/default/files/' --exclude '.semaphore-cache' \
  --exclude '.env' --exclude '.drush' --exclude '.git' \
  --exclude 'settings.local.php' --delete --progress \
  . root@174.138.56.255:/var/www/drupal-trainning

  ssh -o StrictHostKeyChecking=no root@174.138.56.255 \
    'cd /var/www/drupal-trainning; ./update.sh'

print "Deploy to DEV environment succeeded \o/"
