# nvim-ide
My setup for Neovim as a IDE

# Install neovim
[neovims homepage](https://neovim.io/) 

[neovim repo](https://github.com/neovim/neovim)

Download package or install from build.
The current stable version is 0.8.1

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
After installation you need to add the server to `~/.config/nvim/lua/user/lsp/lsp-installer.lua` in the list/table `servers`, and add the following in the for loop for settings:
```
    if server == "<LSP SERVER NAME>" then
        local <LSP SERVER NAME>_opts = require("user.lsp.settings.<LSP SERVER NAME>")
        opts = vim.tbl_deep_extend("force", <LSP SERVER NAME>_opts, opts)
    end

```
a long with setting the settings in the .lua-file found in `~/.config/nvim/lua/user/lsp/settings/<LSP SERVER NAME>.lua`

See all setting options by looking at `:LspInstallInfo` or at [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)

### Formatters and linters
Install formatters and linters binaries and add them to `~/.config/nvim/lua/user/lsp/null-ls.lua` accrdingly.
Information about different formatters and linters are found at [nvim-null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

For `.toml`files, install taplo using `cargo install taplo-cli --locked` and then install in nvim using LSP server list (`<leader>lI`)

### Debugger
DAP - the client that implement/adapt the debugger server.
virtual text - prints variable value next to the variable during debugging
dap-ui - User interface during debugging
**SKAPA LINKS**

Install a new debugger by adding it to the `~/.config/nvim/lua/user/dap.lua`-file and following the method.
1. dap.adapter.<debugger> - attaches/adapt the debugger software
2. dap.configuration.<debugger> - custom configs
  
  <debuggers> are found at DAP-repo.

The debugger needs to be installed and visible for the compiler/interperter. In pythons case it is recommeded to have it in a virutal environment. Which means that the debugger needs to be installed in the `.virtualenvs/bin/python` environment. Activate a environment by `source .virtualenvs/bin/activate` then install the debugger within the venv my `python -m pip install debugpy`.
    Make sure that the paths in `~/.config/nvim/lua/user/dap.lua`-file find the corret compiler/interperter
