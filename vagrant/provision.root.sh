#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update

export DEBIAN_FRONTEND=noninteractive
sudo  -E  apt  upgrade -y

sudo  apt  install -y           \
    autoconf                    \
    automake                    \
    build-essential             \
    clang                       \
    cmake                       \
    doxygen                     \
    emacs                       \
    g++                         \
    gcc                         \
    git                         \
    libcppunit-dev              \
    libtool                     \
    make                        \
    mercurial                   \
    ncurses-dev                 \
    sudo                        \
    time                        \
                                \
    language-pack-ja-base       \
    language-pack-ja            \
                                \
    fcitx                       \
    fcitx-mozc                  \
    ibus-mozc                   \
    ;

sudo  apt  install -y  ubuntu-desktop
sudo  apt  install -y  qemu

# NASM
sudo  apt  install -y  nasm

# Docker
sig_file='/usr/share/keyrings/docker-archive-keyring.gpg'
docker_url='https://download.docker.com/linux/ubuntu'

sudo  apt  install -y  ca-certificates  curl  gnupg
curl  -fsSL  ${docker_url}/gpg      \
    | sudo  gpg  --no-tty  --dearmor  -o ${sig_file}
echo "deb [arch=amd64 signed-by=${sig_file}] ${docker_url} focal stable"    \
    | sudo  tee  /etc/apt/sources.list.d/docker.list

sudo  apt  update
sudo  apt  install -y  docker-ce

# clean up
sudo  apt  -y  --purge  autoremove
sudo  apt  autoclean
sudo  apt  clean

sudo  rm -f  /var/lib/apt/lists/lock
sudo  rm -f  /var/cache/apt/archives/lock
sudo  rm -f  /var/lib/dpkg/lock

sudo  rm  -rf  /tmp/*
sudo  dd  if=/dev/zero  of=zero  bs=4k  || :
sudo  rm  -f   zero

history  -c
