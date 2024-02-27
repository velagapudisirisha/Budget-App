#!/bin/bash
set -e

# Create a custom user and database
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER Sirisha WITH PASSWORD 'password';
    CREATE DATABASE Ruby_database;
    GRANT ALL PRIVILEGES ON DATABASE Ruby_database TO Sirisha;
EOSQL

