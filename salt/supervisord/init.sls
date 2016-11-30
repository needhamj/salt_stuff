/etc/supervisor/supervisord.conf:
  file.managed:
    - source: salt://supervisord/supervisord.conf
    - makedirs: True
    - template: jinja

/etc/supervisor/conf.d/{{ pillar['webserver_role']}}.conf:
  file.managed:
    - source: salt://supervisord/{{ pillar['webserver_role']}}.conf
    - makedirs: True
    - template: jinja

/etc/supervisor/conf.d/nginx.conf:
  file.managed:
    - source: salt://supervisord/nginx.conf
    - makedirs: True
    - template: jinja

add_groups:
  cmd.run:
    - name: sudo addgroup --system supervisor

add_to_supervisor:
  cmd.run:
    - name: sudo adduser root supervisor; sudo adduser {{ pillar['user'] }}  supervisor

supervisor:
  pkg:
    - installed