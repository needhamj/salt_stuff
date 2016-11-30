{%- if grains['virtual'] == 'VirtualBox' -%}

make_sym_maple:
  file.symlink:
    - target: /vagrant/hrbdf
    - name: {{ pillar.get('source_directory','') }}
    - makedirs: True

make_sym_up:
  file.symlink:
    - target: /vagrant/updatable
    - name: /opt/apps/updatable
    - makedirs: True

{%- endif -%}
