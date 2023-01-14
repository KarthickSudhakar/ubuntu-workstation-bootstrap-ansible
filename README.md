# Bootstrap Ubuntu Based Workstation Using Ansible 

This repo contains playbook and tasks which will setup your ubuntu and it's derivative distribution. This repo can be expanded further to suit your needs.

Tasks are grouped under roles/ directory.

```sh
roles
├── browser
├── docker
├── git
├── media
├── repo
├── sys-tools
├── terminal
└── text_editors
```

Download and run the playbook with following commands.

```sh
$ git clone https://github.com/KarthickSudhakar/ubuntu-workstation-bootstrap-ansible.git
$ cd ubuntu-workstation-bootstrap-ansible
$ ansible-playbook -K -b bootstrap.yml
```

When you run the playbook 

- First prompt => Enter the current distribution release name like Jammy, Focal, Kudu etc. By default it is set to "Jammy". This will enable universe, multiverse, restricted repository along with flatpak. Relevant task is under `roles/repo/tasks/main.yml`.

- Second prompt => Enter the user name. This user will be added to the docker group and will be treated as your primary user.

### LIST OF TOOLS INSTALLED 

Following tools will be installed when you run the playbook

|ROLE | ROLE PATH  | PACKAGE  |
|-----|------------|----------|
|Repo | roles/repo/|Ubuntu repo & Flatpak |
|Docker|roles/docker/|Docker, Docker compose plugin & Docker Python SDK |
|Browser|roles/browser/|Chrome & Brave |
|Text Editors|roles/text_editors|Joplin, Zim Wiki, Neovim, Sublime Text, VSCode|
|Git | roles/git/ | Sublime Merge |
|Media| roles/media/ | Gimp, Darktable, Flameshot, Ksnip, Peek, Vlc media player|
|Sys Tools| roles/sys-tools| Jq, Curl, Wget, Htop, Cowsay, Rsync, Grsync, Neofetch, Tree, Stacer, Gparted,Copyq, Gnome-Tweaks, Ufw, Gufw, Timeshift, Qbittorrent, Docnf-Editor, Xclip|
|Terminal| roles/terminal/ | Kitty, Fish, Tmux |


