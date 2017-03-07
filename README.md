# scivm

This repository contains a set of [saltstack](https://saltstack.com/) state files for setting up my virtual machines.

## Setup

First, install [pipsi](https://github.com/mitsuhiko/pipsi):

```shell
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python3
~/.local/venvs/pipsi/bin/pip install --upgrade git+https://github.com/mitsuhiko/pipsi
```

Now install saltstack:

```
pipsi install --python python --system-site-packages salt
```

To provision, from the checkout directory, run:

```
sudo ~/.local/bin/salt-call --local state.highstate
```