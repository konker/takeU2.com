#!/bin/sh

# Run the commands necessary to create a postgresql user and database for a rails app
# Takes a name, usually the name of the rails app.
# Assumes that the superuser `postgres` is able to access the local database.
#
# if you get an error like:
#    psql: FATAL:  Peer authentication failed for user "postgres"
#
# sudo vim /etc/postgresql/9.1/main/pg_hba.conf
#     change the method for user postgres from 'peer' -> 'md5'
#     reload the server

if [ -z "$1" ]; then
    echo "no name specified. aborting."
    exit 1
fi

echo
echo "create user $1..." 
echo "First enter the password for the new role '$1'"
echo "Then re-enter the password for the new role '$1'"
echo "Then enter the password for the user 'postgres'"
createuser --username=postgres --password --no-createdb --no-superuser --no-createrole --pwprompt $1

echo
echo "create database $1_development..."
echo "Enter the password for the user 'postgres'"
createdb --username=postgres --password --owner=$1 --encoding=utf8 "$1_development"

echo
echo "create database $1_test..."
echo "Enter the password for the user 'postgres'"
createdb --username=postgres --password --owner=$1 --encoding=utf8 "$1_test"

echo
echo "create database $1_production..."
echo "Enter the password for the user 'postgres'"
createdb --username=postgres --password --owner=$1 --encoding=utf8 "$1_production"
