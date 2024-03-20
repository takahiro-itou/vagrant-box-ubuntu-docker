# vagrant-box-ubuntu-gui

デスクトップパッケージをインストールした Ubuntu 18.04 (bionic) 64 bit

## ボックスを自前で作成する

### クローン

```bash
git clone git@gitlab.com:takahiro-itou/vagrant-box-ubuntu-docker.git
cd  vagrant-box-ubuntu-docker
```
### ボックス作成

```bash
./setup.sh
```

### 作成したボックスを登録する。

```bash
vagrant box add  --name <yourname>/ubuntu-jammy64-docker  ubuntu-jammy64-docker.v1.1.1.box
```

## 作成済みのボックスをダウンロードして使う

takahiro-itou/ubuntu-jammy64-docker
- https://app.vagrantup.com/takahiro-itou/boxes/ubuntu-jammy64-docker
