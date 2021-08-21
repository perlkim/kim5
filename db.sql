create user kim5 with password 'kim5' ;

ALTER USER kim5 WITH PASSWORD 'kim5';

create database kim5_dev with encoding='utf8' ;
create database kim5_test with encoding='utf8' ;

grant all privileges on database kim5_dev to kim5 ;
grant all privileges on database kim5_test to kim5;

\connect kim5_dev;
create schema extensions;
create extension hstore schema extensions;
ALTER DATABASE kim5_dev SET search_path to "$user",public,extensions;
alter database kim5_dev owner to kim5;
alter schema public owner to kim5;
alter schema extensions owner to kim5;
GRANT USAGE ON SCHEMA public to kim5;

\connect kim5_test;
create schema extensions;
create extension hstore schema extensions;
ALTER DATABASE kim5_test SET search_path to "$user",public,extensions;
alter database kim5_test owner to kim5;
alter schema public owner to kim5;
alter schema extensions owner to kim5;
GRANT USAGE ON SCHEMA public to kim5;