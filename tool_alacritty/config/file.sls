# vim: ft=sls

{#-
    Manages the Alacritty package configuration.
    Has a dependency on `tool_alacritty.package`_.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_package_install = tplroot ~ ".package.install" %}
{%- from tplroot ~ "/map.jinja" import mapdata as alacritty with context %}

include:
  - {{ sls_package_install }}


{%- for user in alacritty.users | selectattr("alacritty.config", "defined") | selectattr("alacritty.config") %}

Alacritty config file is managed for user '{{ user.name }}':
  file.serialize:
    - name: {{ user["_alacritty"].conffile }}
    - dataset: {{ user.alacritty.config | json }}
    - serializer: yaml
    - mode: '0600'
    - user: {{ user.name }}
    - group: {{ user.group }}
    - makedirs: true
    - dir_mode: '0700'
    - require:
      - sls: {{ sls_package_install }}
{%- endfor %}
