Spoon is a Repository with useful playbooks for managing Raspberry Pi with Ansible

## Setup Raspberry Pi

Here is a [detailed guide](https://sendgrid.com/blog/complete-guide-set-raspberry-pi-without-keyboard-mouse/) to setup Raspberry Pi without a Keyboard & Mouse


## Requirements
```
ansible
ansible-lint
ansible-review
```

## Installation using pip
```
$ pip install ansible
$ pip install ansible-lint
$ pip install ansible-review
```

## How to Run
```
$ git clone https://github.com/willianpaixao/spoon.git
$ cd playbooks
$ virtualenv .env
$ source .env/bin/activate
$ pip install -r requirements.txt
$ ./run.sh
```
