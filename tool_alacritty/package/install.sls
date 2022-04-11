# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as alacritty with context %}


Alacritty is installed:
  pkg.installed:
    - name: {{ alacritty.lookup.pkg.name }}
    - version: {{ alacritty.get('version') or 'latest' }}
    {#- do not specify alternative return value to be able to unset default version #}

Alacritty setup is completed:
  test.nop:
    - name: Hooray, Alacritty setup has finished.
    - require:
      - pkg: {{ alacritty.lookup.pkg.name }}
