# scivm

This repository contains a set of [SaltStack](https://saltstack.com/) state files for setting up my virtual machines.

## Setup

First, install SaltStack, ideally with [pipsi](https://github.com/mitsuhiko/pipsi):

```shell
pipsi install salt
```

Update `config/roster` with the hostname and SSH information of the hosts to configure.
To provision, from the checkout directory, run:

```
salt-ssh '*' state.highstate
```
