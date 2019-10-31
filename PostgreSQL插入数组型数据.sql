CREATE TABLE public."Test"
(
    id integer,
    name character varying(10)[] COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE public."Test"
    OWNER to wangyy;

insert into public."Test" values(4,'{1,2,3}');

insert into public."Test" values(2,'{lili,cici}');

insert into public."Test" values(5,array['cici']);

update public."Test" set name=array['wangyy','Lili'] where id=1;