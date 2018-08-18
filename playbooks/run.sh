#!/bin/bash
#: TITLE: "run.sh"
#: AUTHOR: "Willian Paixao <willian.paixao@ellmount.se>"

# Define your local variables.
ENV=".env"
INVENTORY="hosts.yml"
PLAYBOOK="site.yml"
TAGS="i3"

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
# NOTE: Add '--ask-pass' for users with password
ansible \
  --module-name=ping \
  --verbose \
  --inventory-file="${INVENTORY}" \
  all

if [ $? -eq 0 ]
then
  # Running ansible-playbook with many arguments.
  # NOTE: The arguments '--limit' and '--tags' are optionals.
  # NOTE: The argument '--check' will perform a "Dry Run" check.
  # NOTE: Add '--ask-become-pass' for users with password
  ansible-playbook \
    --verbose \
    --inventory-file="${INVENTORY}" \
    --tags="${TAGS}" \
    --skip-tags never \
    "${PLAYBOOK}"
fi
