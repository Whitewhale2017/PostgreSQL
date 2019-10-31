select ctid,* from hrmresource where id in (
select id from public.hrmresource group by id having count(1)>1
	);
	
select ctid,* from hrmresource where ctid='(0,1)';

select ctid,* from hrmresource where ctid in ('(0,1)','(0,2)');


delete from hrmresource where 
id in (select id from public.hrmresource group by id having count(1)>1) and ctid not in ('(0,1)')