My preferred config setup, at the moment. Used to share important items across machines.

## Acknowledgements

Thanks to the open-source community who spend so much volunteer time to create these amazing tools.

### Sources

TNTC but here are some:

- [Jessica Deen's Badass Terminal](https://jessicadeen.com/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/)
  - I don't use vim very much so I skipped that but otherwise the entire beginning was perfect (especially her custom font)
  - I subbed [powerline](https://github.com/powerline/powerline)
- [Oh-My-Zsh](https://ohmyz.sh/) - the most popular zsh setup

## New Macbook Setup Checklist

### Productivity

- TimeOut (App Store) - microbreak 30sec every 20min for the old peepers
- [Spectacle](https://www.spectacleapp.com/) for window management shortcuts
- Flycut clipboard manager (App Store)
- [Alfred 4](https://www.alfredapp.com/) - Don't install via App Store (outdated version)
  - Remove the default Cmd+Space shortcut for Spotlight so you can set Alfred
  - [Web search NPM](alfred://customsearch/NPM%20Pkg%20Search/npm/utf8/nospace/https%3A%2F%2Fwww.npmjs.com%2Fsearch%3Fq%3D%7Bquery%7D) - if it doesn't open via browser, make sure you're on 4.x (not app store)

### Coding

- [Homebrew](https://brew.sh/)
  - `brew install tree wget git tmux`
- [oh-my-zsh](https://ohmyz.sh/#install)
  - `brew install fzf` and then `$(brew --prefix)/opt/fzf/install` (you can skip adding to config since it's already in the version in this repo)
- [rbenv](https://github.com/rbenv/rbenv#homebrew-on-macos) - needed even if you don't intend to do much ruby dev, for utils like tmuxinator
- Setup plain tmux
  - `brew install tmux`
  - tpm: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  - `prefix + I` to fetch other plugins via tpm
- [tmuxinator](https://github.com/tmuxinator/tmuxinator) - `gem install tmuxinator` (if your system ruby is from rbenv)
- [manually install nvm](https://github.com/nvm-sh/nvm#install--update-script) - using homebrew install + tmux gave me [prefix errors](https://github.com/nvm-sh/nvm#macos-troubleshooting)
- Install [Input](https://input.fontbureau.com/info/) font for IDE/editor

### Misc

- Set hostname in Sharing settings and using `sudo scutil --set HostName mr-peanutbutter`
- Power On Time (App Store) - uptime widget
- Amphetamine (App Store)
- Mini Calendar (App Store)
