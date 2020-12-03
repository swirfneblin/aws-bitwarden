# AWS-BITWARDEN

Script para conectar na AWS utilizando profiles através das credenciais armazenadas em um cofre do bitwarden.

## Pre-requisitos

- Instalar [aws-cli](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install)
- Instalar [bw cli](https://bitwarden.com/help/article/cli/)

<img src="./img/aws-profile.png">

Onde:
  - Profile: Nome do item no cofre - aws-default
  - `AWS_ACCESS_KEY_ID=Username`
  - `AWS_SECRET_ACCESS_KEY=Password`
  - `AWS_DEFAULT_REGION=[region value]`

## Para iniciar uso

```
  $ gh repo clone swirfneblin/aws-bitwarden
  $ cd aws-bitwarden
  $ make
```
Então execute:

`$ source awsprofile.sh aws-default`