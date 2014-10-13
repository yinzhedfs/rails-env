sudo apt-get install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev  -y
sudo apt-get install libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion -y
sudo apt-get install mysql-client screen mysql-server git-core -y
sudo apt-get install libmysqlclient-dev -y
sudo apt-get install libicu-dev -y
sudo apt-get install nginx -y
sudo apt-get install nodejs -y
sudo apt-get install memcached -y
sudo apt-get install imagemagick -y
sudo apt-get install libmagickwand-dev -y
sudo apt-get install redis-server -y

sudo /usr/sbin/update-rc.d -f nginx defaults
sudo /usr/sbin/update-rc.d -f mysql defaults
sudo /usr/sbin/update-rc.d -f memcached defaults


# 安装 rbenv
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
# 用来编译安装 ruby
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
# 用来管理 gemset, 可选, 因为有 bundler 也没什么必要
git clone git://github.com/jamis/rbenv-gemset.git  ~/.rbenv/plugins/rbenv-gemset
# 通过 gem 命令安装完 gem 后无需手动输入 rbenv rehash 命令, 推荐
git clone git://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
# 通过 rbenv update 命令来更新 rbenv 以及所有插件, 推荐
git clone https://github.com/rkh/rbenv-update.git ~/.rbenv/plugins/rbenv-update

echo '' >> .profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> .profile
echo 'eval "$(rbenv init -)"' >> .profile
echo '' >> .profile
. .profile

rbenv install 2.1.1
rbenv global 2.1.1
gem sources --remove https://rubygems.org/
gem sources -a https://ruby.taobao.org/
gem sources -l
gem install bundle
gem install thin

sudo thin install
sudo /usr/sbin/update-rc.d -f thin defaults

