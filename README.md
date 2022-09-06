# nvim-ide
My setup for Neovim as a IDE

# Install neovim
[neovims homepage](https://neovim.io/) 

[neovim repo](https://github.com/neovim/neovim)

Download package or install from build.
The current stable version is 0.7.2

# Get healthy

For copy/paste to work on Ubuntu, install either of this
```
sudo apt install xsel # for X11
sudo apt install wl-clipboard # for wayland
```

### Install python support
```
pip install pynvim
```

### Install npm
```
sudo apt install npm
npm i -g neovim
```

### Install node.js
For Ubuntu
```
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs
```
### Install ripgrep
used for plugin telescope
```
sudo apt install ripgrep
```



## Fonts

Install getnf and install the "Hack" font, you might need to update/rebuild the font cache (or reboot).

[getnf](https://github.com/ronniedroid/getnf)

An alternative way to install fonts is to manually download from [nerdfonts](https://www.nerdfonts.com/font-downloads), unzip and update/reload the font cache.

```
unzip <.zip> -d ~/.local/share/fonts
```

To manually update/rebuild the font cache
```
fc-cache -fv
```

Run `:checkhealth` to see if everything is ok.

## Configurations

### LSP
To add new LSP run
```
:LspInstallInfo
```
and find a suitable lsp.
Commands:
```
i - install
u - update
X - uninstall
```
After installation you need to add the server to `~/.config/nvim/lua/user/lsp/lsp-installer.lua` in the list/table `servers`.

### Formatters and linters
Install formatters and linters and add them to `~/.config/nvim/lua/user/lsp/null-ls.lua`
Information about different formatters and linters are found [here](https://github.com/jose-elias-alvarez/null-ls.nvim)
