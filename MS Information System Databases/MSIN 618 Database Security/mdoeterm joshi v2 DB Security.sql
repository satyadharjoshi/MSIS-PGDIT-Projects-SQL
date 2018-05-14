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
















