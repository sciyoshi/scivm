byobu:
  pkg.installed

byobu-enable:
  cmd.run:
    - name: byobu-enable
    - unless: grep byobu-launch $HOME/.profile
    - user: {{ pillar.user }}
    - output_loglevel: quiet
    - require:
        - pkg: byobu

bashrc-additions:
  file.blockreplace:
    - name: /home/{{ pillar.user }}/.bashrc
    - source: salt://terminal/bashrc
    - append_if_not_found: true
