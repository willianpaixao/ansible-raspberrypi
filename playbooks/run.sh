#!/bin/bash
#: TITLE: "run.sh"
#: AUTHOR: "Willian Paixao <willian.paixao@ellmount.se>"

# Define your local variables.
ENV=".env"
INVENTORY="hosts.yml"
PLAYBOOK="site.yml"
TAGS="geth"

# Creating and activating your virtualenv with all the dependencies.
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

# Test connectivity with the targeted hosts.
ansible --module-name=ping \
  --inventory-file="${INVENTORY}" \
  all

if [ $? -eq 0 ]
then
  # Running ansible-playbook with many arguments.
  # NOTE: The arguments '--limit' and '--tags' are optionals.
  # NOTE: The argument '--check' will perform a "Dry Run" check. It's also
  # optional.
  ansible-playbook \
    --verbose \
    --ask-become-pass \
    --inventory-file="${INVENTORY}" \
    --tags="${TAGS}" \
    "${PLAYBOOK}"
fi
