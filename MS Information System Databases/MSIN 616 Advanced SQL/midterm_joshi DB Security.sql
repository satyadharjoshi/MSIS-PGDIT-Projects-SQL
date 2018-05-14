-- select * from sys.server_principals_PR


--1

select * from sys.server_principals PR
inner join sys.server_permissions PER
on PR.principal_id = 
per.grantee_principal_id
where principal_id = 269

-- principal id 269 is of the Aviation

--16
Use master
go
create login [TC\AVCoAgents] from windows


--17
Use master
go
create login [TC\AVCoDBAs] from windows



--Question 18
Use master
go
create login RemoteLogin WITH password = 'm!dTerm2018' 

-- 19

Use AviationCompany
Go
--Did using GUI




--20
Use AviationCompany
Go
create user [agentuser] for login [TC\AVCoAgents]

--21
Use AviationCompany
Go
create user [dbauser] for login [TC\AVCoDBAs]


--22

Use AviationCompany
Go
create user [remoteuser] for login [TC\AVCoDBAs]



--23
Use AviationCompany
Go
create role AVCoAgentRole

--24
Use AviationCompany
Go
create role AVCoRemoteRole


-- 25

-- DId in GUI

--26
--Did in GUI screnshot attached in file


--27
Use AviationCompany
Go
deny select on schema::HR to AVcoAgentRole

--28


deny select on object::Sales.Customer(Cus_Balance) to AVcoAgentRole
--deny alter on object::Sales.Customer(Cus_Balance) to AVcoAgentRole



--29
grant select on Flights.Charter to AVcoAgentRole
deny select on object::Flights.Charter(Cus_code) to AVcoAgentRole


--30






EXEC sys.Pp_addlogin
  @logname = 'cuistomerlogn'GRANT



















-- list permissions of all users
SELECT DB_NAME() AS 'DBName'
      ,p.[name] AS 'PrincipalName'
      ,p.[type_desc] AS 'PrincipalType'
   ,dbp.permission_name as 'PermissionName'
      ,p2.[name] AS 'GrantedBy'
      ,dbp.[state_desc]
      ,so.[Name] AS 'ObjectName'
      ,so.[type_desc] AS 'ObjectType'
  FROM [sys].[database_permissions] dbp LEFT JOIN [sys].[objects] so
    ON dbp.[major_id] = so.[object_id] LEFT JOIN [sys].[database_principals] p
    ON dbp.[grantee_principal_id] = p.[principal_id] LEFT JOIN [sys].[database_principals] p2
    ON dbp.[grantor_principal_id] = p2.[principal_id]

WHERE p.type = 'R'

crreate login customerlogin WITH passwrod ="xxx"EXEC sys.Pp_addlogin
  @logname = 'cuistomerlogn'GRANT
CREATE TABLE TO developer_roleDENY
SELECT
ON SCHEMA::humanresourec TO developer_roleGRANT
SELECT
ON prodcution.priciton TO awscusetem_roleDENY
SELECT
ON object::pridction.parent (stanardarcost) TO awcustomerrole exce sp_serverloleperssmion@sernerolname ='dbcreator' 


--create login that uses windows
--authentication and is associated 
--with a windows security group
create login
[TC\TP_Doctors]
from windows
--access views to verify that
--the login has been created
select * from 
sys.server_principals
--create a login for a specific windows user
create login [TC\md1] from windows
--create database users and database roles
--first activate the database
use TouroPharmacy
--find out who is connected now
select suser_name()
--set up a user associated with
--windows authenticated group login
create user [TPDoctors] for login [TC\TP_Doctors]
--set up a user associated with
--windows authenticated user login
create user [MD1] for login [TC\md1]
--execute as user = 'MD1'

--create a server role
use master
go 
--create server role
create server role [dbOnlyCreator]
--view the types of permissions available on the server level
select * from
sys.fn_builtin_permissions('SERVER')

--view the permissions granted to dbcreator
exec sp_srvrolepermission @srvrolename = 'dbcreator'

--assign a server level permission to a login
grant create any database to dbOnlyCreator
--to view the explicit permissions granted to a server login
select * from sys.server_principals PR
inner join sys.server_permissions PER
on PR.principal_id = 
per.grantee_principal_id

use TouroPharmacy
--create a database role 
create role DoctorRole
--assign database level permission to doctor role
select * from
sys.fn_builtin_permissions('DATABASE')
grant select to DoctorRole
--assign schema level permission to doctor role
deny select on schema::SALES to DoctorRole
--assign table level permission
deny select on HR.Job to DoctorRole
--assign object level permission
deny select on object::HR.Physician(DR_LicenseID) to DoctorRole

--add doctor user as a member of DoctorRole
alter role doctorrole
add member TPDoctors