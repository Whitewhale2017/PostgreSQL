--PostgreSQL 11 增加了一个新的模式对象：存储过程
CREATE TABLE tbl(id int, name text);

CREATE PROCEDURE proc1(pid integer, pname text)
LANGUAGE sql
AS $$
INSERT INTO tbl(id, name) VALUES (pid, pname);
$$;

CALL proc1(1, 'the first value');
CALL proc1(pname=>'the second value', pid=>2);

SELECT * FROM tbl;

---存储过程增加了对事务的支持：
CREATE OR REPLACE PROCEDURE proc2()
 LANGUAGE plpgsql
AS $$
BEGIN
 FOR i IN 0..9 LOOP
  INSERT INTO tbl(id, name) VALUES (i, 'value: '|| i);
  IF i % 2 = 0 THEN
   COMMIT;
  ELSE
   ROLLBACK;
  END IF;
 END LOOP;
END;
$$ ;

CALL proc2();

SELECT * FROM tbl;
--只有id 为偶数的记录成功插入表中，奇数都被 ROLLBACK 语句回退了。
------psql 中，使用 \df 命令查看存储过程----------------
----对于存储过程，Type 的值为 proc。使用 \sf 命令可以查看存储过程的定义：
----\sf proc1
drop table tbl;


