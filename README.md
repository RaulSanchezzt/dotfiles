# Dotfiles

This are my personal `dotfiles` that I use. Check it, fork or ask me for any question. 

## Installation
1. Clone this repository and change the directory

```bash
git clone https://github.com/RaulSanchezzt/dotfiles.git ~/dotfiles && cd ~/dotfiles
```

2. This script will automatically create the necessary symbolic links to this `dotfiles`. Give the current user execute permissions

```bash
chmod +x link.sh
```

3. Run the script

```bash
./link.sh
```

> Close the terminal and open another to see the changes

- To update the configuration use `git pull` inside the `dotfiles` directory.

## Keybindings
> These are the  keybindings of this window manager.

### Window Manager (bspwm & sxhkd)
| Key                               | Action                                                                                              |
|-----------------------------------|-----------------------------------------------------------------------------------------------------|
| Super + W                         | Close the current window                                                                            |
| Super + ALT + R                   | Restart the bspwm configuration                                                                     |
| Super + ALT + Q                   | Logout                                                                                              |
| Super + ESC                       | Restart the sxhkd configuration                                                                     |
| Super + (⬆⬅⬇➡)                    | Move through the windows in the current workspace                                                   |
| Super + (1,2,3,4,5,6,7,8)         | Change the workspace                                                                                |
| Super + ALT + Space               | Change polybar theme                                                                                |
| Super + M                         | Change the current window to "full" mode. Press the same keys to return to "terminal" (normal) mode |
| Super + G                         | Swap the current node and the biggest node                                                          |
| Super + T                         | Set the window state to tilted                                                                      |
| Super + S                         | Set the window state to floating                                                                    |
| Super + Shift + (1,2,3,4,5,6,7,8) | Move the current window to another workspace                                                        |
| Super + ALT + (⬆⬅⬇➡)              | Resize a floating window                                                                            |
| Super + Shift + (⬆⬅⬇➡)            | Change the position of tilted windows                                                               |
| Super + CTRL + (⬆⬅⬇➡)             | Preselect the direction                                                                             |
| Super + CTRL + (⬆⬅⬇➡)             | Preselect the ratio                                                                                 |
| Super + CTRL + Space              |                                                                                                     |

## Apps
| **Key**           | **Action**     |
|-------------------|----------------|
| Super + Enter     | kitty          |
| Super + Shift + F | Firefox        |
| Super + Shift + A | Settings       |
| Super + Shift + S | Smile (Emojis) |
| Super + Shift + Z |                |
| ALT + Space       | rofi           |

## References
Check out this repositories if you want to learn more about this. I used this as an inspiration and it was very helpful.

- https://github.com/nozerobit/colorful-kali
- https://github.com/adi1090x/polybar-themes
- https://github.com/romkatv/powerlevel10k
- https://github.com/NvChad/NvChad
- https://github.com/s4vitar
- https://github.com/antoniosarosi/dotfiles
- https://github.com/mathiasbynens/dotfiles
