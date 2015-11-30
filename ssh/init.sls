ssh-auth-key:
  ssh_auth.present:
    - user: {{ pillar.username }}
    - source: salt://ssh/key.pub
