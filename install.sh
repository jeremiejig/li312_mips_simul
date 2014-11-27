#!/bin/bash

cd $(dirname $0)
WORKDIR=$(pwd)

echo 'Creating almo_env.sh'
sed -e "s%INSTALL_DIR%$WORKDIR%" $WORKDIR/almo_env.sh.m4 > $WORKDIR/almo_env.sh

if grep -q li312_simul_path ~/.bashrc; then
  echo -e "old installation detected, updating to source $WORKDIR/almo_env.sh"
  sed -e "s%^\(li312_simul_path=\).*$%\1'$WORKDIR'%" -i ~/.bashrc
else
  echo "Appending 'source $WORKDIR/almo_env.sh in ~/.bashrc'"
  echo -e "\n# almo env\nli312_simul_path='$WORKDIR'\nsource \$li312_simul_path/almo_env.sh\n" >> $HOME/.bashrc
fi;
