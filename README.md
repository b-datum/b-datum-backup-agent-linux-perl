# b-datum-backup-agent-linux-perl

Ferramenta de backup b-datum (http://www.b-datum.com/) para Linux.

[![Build Status](https://secure.travis-ci.org/b-datum/b-datum-backup-agent-linux-perl.png?branch=master)](https://travis-ci.org/b-datum/b-datum-backup-agent-linux-perl)

## Instalação

Para instalar no Ubuntu/Debian basta utilizar o pacote já pronto e utilizar o gdebi para resolver as dependencias:

```
# apt-get update
# apt-get install gdebi-core
# cd /tmp
# wget https://github.com/b-datum/b-datum-backup-agent-linux-perl/releases/download/0.09/b-datum-backup-perl_0.09-1_all.deb
# gdebi b-datum-backup-perl_0.09-1_all.deb
```

Para realizar a instalação em um diretório de usuário e utilizar o perlbrew em qualquer distribuição, basta:

```
$ curl -X GET https://raw.github.com/b-datum/b-datum-backup-agent-linux-perl/master/install.sh | bash
```

## Autor

Gabriel Andrade <gabriel@b-datum.com>

## Licensa e Copyright

Licensa sob a GNU GPL v3.

Copyright (c) 2013, [b-datum](http://b-datum.com/)


