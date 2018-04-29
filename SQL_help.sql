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

create table train (
	id int not null, 
	date date, 
	store_nbr int, 
	item_nbr int, 
	unit_sales float, 
	onpromotion bool, 
	primary key (id), 
	foreign key (store_nbr) references stores (store_nbr), 
	foreign key (item_nbr) references items (item_nbr));


### show tbl ###
show tables;

#describe tbl
describe mytable;

#insert records into tbl
insert into mytable values (007, 'ABC', 100);

/* import from csv to table */

LOAD DATA LOCAL INFILE '/Users/qinqingao/Desktop/Study/Kaggle/Groceries/train.csv'
  INTO TABLE train 
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, date, store_nbr, item_nbr, unit_sales, onpromotion);


/* change data type of a field 'unit_sales' to float of table 'train' */

#modify data type
alter table train modify unit_sales float;

#modify column to specify not null
alter table stores modify store_nbr int not null;


/**********************************    Primary keys    ************************************/

-- The PRIMARY KEY CONSTRAINT uniquely identifies each record in a database table.
-- Primary keys must contain UNIQUE values, and cannot contain NULL values.
-- A table can have only ONE primary key, which may consist of single or multiple fields.

/******************************************************************************************/

#modify table to add one column as a primary key
alter table items add primary key (item_nbr);

#modify table to add multiple columns as a primary key constraint
alter table transactions add constraint date_store primary key (date, store_nbr);


/**********************************    Foreign keys    ************************************/

#modify table to add one column as a foreign key
alter table train add foreign key (item_nbr) references items(item_nbr);



#take a look of the *tbl*
select * from mytable limit 10;

#update entries in tbl
update mytable set cust_id = 101 where name = 'ABC';

#rename tbl name
rename table mytable to newTable;

#rename column name in tbl
alter table newTable change `amount` `address` varchar(50);

#delete a table
drop table tblname;


#quit
quit





#check mysql version
select version();
-- +-----------+
-- | version() |
-- +-----------+
-- | 5.7.21    |
-- +-----------+
-- 1 row in set (0.00 sec)


#store query result to another table newly created

create table train_subset
select * from train
where train.date >= '2016-08-15';
