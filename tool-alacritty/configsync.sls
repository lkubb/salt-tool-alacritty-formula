{%- from 'tool-alacritty/map.jinja' import alacritty %}

{%- for user in alacritty.users | selectattr('dotconfig') %}
alacritty configuration is synced for user '{{ user.name }}':
  file.recurse:
    - name: {{ user._alacritty.confdir }}
    - source:
      - salt://dotconfig/{{ user.name }}/alacritty
      - salt://dotconfig/alacritty
    - context:
        user: {{ user }}
    - template: jinja
    - user: {{ user.name }}
    - group: {{ user.group }}
    - file_mode: keep
    - dir_mode: '0700'
    - makedirs: True
{%- endfor %}
