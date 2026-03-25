# beepboxplugins
A collection of plugins for importing into supported mods

If you would like to create your own plugin, extend the class found in [plugin.ts](./pluginSource/plugin.ts), make it a default export, and add your own plugin info.
Finally, build the plugin by running [buildPlugin.sh](./buildPlugin.sh), host the resulting plugin js file on a supported website (filegarden or github are good options), and use the link to said file in your BeepBox projects