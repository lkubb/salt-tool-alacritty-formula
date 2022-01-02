{%- from 'tool-alacritty/map.jinja' import alacritty %}

{%- if alacritty.users | selectattr('dotconfig', 'defined') | selectattr('dotconfig') %}
include:
  - .configsync
{%- endif %}

alacritty is updated to latest version:
{%- if grains['kernel'] == 'Darwin' %}
  pkg.installed: # assumes homebrew as package manager. homebrew always installs the latest version, mac_brew_pkg does not support upgrading a single package
{%- else %}
  pkg.latest:
{%- endif %}
    - name: {{ alacritty.package }}
