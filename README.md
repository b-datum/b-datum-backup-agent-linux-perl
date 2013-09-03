# b-datum-linux

Ferramenta de backup b-datum (http://www.b-datum.com/) para Linux.

[![Build Status](https://secure.travis-ci.org/b-datum/b-datum-linux.png?branch=master)](https://travis-ci.org/b-datum/b-datum-linux)

## Instalação

Para instalar no Ubuntu/Debian basta utilizar o pacote já pronto e utilizar o gdebi para resolver as dependências:

```
# apt-get update
# apt-get install gdebi-core
# cd /tmp
# wget https://github.com/b-datum/b-datum-linux/releases/download/0.22/b-datum-backup-perl_0.22-1_all.deb
# gdebi b-datum-backup-perl_0.22-1_all.deb
```

Para realizar a instalação em um diretório de usuário e utilizar o
perlbrew em qualquer distribuição, basta:

```
$ curl -X GET https://raw.github.com/b-datum/b-datum-linux/master/install.sh | bash
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

## Autores

Gabriel Andrade <gabriel@b-datum.com>
Thiago Rondon <thiago@b-datum.com>

## Licença e Copyright

Licença sob a GNU GPL v3.

Copyright (c) 2013- [b-datum](http://b-datum.com/)

Nosso executável, contém os pacotes embutidos abaixo:

- [JSON::PP](http://search.cpan.org/perldoc?JSON::PP) Copyright 2007-2011 by Makamaka Hannyaharamitu
- [version](http://search.cpan.org/perldoc?version) Copyright 2004-2010 by John Peacock
- [Digest::MD5::File](https://metacpan.org/module/Digest::MD5::File) Copyright 2005 by Daniel Muey
- [File::Next](https://metacpan.org/module/File::Next) Copyright 2005-2012 by Andy Lester.
- [File::Slurp](https://metacpan.org/module/File::Slurp) Copyright by Uri Guttman.
- [File::MimeInfo](https://metacpan.org/module/File::MimeInfo) Copyright 2003, 2012 by Jaap G Karssenberg.
- [HTTP::Date])(https://metacpan.org/module/HTTP::Date) Copyright 1995-1999, Gisle Aas
- [HTTP::Request](https://metacpan.org/module/HTTP::Request) Copyright 1995-2004 Gisle Aas
- [Parallel::ForkManager](https://metacpan.org/module/Parallel::ForkManager) Copyright (c) 2000-2010 Szabó, Balázs
- [Perl6::Junction](https://metacpan.org/module/Perl6::Junction) Copyright 2005, Carl Franks.
- [Try::Tiny](https://metacpan.org/module/Try::Tiny) Copyright (c) 2013 by Yuval Kogman.
- [IO::Socket::SSL](https://metacpan.org/module/IO::Socket::SSL) Copyright 1999-2002 Marko Asplund, 2002-2005 Peter Behroozi, 2006-2013 Steffen Ullrich.
- [URI](https://metacpan.org/module/URI) Copyright 1995-2009 Gisle Aas, 1995 Martijn Koster.
- [LWP::UserAgent::Determined](https://metacpan.org/module/LWP::UserAgent::Determined) Copyright 2004, Sean M. Burke.
- [LWP::ConnCache](https://metacpan.org/module/LWP::ConnCache) Copyright 2001 Gisle Aas.

