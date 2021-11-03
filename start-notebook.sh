#!/bin/sh

cd /opt/app || exit 1

backup=/work/backup-$(date | tr ' ' -)
mkdir $backup || exit 1

for f in *; do
	mv /work/$f $backup
done


cp * /work || exit 1
cd /work
exec "$@"
