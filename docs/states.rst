Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_alacritty``
~~~~~~~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_alacritty.package``
~~~~~~~~~~~~~~~~~~~~~~~~~~
Installs the Alacritty package only.


``tool_alacritty.config``
~~~~~~~~~~~~~~~~~~~~~~~~~
Manages the Alacritty package configuration by

* recursively syncing from a dotfiles repo
* managing/serializing the config file afterwards

Has a dependency on `tool_alacritty.package`_.


``tool_alacritty.config.file``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Manages the Alacritty package configuration.
Has a dependency on `tool_alacritty.package`_.


``tool_alacritty.config.sync``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Syncs the Alacritty package configuration
with a dotfiles repo.
Has a dependency on `tool_alacritty.package`_.


``tool_alacritty.clean``
~~~~~~~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_alacritty`` meta-state
in reverse order.


``tool_alacritty.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the Alacritty package.
Has a dependency on `tool_alacritty.config.clean`_.


``tool_alacritty.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the configuration of the Alacritty package.


