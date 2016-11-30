mysql:
  server:
    # root_password: False # - to have root@localhost without password
    root_password: 'somepass'
    user: mysql
    # my.cnf sections changes /usr/lib/python2.7/dist-packages/salt/utils/pyobjects.py
    mysqld:
      # you can use either underscore or hyphen in param names
      bind-address: 0.0.0.0
      log_bin: /var/log/mysql/mysql-bin.log
      port: 3307
      binlog_do_db: hr_solutions
      auto_increment_increment: 5
    mysql:
      # my.cnf param that not require value
      no-auto-rehash: noarg_present

  # Manage databases
  database:
  - hr_solutions
    
  #   - bar
  # schema:
  #   foo:
  #     load: True
  #     source: salt://mysql/files/foo.schema
  #   bar:
  #     load: False

  # Manage users
  # you can get pillar for existent server using scripts/import_users.py script
  jonty:
    password: 'jonty'
    host: localhost
    databases:
      - database: hr_solutions
        grants: ['all privileges']
        grant_option: True
#        grants: ['*']  #  select', 'insert', 'update']
        # - database: bar
        #   grants: ['all privileges']
  #   bob:
  #     password_hash: '*6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4'
  #     host: localhost
  #     databases:
  #       - database: foo
  #         grants: ['all privileges']
  #         grant_option: True
  #       - database: bar
  #         table: foobar
  #         grants: ['select', 'insert', 'update', 'delete']
  #   nopassuser:
  #     password: ~
  #     host: localhost
  #     databases: []

  # Override any names defined in map.jinja
  lookup:
    server: mysql-server
    client: mysql-client
    service: mysql-service
    python: python-mysqldb
