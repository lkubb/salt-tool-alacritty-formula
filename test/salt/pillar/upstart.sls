# -*- coding: utf-8 -*-
# vim: ft=yaml
---
tool_global:
  users:
    user:
      configsync: true
      persistenv: .bash_profile
      rchook: .bashrc
      xdg: true
      alacritty:
        config:
          decorations: none
tool_alacritty:
  lookup:
    master: template-master
    # Just for testing purposes
    winner: lookup
    added_in_lookup: lookup_value

    pkg:
      name: alacritty
    paths:
      confdir: '.config/alacritty'
      conffile: 'alacritty.yml'

  tofs:
    # The files_switch key serves as a selector for alternative
    # directories under the formula files directory. See TOFS pattern
    # doc for more info.
    # Note: Any value not evaluated by `config.get` will be used literally.
    # This can be used to set custom paths, as many levels deep as required.
    files_switch:
      - any/path/can/be/used/here
      - id
      - roles
      - osfinger
      - os
      - os_family
    # All aspects of path/file resolution are customisable using the options below.
    # This is unnecessary in most cases; there are sensible defaults.
    # path_prefix: template_alt
    # dirs:
    #   files: files_alt
    #   default: default_alt
    # The entries under `source_files` are prepended to the default source files
    # given for the state
    # source_files:
    #   tool-alacritty-config-file-file-managed:
    #     - 'example_alt.tmpl'
    #     - 'example_alt.tmpl.jinja'

    # For testing purposes
    source_files:
      Alacritty config file is managed for user 'user':
        - 'alacritty.yml'
        - 'alacritty.yml.jinja'

  # Just for testing purposes
  winner: pillar
  added_in_pillar: pillar_value
