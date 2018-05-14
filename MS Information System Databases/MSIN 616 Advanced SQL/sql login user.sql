use adventureworks2014
go


update [AdventureWorks2014].[Person].[PersonPhone]
set ciphertext =
encryptbyasymkey(asymkey_id('SecureAsymmetricKey'),PhoneNumber )

where BusinessEntityID = 2







select * from [AdventureWorks2014].[Person].[PersonPhone]

select * from sys.asymmetric_keys