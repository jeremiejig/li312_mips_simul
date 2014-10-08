#!/bin/sh

cd $(dirname $0)
WORKDIR=$(pwd)

echo 'Creating almo_env.sh'
m4 -D INSTALL_DIR=$WORKDIR $WORKDIR/almo_env.sh.m4 > $WORKDIR/almo_env.sh

echo "Appending 'source $WORKDIR/almo_env.sh in ~/.bashrc'"
echo "\n##almo env\nsource $WORKDIR/almo_env.sh\n\n##fin almo env" >> $HOME/.bashrc
