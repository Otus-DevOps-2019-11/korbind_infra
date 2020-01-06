# korbind_infra
korbind Infra repository

bastion_IP = 35.214.199.112
someinternalhost_IP = 10.164.0.3

Подключение командой вида ssh someinternalhost выполняется
путем создания файла ~/.ssh/config с содержимым:
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
