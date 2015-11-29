ssh-auth-key:
  ssh_auth.present:
    - user: {{ pillar.user }}
    - source: salt://ssh/key.pub
