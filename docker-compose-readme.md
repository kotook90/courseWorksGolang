sudo docker-compose -f ./docker-compose.yml up
sudo docker-compose  build
sudo docker-compose up registry





запущенные контейнеры
sudo docker ps -a
Проверить статус:sudo aa-status
Завершение работы и предотвращение перезапуска:sudo systemctl disable apparmor.service --now
Выгрузить профили AppArmor:sudo service apparmor teardown
Проверить статус:sudo aa-status
sudo systemctl enabled apparmor
sudo systemctl start apparmor
удалить контейнеры
sudo docker stop name
sudo docker rm name 