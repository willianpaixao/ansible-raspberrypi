#!/bin/sh

if [ -z ${VIRTUAL_ENV} ];
then
  source .env/bin/activate
else
  ansible-playbook -i hosts main.yml --tags tmux
fi	
