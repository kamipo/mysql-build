# mysql-build

mysql-build - provides a command to compile and install different versions of MySQL.

## Installation

```
git clone git://github.com/kamipo/mysql-build.git ~/mysql-build

export PATH="$HOME/mysql-build/bin:$PATH"
```

## Usage

```
mkdir -p ~/opt/mysql
mysql-build -v 5.6.13 ~/opt/mysql/5.6.13

cd ~/opt/mysql/5.6.13
./scripts/mysql_install_db
./bin/mysqld_safe &

./bin/mysql -e 'show variables like "version"'
```
