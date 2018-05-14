create database je
go

use je
go


create master key
encryption by password = 'Allahhuakbar123!'
go

select * from sys.symmetric_keys
go



create asymmetric key SecureAsymmetricKey
with algorithm = RSA_2048
encryption by password = 'Allahhuakbar123!'
Go

select * from sys.asymmetric_keys

create table AsymmetricTable (
ID INT identity(1,1) Primary key,
Plaintext nvarchar(100) null,
cyphertext varbinary(max) null)

insert into AsymmetricTable(
Plaintext,cyphertext
)

values 
(N'test', 
encryptbyasymkey(asymkey_id('SecureAsymmetricKey'),
N'test'))

select * from AsymmetricTable


select id, plaintext, 
convert(nvarchar(100),
decryptbyasymkey(asymkey_id('SecureAsymmetricKey'),
cyphertext,
N'Allahhuakbar123!')) as decryped
from AsymmetricTable


use master
go
create login Encryptionlogin
with password = 'Allahhuakbar123!'



use je
go



create user encryptloginuser for login Encryptionlogin


execute as user = 'encryptloginuser'

select suser_name(), user_name()


select name, is_master_key_encrypted_by_server
from sys.databases

select * from sys.symmetric_keys

select * from sys.asymmetric_keys

create database encp
go


use  encp
go


create master key
encryption by password ='Allahuakbar5'
go


create asymmetric key secureasymmetrickey
with Algorithm = RSA_2048
encryption by password = 'Allahuakbar5'

ALTER TABLE Person.person
ADD column_name datatype; 


create table asymmetrictable(
Id int Identity (1,1) primary key,
plaintext nvarchar(100) null,
ciphertext varbinary(max) null
);


ALTER TABLE [AdventureWorks2014].[Person].[PersonPhone]
ADD ciphertext varbinary(max) null;
 
ALTER TABLE [AdventureWorks2014].[Person].[PersonPhone]
ADD orgtext nvarchar(100) null; 


select * from AsymmetricTable

--insert into [AdventureWorks2014].[Person].[PersonPhone](
--ciphertext
--)
--values 
--( 
--encryptbyasymkey(asymkey_id('SecureAsymmetricKey'),PhoneNumber ))


update [AdventureWorks2014].[Person].[PersonPhone]
set ciphertext =
--select 
encryptbyasymkey(asymkey_id('SecureAsymmetricKey'),PhoneNumber )
--from [AdventureWorks2014].[Person].[PersonPhone]
where BusinessEntityID = 1


update [AdventureWorks2014].[Person].[PersonPhone]
set orgtext =

select 
decryptbyasymkey(asymkey_id('SecureAsymmetricKey'),ciphertext, N'Allahuakbar5' )
from [AdventureWorks2014].[Person].[PersonPhone]
where BusinessEntityID = 1

select * from [AdventureWorks2014].[Person].[PersonPhone]
where BusinessEntityID = 1


use master 
go



create login encryptlogin
with password =  'EncryptL0g!n'

use encp 
go


create user encryptloginuser for login encryptlogin

alter role db_datawriter 
add member encryptloginuser
go

alter role db_datareader
add member encryptloginuser
go


grant view definition on asymmetric  Key :: SecureAsymmetricKey to encryptloginuser

grant  control on asymmetric  Key :: SecureAsymmetricKey to encryptloginuser









 
