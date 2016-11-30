include:
  - supervisord

nginx:
  pkg:
    - installed
  service:
    - running
    - enable: True
    - restart: True
    - watch:
      - file: /etc/nginx/sites-enabled/{{ pillar['webserver_role']}}.conf
      - file: /etc/nginx/sites-enabled/default
      - pkg: nginx

# Remove default nginx site
/etc/nginx/sites-enabled/default:
  file.absent: []

/etc/nginx/sites-enabled:
  file.directory:
    - require:
        - pkg: nginx

/etc/nginx/sites-enabled/{{ pillar['webserver_role']}}.conf:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ pillar['webserver_role']}}.conf
    - watch:
        - file: /etc/nginx/sites-enabled
        - file: /etc/nginx/sites-available/{{ pillar['webserver_role']}}.conf

/etc/nginx/sites-available/{{ pillar['webserver_role']}}.conf:
  file.managed:
    - source: salt://nginx/{{ pillar['webserver_role']}}.conf
    - template: jinja
    - require:
      - pkg: nginx

#supervisord-nginx:
#  supervisord.running:
#    - name: nginx
#    - user: root
#    - update: True
#    - restart: True
#    - require:
#      - pkg: supervisor
#      - file: /etc/supervisor/supervisord.conf
#    - watch:
 #     - file: /etc/nginx/sites-enabled/{{ pillar['webserver_role']}}.conf
 #     - file: /etc/nginx/sites-enabled/default
