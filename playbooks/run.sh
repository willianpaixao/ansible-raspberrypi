#!/bin/bash

ENV=.env

if [ -z "${VIRTUAL_ENV}" ];
then
  if [ -d "${ENV}" ];
  then
    source ${ENV}/bin/activate
  else
    virtualenv ${ENV}
    source ${ENV}/bin/activate
    pip install -r requirements.txt
  fi
fi	

ansible-playbook -i hosts main.yml --tags tmux
