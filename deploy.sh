#!/bin/bash
yarn install
yarn build

git commit -m 'New CSS' pub/style.css
git push origin main

docker-compose up -d
docker-compose exec -u www-data www bash -c "php bin/directory-validation.php" || exit

ssh mageos "cd /home/mageos/public_html/mage-os.nl && ./cron.sh"
