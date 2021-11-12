
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
                User appuser
                IdentityFile ~/.ssh/appuser
                ForwardAgent yes



Host someinternalhost
		HostName 10.128.0.14
                User appuser
                IdentityFile ~/.ssh/appuser
                ForwardAgent yes
                ProxyJump bastion


```
Данные инстанса

```
testapp_IP = 62.84.119.70

testapp_port = 9292

```

### ДЗ Packer
* Установил Packer, сделал под него сервисный аккаунт на YC
* Создал файл шаблон Packer ubuntu16.json, сконфигуриров билдер и добавив в него провиженеры
* Cоздал файл .gitignore, в который указал .key.json и variables.json
* Cоздал variables.json.example и key.json.example, указав в них вымышленные значения
* На основании созданного шаблона Packer развернул ВМ на YC
* Проверить можно : `http://178.154.218.248:9292/`




### ДЗ Terraform-1
* Поставил terraform 0.12.8
* Создал директории `terraform`, в которой сделал `terraform init`
* В директории terraform создал файл main.tf, в котором прописал конфигурацию создания ВМ на основе образа (созданного в Packer)
* В конфиге использовал уже сконфигурированный до этого токен
* Создал файл outputs.tf, в котором добавил выходную переменную с ip ВМ
* Создал файлы variables.tf и terraform.tfvars, в которых определил переменные
* Создал `terraform.tfvars.example` с вымышленными значениями, а `terraform.tfvars` добавил в `.gitignore`


Домашнее задание разработано для курса [DevOps практики и инструменты](https://otus.ru/lessons/devops-praktiki-i-instrumenty/)
