

#if pillar('webserver_role')=='hrbdf':
#    Git.latest(name='http://stash.maplecroft.com/scm/hrbdf/hrbdf.git', target='/opt/apps/maplecroft/versions/current')