update:
  pkg.uptodate

autoremove:
  module.run:
    - name: pkg.autoremove
    - kwargs:
        purge: true
