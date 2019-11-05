--扩展postgres_fdw
CREATE EXTENSION postgres_fdw;
--查询postgres的所有拓展，验证fdw安装成功：
select * from pg_available_extensions; 


grant usage on foreign data wrapper postgres_fdw to wangyy; ---授权

------创建外部服务器 192.168.143.11为外部服务器地址
create server fs_DataWare 
foreign data wrapper postgres_fdw 
options(host '192.168.143.11',port '5432',dbname 'ecology');
--查看所有远程连接，验证server创建成功
SELECT * from pg_foreign_server;


--创建远程服务器角色
create user mapping for public server fs_DataWare 
options(user 'wangyy',password 'Wyy123456');

----创建外部表
create foreign table ft_Test(id integer, name character varying(10)[]) --自定义外部表字段
server fs_DataWare options(schema_name 'public',table_name 'Test');

CREATE FOREIGN TABLE public.ft_uf_fixedassets()
    INHERITS (public.uf_fixedassets) --继承远程表字段
    SERVER fs_dataware
    OPTIONS (schema_name 'public', table_name 'uf_fixedassets');



------检验------
select * from ft_Test