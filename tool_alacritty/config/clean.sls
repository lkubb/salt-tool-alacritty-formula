# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as alacritty with context %}


{%- for user in alacritty.users | selectattr('alacritty.config', 'defined') | selectattr('alacritty.config') %}

Alacritty config dir is absent for user '{{ user.name }}':
  file.absent:
    - name: {{ user['_alacritty'].confdir }}
{%- endfor %}
