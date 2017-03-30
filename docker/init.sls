docker:
  pkgrepo.managed:
    - humanname: nodesource
    - name: "deb [arch=amd64] https://download.docker.com/linux/ubuntu {{ grains.lsb_distrib_codename }} stable"
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg

  pkg.latest:
    - name: docker-ce
