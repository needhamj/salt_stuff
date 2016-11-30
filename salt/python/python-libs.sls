python-dateutil:
  pkg.installed

python2:
  pkg:
    - installed
    - names:
      - python-dev
      - python

pip:
  pkg:
    - installed
    - name: python-pip
    - require:
      - pkg: python2

other_packages:
  pkg.installed:
    - pkgs:
      - python-virtualenv
      - python-dev