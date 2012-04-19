mysql-build
==========

Install
----------

```
git clone git://github.com/kamipo/mysql-build.git

export PATH="$HOME/mysql-build/bin:$PATH"

mkdir -p ~/opt/mysql
mysql-build -v 5.6.5-m8 ~/opt/mysql/5.6.5-m8

cd ~/opt/mysql/5.6.5-m8
./scripts/mysql_install_db
./bin/mysqld_safe &

./bin/mysql -e 'show variables like "version"'
```
