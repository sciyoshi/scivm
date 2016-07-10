nodesource:
  pkgrepo.managed:
    - humanname: nodesource
    - name: deb https://deb.nodesource.com/node_6.x {{ grains.lsb_distrib_codename }} main
    - file: /etc/apt/sources.list.d/nodesource.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key

node:
  pkg.latest:
    - name: nodejs
