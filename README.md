# korbind_infra
korbind Infra repository

# HW terraform-1
При добавлении ключа для appuser_web через веб интерфейс и последующим выполнением terraform apply состояние terraform не
меняется и изменения произведенные через веб не фиксируются.

# HW cloud-testapp
testapp_IP = 34.90.24.189
testapp_port = 9292

Запуск через startup script: 
```
gcloud compute instances create reddit-app --boot-disk-size=10GB --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --metadata-from-file startup-script=./startup.sh
```
Создание правила:
```
gcloud compute firewall-rules create default-puma-server --target-tags puma-server --source-ranges 0.0.0.0/0 --rules tcp:9292 --action allow
```

# HW cloud-bastion 
bastion_IP = 35.214.199.112 
someinternalhost_IP = 10.164.0.3 

Подключение командой вида ssh someinternalhost выполняется\
путем создания файла ~/.ssh/config с содержимым:\
```
Host bastion
  HostName 35.214.199.112
  User appuser
  IdentityFile ~/.ssh/appuser
  IdentitiesOnly yes

Host someinternalhost
  HostName 10.164.0.3
  User appuser
  ProxyJump bastion
  IdentityFile ~/.ssh/appuser
  IdentitiesOnly yes
```


