{{ pillar.get('root_directory','') }}:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True

/opt/envs/:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True

/opt/envs/{{ pillar.get('virtual_env', '') }}:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True

{{ pillar.get('root_directory','') }}/versions:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True

{{ pillar.get('root_directory','') }}/updatable:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True
  # mount.mounted:
  #   - device: /home/jneedham/hbrf_slot/maplecroft/versions/maplecroft/
  #   - fstype: auto

{{ pillar.get('root_directory','') }}/libs:
  file.directory:
    - user: vagrant
    - group: users
    - mode: 755
    - makedirs: True
