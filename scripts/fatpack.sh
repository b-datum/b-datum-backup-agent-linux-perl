
VERSION=$(grep \ VERSION Makefile.PL | sed -e "s/^.*\ '//;s/'.*//")

for file in bdatum-backup bdatum-restore ; do

#	fatpack trace src/$file
#	fatpack packlists-for `cat fatpacker.trace` > packlists
#	fatpack tree `cat packlists`

	( cat src/header.pl ; \
		fatpack file ; \
		sed -e "s/__VERSION_BY_SCRIPT__/$VERSION/" src/$file ) \
		> bin/$file

	chmod 755 bin/$file

done


