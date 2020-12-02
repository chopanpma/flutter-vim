# python-vim

Docker with customizeable vim configuration.

## Features
- Zsh with Oh-My-Zsh and Powerlevel 9K theme.
- Fuzzy finder for files, including hidden files.
- Ripgrep, a powerful recursive searcher.
- Lazygit integration.
- Git blame integration.
- Formatter based on visual mode selections.
- Icons in nerd tree.
- Customizable .vimrc file, so you can add your own keybindings or preferred plugins.
- Customizable .zshrc file, so you can add your preferred terminal theme.
- Customizable .bash_aliases file, so you can add your preferred aliases.
- Mouse resizable panels.

## Installation and documentation

### Installation instructions:

Before you can use this version of python-vim, you must build the image first.

To do this, ensure you are in this project, and run the following command and wait for it to complete:
```
docker build --tag python-vim-regular:1.0 .
```

After the image is built successfully and is in your local image repository, add the following bash alias to .bash_aliases:
```bash
alias pvr='docker run -it --rm -v $(pwd):/src -v /var/run/docker.sock:/var/run/docker.sock -v /home/$(whoami)/.ssh:/root/.ssh --workdir /src python-vim-regular:1.0'
```
It does the following:
- Mounts your current directory as a volume called /src to the container, so that you can modify the files in the host (your) system.
- Mounts your .ssh directory to the container as a volume so that you can use lazygit inside a terminal in the container.
- Mounts your docker.sock from your host system into the container as a volume so you can run docker commands inside the container. 
- It runs the docker image you just built in the previous step.

### Use instructions:
Run the following command in the directory you want to write code:
```bash
pvr
```

### Useful shortcuts:
The format followed is: keybinding: description
If you want to disable or add a particular keybinding, you have to modify config/.vimrc, then rebuild the image. After that, no further action is needed. 
In normal mode:
```
,e: File fuzzy finder with file preview.
we: Shortcut for :w.
vt: Opens a vertical terminal to the right.
tv: Opens an horizontal terminal at the bottom.
,,.: Toggles ctags menu, showing you classes and functions defined in a file.
,,: Shortcut for commenting the line where the cursor is. Can also comment lines selected in visual mode.
nl: Toggles relative numbers.
alt g: Shows git blame (who made a change and when) information of line under cursor.
vf: Selects in visual mode from cursor to end of line.
lt: Opens lazygit in a new tab.
lg: Opens lazygit in a side panel.
tt: Opens a terminal in a new tab.
ctrl f: Activates ripgrep, which allows you to search for strings recursively throughout the project.
qq: Shortcut for :q!.
kj: Shorcut for <Esc>.
alt s: Shortcut for :,$s/, which searches for something and replaces it after cursor.
vv: Opens a side panel.
vs: Opens a bottom panel.
nh: Toggles off highlight after searching for something.
alt f: Formats visual mode selection using autopep8. Can be modified to use formatter of choice.
alt b: Shortcut for writting import ipdb; ipdb.set_trace().
```
