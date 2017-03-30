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

git-rerere-enabled:
  git.config_set:
    - name: rerere.enabled
    - value: true
    - user: {{ pillar.username }}
    - global: true

git-merge-conflictstyle:
  git.config_set:
    - name: merge.conflictstyle
    - value: diff3
    - user: {{ pillar.username }}
    - global: true

git-rebase-autostash:
  git.config_set:
    - name: rebase.autostash
    - value: true
    - user: {{ pillar.username }}
    - global: true
