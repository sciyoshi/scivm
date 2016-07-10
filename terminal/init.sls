byobu:
  pkg.installed

byobu-enable:
  cmd.run:
    - name: byobu-enable
    - unless: grep byobu-launch $HOME/.profile
    - user: {{ pillar.username }}
    - output_loglevel: quiet
    - require:
        - pkg: byobu

byobu-tmux:
  file.managed:
    - name: /home/{{ pillar.username }}/.byobu/.tmux.conf
    - source: salt://terminal/tmux.conf

byobu-keybindings:
  file.managed:
    - name: /home/{{ pillar.username }}/.byobu/keybindings.tmux
    - source: salt://terminal/keybindings.tmux

bashrc-additions:
  file.blockreplace:
    - name: /home/{{ pillar.username }}/.bashrc
    - source: salt://terminal/bashrc
    - append_if_not_found: true
