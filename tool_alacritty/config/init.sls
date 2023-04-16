# vim: ft=sls

{#-
    Manages the Alacritty package configuration by

    * recursively syncing from a dotfiles repo
    * managing/serializing the config file afterwards

    Has a dependency on `tool_alacritty.package`_.
#}

include:
  - .sync
  - .file
