# vim: ft=sls

{#-
    Removes the Alacritty package.
    Has a dependency on `tool_alacritty.config.clean`_.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_config_clean = tplroot ~ ".config.clean" %}
{%- from tplroot ~ "/map.jinja" import mapdata as alacritty with context %}

include:
  - {{ sls_config_clean }}


Alacritty is removed:
  pkg.removed:
    - name: {{ alacritty.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
