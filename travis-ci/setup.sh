#!/bin/bash

dir_source="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pip install ansible=2.1

ansible-galaxy install --force -r "${dir_source}/requirements.yml"

ansible-playbook -i localhost, --connection=local "${dir_source}/setup.yml"
