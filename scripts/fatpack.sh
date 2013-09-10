
( echo "#!/usr/bin/env perl" ; fatpack file ; cat src/bdatum-backup ) > bin/bdatum-backup
( echo "#!/usr/bin/env perl" ; fatpack file ; cat src/bdatum-restore ) > bin/bdatum-restore

chmod 755 bin/bdatum-backup
chmod 755 bin/bdatum-restore
