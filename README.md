# b-datum-backup-agent-linux-perl

Ferramenta de backup b-datum (http://www.b-datum.com/) para Linux.

[![Build Status](https://secure.travis-ci.org/b-datum/b-datum-backup-agent-linux-perl.png?branch=master)](https://travis-ci.org/b-datum/b-datum-backup-agent-linux-perl)

## Instalação

Para instalar no Ubuntu/Debian basta utilizar o pacote já pronto e utilizar o gdebi para resolver as dependências:

```
# apt-get update
# apt-get install gdebi-core
# cd /tmp
# wget https://github.com/b-datum/b-datum-backup-agent-linux-perl/releases/download/0.11/b-datum-backup-perl_0.11-1_all.deb
# gdebi b-datum-backup-perl_0.11-1_all.deb
```

Para realizar a instalação em um diretório de usuário e utilizar o
perlbrew em qualquer distribuição, basta:

```
$ curl -X GET https://raw.github.com/b-datum/b-datum-backup-agent-linux-perl/master/install.sh | bash
```

## Configuração

O arquivo de default de configuração encontra-se em
"/etc/bdatum/backup.conf". Se desejar, é possível especificar um outro através
da flag --config.

### Formato do arquivo de configuração

O formato utilizado no arquivo de configuração é o INI as configurações são
feitas dentro do grupos denominados "profiles":

	[profile1]
	node_key=ynSpeC6ipaOgvwRoYIgD
	partner_key=CIPeIAdGa3XjZBQQy9jk

	[admin]
	node_key=oIC6wEr_j2Ise9OUG7zJ
	partner_key=7C3PqisTF8hSKH3TCT7q

### Blacklist

É possível determinar através do arquivo de configuração quais os arquivos que
serão ignorados durante o processo de backup. Para isso é necessário criar um
grupo "blacklist" precedido do nome "profile" o qual esse "blacklist" pertence e
então definir os arquivos ignorados através de um identificador e uma expressão
regular correspondente:

	[profile1 blacklist]
	no_logs=(?!\.log)$
	only_mp3=^.*?\.mp3$

## Autor

Gabriel Andrade <gabriel@b-datum.com>

## Licensa e Copyright

Licensa sob a GNU GPL v3.

Copyright (c) 2013, [b-datum](http://b-datum.com/)


