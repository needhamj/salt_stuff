venv:
  virtualenv.managed:
    - name: /opt/envs/{{ pillar.get('virtual_env', '') }}
    - no_site_packages: False
    - cwd: /opt/envs/
    - user: vagrant
    - require:
      - pkg: python-virtualenv

requirements-file:
  file.exists:
    - name: /requirements.txt #{{ pillar.get('requirements', '') }}.txt

reqs:
  pip.installed:
    - pip_exists_action: switch
    - requirements: /requirements.txt # /{{ pillar.get('requirements', '') }}.txt
    - find_links: http://sw-srv.maplecroft.com/deployment_libs
    - cwd: /opt/envs/{{ pillar.get('virtual_env', '') }}
    - pip_bin: /opt/envs/{{ pillar.get('virtual_env', '') }}/bin/pip
    - bin_env: /opt/envs/{{ pillar.get('virtual_env', '') }}
    - requires:
      - file: requirements-file

# dev-reqs:
#   pip.installed:
#     - pip_exists_action: switch
#     - requirements: {{ pillar.get('source_directory', '') }}/websites/maplecroft/dev-requirements.txt
#     - find_links: http://sw-srv.maplecroft.com/deployment_libs
#     - cwd: /opt/envs/{{ pillar.get('virtual_env', '') }}
#     - pip_bin: /opt/envs/{{ pillar.get('virtual_env', '') }}/bin/pip
#     - bin_env: /opt/envs/{{ pillar.get('virtual_env', '') }}
#     - requires:
#       - file: requirements-file

# bob:
#   pkg.installed:
#     - names:
#       - libmysqlclient-dev
#       - python-dev
#       - python-virtualenv
#   pip.installed:
#     - requirements: /requirements.txt
#     - find_links: http://sw-srv.maplecroft.com/deployment_libs
#     - require:
#       - pkg: pip