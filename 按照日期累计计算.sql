create table Activity
(
 player_id character varying(1000),
	device_id character varying(1000),
	event_date date,
	games_played integer
);

insert into Activity values('1','2','2016-03-01',5);
insert into Activity values('1','2','2016-05-02',6);
insert into Activity values('1','3','2017-06-25',1);
insert into Activity values('3','1','2016-03-02',0);
insert into Activity values('3','4','2018-07-03',5);

select * from (
select a.player_id,a.event_date,
	(select sum(b.games_played) from public.activity b
	where b.player_id=a.player_id and b.event_date<=a.event_date)
	from public.activity a
group by a.player_id,a.event_date
) a
order by a.player_id,a.event_date
