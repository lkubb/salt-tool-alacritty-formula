{%- from 'tool-alacritty/map.jinja' import alacritty %}

{%- for user in alacritty.users | selectattr('dotconfig', 'defined') | selectattr('dotconfig') %}
  {%- set dotconfig = user.dotconfig if dotconfig is mapping else {} %}

alacritty configuration is synced for user '{{ user.name }}':
  file.recurse:
    - name: {{ user._alacritty.confdir }}
    - source:
      - salt://dotconfig/{{ user.name }}/alacritty
      - salt://dotconfig/alacritty
    - context:
        user: {{ user | json }}
    - template: jinja
    - user: {{ user.name }}
    - group: {{ user.group }}
  {%- if dotconfig.get('file_mode') %}
    - file_mode: '{{ dotconfig.file_mode }}'
  {%- endif %}
    - dir_mode: '{{ dotconfig.get('dir_mode', '0700') }}'
    - clean: {{ dotconfig.get('clean', False) | to_bool }}
    - makedirs: True
{%- endfor %}
