
gbutyaev Infra repository

### ДЗ Знакомство с облачной инфраструктурой

Адрес для подключения:

bastion_IP = 62.84.117.31
someinternalhost_IP = 10.128.0.14

Подлючиться в одну команду к удаленному внунтреннему серверу можно с помощью параметра -J: `ssh -i ~/.ssh/appuser -A -J appuser@62.84.117.31 appuser@10.128.0.14`


Для подключения через `ssh someinterenalhost` необходимо в конфиг файл добавить следующее:

```bash
Host bastion
                HostName 62.84.117.31
                Port 22
                User appuser
                IdentityFile ~/.ssh/appuser



Host someinternalhost

                HostName 10.128.0.14
                Port 22
                User appuser
                IdentityFile ~/.ssh/appuser
