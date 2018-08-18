[![pipeline status](https://gitlab.com/willianpaixao/spoon/badges/master/pipeline.svg)](https://gitlab.com/willianpaixao/spoon/commits/master)

`spoon` is the name of my RPi 3B+ that server as personal server.
This repository is a collection of Ansible roles that setup most the
configuration needed.

## Getting started

The only previous step is enable SSH server at the RPi OS.

> NOTE: I only have tested this playbook under Debian, although many tasks are
> OS independent.

First step is cloning the repository:
``` bash
$ git clone https://gitlab.com/willianpaixao/spoon
```

The create the environment and download the dependencies:
``` bash
$ cd playbooks
$ virtualenv .env
$ source .env/bin/activate
$ pip install -r requirements.txt
```

## Roles
* `base/`
