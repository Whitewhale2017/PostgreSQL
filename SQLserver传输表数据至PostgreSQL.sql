---SQLServer中执行-----
select * from [192.168.43.200].[DataWare].[public].[hrmresource]

select * from openquery([192.168.43.200],'select * from public.hrmresource')


insert into openquery([192.168.143.11],'select * from public.hrmresource') select top 1 * from hrmresource -- PostgreSQL10.0 ¸Ã°æ±¾´ËÓï¾ä¿ÉÖ´ÐÐ

insert into openquery([192.168.143.12],'select * from public.hrmresource') select top 1 * from hrmresource -- PostgreSQL12.0 ¸Ã°æ±¾´ËÓï¾äÖ´ÐÐÒì³£


insert into openquery([192.168.143.12],'select * from public.hrmresource') select top 1 * from hrmresource -- PostgreSQL11.0 ¸Ã°æ±¾´ËÓï¾ä¿ÉÖ´ÐÐ

insert into openquery([192.168.43.200],'select * from public.hrmresource') select top 1  * from hrmresource 