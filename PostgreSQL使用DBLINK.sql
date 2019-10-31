--create extension dblink;

select * from dblink('host=192.168.43.200 dbname=DataWare user=wangyy password=Wyy123456','select id,lastname from hrmresource') 
as t
(
    id integer,
    lastname character varying(1000)
)
