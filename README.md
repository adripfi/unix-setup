# Configuration and Tools for Unix environments

## General setup
### Ubuntu Theme 
1. Install Yaru-Blue theme by cloning this repo:
    ```shell
    git clone https://github.com/Jannomag/Yaru-Colors.git
    ```
    Then run the `install.sh` script in the repo and follow the instructions. Only install the theme and omit to install the icon pack. Also, skip activating the theme, we will do that later.
    Install gnome tweaks and shell extensions:
    ```shell
    sudo apt install gnome-shell-extensions gnome-shell-extension-prefs gnome-tweaks
    ```
2. Install the user themes shell extension by heading to this website (you need to have the shell extension browser addon installed) <br>
  https://extensions.gnome.org/extension/19/user-themes/
3. Now open the "Extensions" app and activate "User Themes". After
4. Open the "Tweaks" app and under "Appearance" select the Yaru-Blue-Dark theme for Applications and Shell. While you are here also switch the Caps-Lock and Esc key and set a custom wallpaper for the Desktop and Lockscreen

### Fonts
1. Install GNOME's font manager:
  ```bash
  sudo apt install font-manager
  ```
3. Then download and install JetBrains Mono Nerd Font: https://www.nerdfonts.com/font-downloads.


### Chrome over scroll history navigation 
1. Edit the Chrome desktop file `/usr/share/applications/google-chrome.desktop` and append the following flag to all `Exec= ..` lines (should be three):
  ```shell
  --enable-features=TouchpadOverscrollHistoryNavigation
  ```
2. To persist this, copy /usr/share/applications/google-chrome.desktop to ~/.local/share/applications
  ```shell
  cp /usr/share/applications/google-chrome.desktop ~/.local/share/applications/
  ```

### Python setup 
Download and install mambaforge: https://github.com/conda-forge/miniforge#mambaforge.


## CLI setup
### Kitty
1. Install Kitty according to the official documentation https://sw.kovidgoyal.net/kitty/binary/.
  ```bash
  curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
  ```
2. Make sure to integrate it into GNOME properly by creating a `.desktop` file as explained in the doco.

3. Lastly copy the Kitty configuration from this repo into your `.config` folder

   
### Neovim 
1. Head over to https://github.com/neovim/neovim/releases/tag/stable and download to latest AppImage.
2. Make it executable:
  ```
  chmod u+x ./nvim.appimage
  ```
3. Then move it to a folder indexed in your `$PATH`:
  ```
  sudo mv nvim.appimage /usr/local/bin/nvim
  ```
3. Also install neovim python support for your system interpreter:
  ```
  sudo apt-get install python3-neovim
  ```
  as well as your mamba/conda base enviroment:
  ```bash
  python3 -m pip install --user --upgrade pynvim
  ```
4. opy the `.config/nvim` folder from this repo into your home director and run `nvim` to install all plugins. 
5. As a last step you may want to install Python and C++ Lsp servers using mason. Simply type `<space>+c+m` to open the mason menu and install them. 



### ZSH
1. Install zsh:
  ```
  sudo apt install zsh
  ```
2. Install oh-my-zsh:
  ```zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```
3. Download plugins:
  ```zsh
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
    ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
  git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
  ( cd $ZSH_CUSTOM/plugins && git clone https://github.com/chrissicool/zsh-256color )
  ```
3. Then copy the `.zshrc` from this repo into your home directory. 
4. Now you can initialize mamba/conda
  ```
  mamba init zsh 
  ```
3. Afterwards check your `.zshrc` if everything worked out and there are no duplicates. 
  Make sure to comment the following lines in `.zshrc` if you are using ROS:
    ```zsh
    #        . "/home/adrian/mambaforge/etc/profile.d/conda.sh"
    ```
    as well as this line:
    ```zsh
    #    . "/home/adrian/mambaforge/etc/profile.d/mamba.sh"
    ```

### Starship Prompt
1. Download and install Starship shell prompt:
    ```shell
    curl -sS https://starship.rs/install.sh | sh
    ```
2. Set Starship Nerd Font Symbols, make sure you installed the JetBrains Mono Nerd Font:
   ```shell
   starship preset nerd-font-symbols -o ~/.config/starship.toml
   ```

### FZF
Install fuzzy finder but **do not activate** its keybindings during setup; we have done that already in the `.zshrc` file:
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### NNN
1. Check offical guide for changes before running any commands: https://github.com/jarun/nnn/wiki/Usage#installation
2. Download and extract the latest *nnn* release: https://github.com/jarun/nnn/releases/
3. Install all prerquisits:
   ```
   sudo apt-get install pkg-config libncursesw5-dev libreadline-dev
   ```
4. Compile nnn with nerd symbols on:
  ```
  make O_NERD=1 
  ```
  then install it:
  ```
  sudo make strip install
  ```
5. Lastly download adn install all plugins:
   ```
   sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
   ```




