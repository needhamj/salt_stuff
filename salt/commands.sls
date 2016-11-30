{% if pillar.get('webserver_role')=='hrbdf' %}

import requirements:
  cmd.run:
    - name: wget "http://stash.maplecroft.com/projects/HRBDF/repos/hrbdf/browse/deployment/requirements.txt?at=9307c8042ee90883a4187e39f7b55dba7726521c&raw" -O requirements.txt
    - cwd: /

{% endif %}
