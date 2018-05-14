use master
go
create database AdminDB
go
use admindbgo
Create table Test
(
TestID int primary key,
Testdescription varchar(20) not null
)