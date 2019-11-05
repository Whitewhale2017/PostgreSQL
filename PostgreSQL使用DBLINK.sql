create extension dblink;

select * from 
dblink('host=192.168.143.11 dbname=ecology user=wangyy password=Wyy123456','select id,lastname from hrmresource') 
as t
(
    id integer,
    lastname character varying(1000)
)

--常规使用
select * from dblink('host=192.168.0.105 port=5432 dbname=yjtBackstagePermissions 
					 user=postgres password=123456','select "NikeName" from "People"') 
					 AS testTable ("NikeName" VARCHAR);

CREATE VIEW people_nikename_view AS 
2 select * from dblink('host=192.168.0.105 port=5432 dbname=yjtBackstagePermissions 
					   user=postgres password=123456','select "NikeName" from "People"') 
					   AS testTable ("NikeName" VARCHAR);

--如果不只是查询数据，而是需要修改数据库数据的情况下怎么弄呢？
1. 先执行dblink_connect保持连接
 SELECT dblink_connect('mycoon','host=192.168.0.105 port=5432 dbname=yjtBackstagePermissions user=postgres password=123456');  
2. 执行BEGIN命令
 SELECT dblink_exec('mycoon', 'BEGIN');
3. 执行数据操作（update，insert，create等命令）
 SELECT dblink_exec('mycoon', 'insert into tb1 select generate_series(10,20),''hello''');
 SELECT dblink_exec('mycoon', 'insert into people(username,nikename) values ("张三","小三") ');
4. 执行事务提交
 SELECT dblink_exec('mycoon', 'COMMIT');
5. 解除连接
 SELECT dblink_disconnect('mycoon');
 
 
 /**关闭某个dblink链接**/
select dblink_disconnect('dblinktest');

/**查询所有已链接的dblink**/
select dblink_get_connections();

/**删除dblink**/
DROP  extension dblink