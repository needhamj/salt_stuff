{% from "webserver/map.jinja" import apache with context %}

webservice:
  pkg.installed:
    - name: {{apache.pkg}}
  service.running:
    - enable: True
    - require:
      - pkg: {{ apache.pkg }}

/var/www/index.html:                        # ID declaration
  file:                                     # state declaration
    - managed                               # function
    - source: salt://webserver/index.html   # function arg
    - require:                              # requisite declaration
      - pkg: {{apache.pkg}}                 # requisite reference

