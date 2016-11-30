setup_dev_libs:
  cmd.run:
    - name: fab deploy_libs:hr_solutions,python=python,easy_install=easy_install -Hlocalhost
    - cwd: {{ pillar.get('source_directory', '') }}/deployment
