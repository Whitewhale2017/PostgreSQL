select * from [192.168.43.200].[DataWare].[public].[hrmresource]

select * from openquery([192.168.43.200],'select * from public.hrmresource')


insert into openquery([192.168.143.11],'select * from public.hrmresource') select top 1 * from hrmresource -- PostgreSQL10.0 该版本此语句可执行

insert into openquery([192.168.143.12],'select * from public.hrmresource') select top 1 * from hrmresource -- PostgreSQL12.0 该版本此语句执行异常

insert into openquery([192.168.43.200],'select * from public.hrmdepartment') select top 1  * from hrmdepartment