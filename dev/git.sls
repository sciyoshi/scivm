git:
  pkg.installed

git-user-name:
  git.config_set:
    - name: user.name
    - value: {{ pillar.fullname }}
    - user: {{ pillar.username }}
    - global: true

git-user-email:
  git.config_set:
    - name: user.email
    - value: {{ pillar.email }}
    - user: {{ pillar.username }}
    - global: true
