{%- from 'tool-alacritty/map.jinja' import alacritty -%}

Alacritty Terminal Emulator is installed:
  pkg.installed:
    - name: {{ alacritty.package }}
