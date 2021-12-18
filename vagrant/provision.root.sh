#! /bin/bash  -xue

echo  Provisioning $HOSTNAME

sudo  timedatectl  set-timezone Asia/Tokyo

sudo  apt  update

export DEBIAN_FRONTEND=noninteractive
sudo  -E  apt  upgrade -y

sudo  apt  install -y  build-essential                          \
    cmake  doxygen  emacs  git  mercurial                       \
    autoconf  automake   clang  gcc  g++                        \
    libcppunit-dev  libtool  ncurses-dev                        \
    make  time  sudo                                            \
    language-pack-ja-base  language-pack-ja                     \
    fcitx  fcitx-mozc  ibus-mozc

sudo  apt  install -y  ubuntu-desktop
sudo  apt  install -y  qemu

# NASM
sudo  apt  install -y  nasm

# Docker
sudo  apt  install -y  ca-certificates  curl  gnupg
curl  -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu focal stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list
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
