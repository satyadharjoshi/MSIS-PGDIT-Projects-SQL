	-- create login uses windows authenticatinoi
	-- and is associated with a security group

	create login
	[TC\TP_Doctors]
	from windows

	-- aaces views to verify that the login has been createdd

	select * from sys.server_principals


	create login [TC\md1] from windows


	-- create db sers and rile

	Use TouroPharmacy


	select suser_name()

	--execute as login "TP\md1"

	-- set up a user associated with win aut group login

	-- windows autheticaeted user login


	create user [MD1] for login [TC\md1]

	create user [TPDoctors] for login [TC\TP_Doctors]


	--execute as user ='MD1'

	use master
	 go

	 create server role [dbonlycreator] 

	 -- view type of permission language

	 select * from 
	 sys.fn_builtin_permissions('Server')

	-- select * from 
	 exec sp_srvrolepermission @srvrolename = 'dbcreator'

	 --assign a permission to a login

	 grant create any database to dbonlycreator 


	 -- view query for exiclpit persomis

	 select * from sys.server_principals per
	 inner join sys.server_permissions PR
	 on pr.grantee_principal_id = per.principal_id


	 use TouroPharmacy

	 -- create database role

	 create role Doctorrole

	 --assign permission to the doctor role
	 --assign shcema level persoomn to the doc role
	 -- asisgn talb level persmiion
	 --finally oibjecty level permsoisi
	 select * from sys.fn_builtin_permissions('Database')


grant select to DoctorRole  


deny select on schema::Sales to doctorrole


deny select on HR.Job to Doctorrole

deny select on object::HR.Physician(DR_city) to  Doctorrole

alter role doctorrole 
add member TPdoctors

