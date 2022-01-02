{%- from 'tool-alacritty/map.jinja' import alacritty %}

include:
  - .package
{%- if alacritty.users | selectattr('dotconfig', 'defined') | selectattr('dotconfig') %}
  - .configsync
{%- endif %}
