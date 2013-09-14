
for file in bdatum-backup bdatum-restore ; do

	( cat src/header.pl ; \
		fatpack file ; \
		cat src/$file ) \
		> bin/$file

	chmod 755 bin/$file

done


