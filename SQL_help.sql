#mySQL syntax

##############################  Getting started  ##############################  

/* start MySQL server on Mac */
#Click "Apple" Icon ⇒ System Preferences ⇒ MySQL ⇒ Start or Stop.

/* start MySQL client on Mac */
#go to right directory
[~]$ cd /usr/local/mysql/bin

#prompt for password
./mysql -u root -p

#should show: mysql>

###############################################################################


#create db
create database if not exists mydb;

### show db ###
show databases;

#use db
use mydb;
drop table if exists mydb;

#create tbl
create table mytable (cust_id int, name varchar(50), amount float);

### show tbl ###
show tables;

#describe tbl
describe mytable;

#insert records into tbl
insert into mytable values (007, 'ABC', 100);

#take a look of the *tbl*
select * from mytable;

#update entries in tbl
update mytable set cust_id = 101 where name = 'ABC';

#rename tbl name
rename table mytable to newTable;

#rename column name in tbl
alter table newTable change `amount` `address` varchar(50);

#quit
quit
