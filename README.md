![Node.js CI](https://github.com/smfazendaniteroi/sigdiv/workflows/Node.js%20CI/badge.svg) ![Ruby-version](https://github.com/smfazendaniteroi/sigdiv/workflows/Ruby-version/badge.svg) ![RSpec CI](https://github.com/smfazendaniteroi/sigdiv/workflows/RSpec%20CI/badge.svg)
 
# SIGDIV
Sistema de Gestão da Dívida Pública. É uma iniciativa da prefeitura municipal de Niterói, através da Secretaria Municipal de Fazenda para desenvolver um sistema que controla as dívidas públicas de um município.

# Instalação
O presente guia de instalação assume que o Ubuntu 18.04 é o sistema operacional utilizado.

Para instalar o Ruby é necessário o rbenv, sistema de configuração de ambiente Ruby. Antes de tudo é necessário instalar algumas ddependências.

```
$ sudo apt update
$ sudo apt install git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev nodejs
```

Para baixar e executar o script de instalação do rbenv:

```
$ curl -sL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash -
```

Para atualizar o path e inicializar o ambiente na execução do shell é necessário adicionar os seguintes comandos ao final do arquivo .bashrc

```
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```
Após definir o path é necessário reiniciar o shell.

A versão do Ruby utilizada é a 2.5.3. Para instalar e utilizá-la, execute os seguintes comandos:

```
$ rbenv install 2.5.3
$ rbenv global 2.5.3
```

Copiando o código fonte do sistema:

```
$ git clone https://github.com/smfazendaniteroi/sigdiv.git
$ cd sigdiv
```

Instale o bundler na versão especificada:

```
$ gem install bundler -v 1.17.1
```

Para instalar o banco de dados PostgreSQL:

```
$ sudo apt install postgresql libpq-dev
```

Criando o role utilizado pelo sistema:

```
$ sudo -u postgres psql
# create role sigdiv with createdb login password 'passwordDB';
```

Para configurar a autenticação do usuário sigdiv no banco de dados, adicione no arquivo /etc/postgresql/10/main/pg_hba.conf
a seguinte linha: 

```
local   all             sigdiv                                    md5
```
Reinicie o servidor postgres:

```
sudo /etc/init.d/postgresql restart
```

Instalando as gems da aplicação:

```
$ bundle
$ rbenv rehash
```

Para executar o sisteme é necessário definir um servidor de ftp no arquivo config/settings.yml. Um template se encontra em config/settings.yml.template.

Criando a base de dados e o schema:

```
$ rails db:create
$ rails db:migrate
```

Para rodar a aplicação:

```
$ rails s
```

Ela poderá ser acessada localmente em http://localhost:3000
