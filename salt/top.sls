base:
  '*':
    {% if pillar.get('webserver_role')=='hrbdf' %}
    - commands
    - nginx
    - supervisord
    - vboxpkgs
    - directory
    - mount
    - git
    - packages
    - python
    - gunicorn
    - fab_install
    {% endif %}
