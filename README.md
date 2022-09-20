My preferred config setup, at the moment. Used to share important items across machines, eternally like mitochondrial DNA.

## New Macbook Setup Checklist

### First Things First

- Flycut clipboard manager (App Store)
  - Without this I end up just copying empty lines and ruining my clipboard contents
- [Raycast](https://www.raycast.com/) - like Alfred but better
  - I have so many under muscle memory I can no longer use the default Spotlight
  
### Let's Get Coding

- [Homebrew](https://brew.sh/)
  - `brew install tree wget git`
- [oh-my-zsh](https://ohmyz.sh/#install)
  - `brew install fzf`
  - `$(brew --prefix)/opt/fzf/install` (yes, yes, no - the dotfiles in here already have the config)
- [rbenv](https://github.com/rbenv/rbenv#homebrew-on-macos) - needed even if you don't intend to do much ruby dev, for utils like tmuxinator
  - `brew install rbenv ruby-build` 
- Setup plain tmux 🤵‍♀️
  - `brew install tmux`
  - tpm: `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
  - `prefix + I` to fetch other plugins via tpm
- [tmuxinator](https://github.com/tmuxinator/tmuxinator) - `gem install tmuxinator` (if your system ruby is from rbenv)
- [manually install nvm](https://github.com/nvm-sh/nvm#install--update-script) - using homebrew install + tmux gave me [prefix errors](https://github.com/nvm-sh/nvm#macos-troubleshooting)
- Install [Input](https://input.fontbureau.com/info/) font for IDE/editor

### Productivity - GUI Apps
- 🗓 MeetingBar (App Store) - see your next meeting and join with one click
- 👓 [Spectacle](https://www.spectacleapp.com/) for window management shortcuts
- 💊 Amphetamine (App Store) - Note: should NOT be used to avoid screen timeout. That would be insecure!

### Bonus Extras 🎁

- Think of a truly awesome hostname
  - I have been using cartoon characters since my first job named its servers that way (non-cloud metal!)
  - Set hostname in Sharing settings in the UI
  - then use `sudo scutil --set HostName mr-peanutbutter`
- TimeOut (App Store) - microbreak 30sec every 20min for the old peepers
- `brew install cowsay`

## Acknowledgements

Thanks to the open-source community who spend so much volunteer time to create these amazing tools.

### Sources

TNTC but here are some:

- [Jessica Deen's Badass Terminal](https://jessicadeen.com/macos-ohmyzsh-tmux-vim-iterm2-powerlevel9k-badass-terminal/)
  - I don't use vim very much so I skipped that but otherwise the entire beginning was perfect (especially her custom font)
  - I subbed [powerline](https://github.com/powerline/powerline)
    - This is a bit finnicky to set up
    - Once `pyenv` is properly installed (I used the latest stable 3.x version to set as global), I used the install instructions: https://powerline.readthedocs.io/en/latest/installation.html#pip-installation
    - In `~/.pyenv/versions/3.9.9/lib/python3.9/site-packages/powerline/config_files/themes/tmux` I renamed the existing `default.json` and symlinked the copy in this repo
- [Oh-My-Zsh](https://ohmyz.sh/) - the most popular zsh setup

