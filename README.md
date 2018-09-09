[![pipeline status](https://gitlab.com/willianpaixao/spoon/badges/master/pipeline.svg)](https://gitlab.com/willianpaixao/spoon/commits/master)

`spoon` is the name of my [Raspberry Pi](https://www.raspberrypi.org/) 3B+ that server as personal home server. This repository is a collection of [Ansible](https://www.ansible.com/) roles that setup most the configuration needed.

## Getting started

The only previous step is enable SSH server at the RPi OS.

> NOTE: I only have tested this playbook under [Raspbian](https://www.raspberrypi.org/downloads/raspbian/) (Debian), although many tasks are OS independent. If you have issues, please [create](https://gitlab.com/willianpaixao/spoon/issues/new) a ticket.

First step is cloning the repository:
``` bash
$ git clone https://gitlab.com/willianpaixao/spoon
```

Then create the environment and download the dependencies:
``` bash
$ cd playbooks
$ virtualenv .env
$ source .env/bin/activate
$ pip install -r requirements.txt
```

There's a bash script to bootstrap the execution of the playbooks. Check the content of the file `run.sh`, changing the variables as you need and then execute it:
``` bash
$ ./run.sh
```
> NOTE: Depending on your RPi settings, you might need to provide password.

## Roles
* `base/` First and most basic role. It upgrade system packages, install necessary command tools like Git, Vim and Tmux.
* `paixao/` Downloads my user files and create symlinks to the specific target home folder. Please see my [willianpaixao/dotfiles](https://github.com/willianpaixao/dotfiles) for more information.
