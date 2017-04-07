update:
  pkg.uptodate:
    - refresh: true
    - kwargs:
        dist_upgrade: true

autoremove:
  module.run:
    - name: pkg.autoremove
    - kwargs:
        purge: true
