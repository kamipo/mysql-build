# mysql-build

mysql-build - provides a command to compile and install different versions of MySQL.

The overall structure is loosly borrowed from Sam Stephenson's [ruby-build](https://github.com/sstephenson/ruby-build).

## Installation

```
git clone https://github.com/kamipo/mysql-build.git ~/mysql-build

export PATH="$HOME/mysql-build/bin:$PATH"
```

## Usage

```
mkdir -p ~/opt/mysql
mysql-build -v 5.7.10 ~/opt/mysql/mysql-5.7.10

cd ~/opt/mysql/mysql-5.7.10
./bin/mysqld --initialize-insecure --basedir=.
./bin/mysqld_safe &

./bin/mysql -e 'SELECT @@version'
```
