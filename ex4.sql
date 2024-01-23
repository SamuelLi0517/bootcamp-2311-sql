show databases;

 create database ORG;

use ORG;

 create table players (
player_id integer not null unique, 
group_id integer not null
 );

create table matches (
match_id integer not null unique, 
first_player integer not null,
second_player integer not null,
first_score integer not null, 
second_score integer not null
);

select * from players;
insert into players(player_id, group_id) values
(20, 2),
(30, 1),
(40, 3),
(45, 1),
(50, 2),
(65, 1);

select * from matches;
insert into matches(match_id, first_player, second_player, first_score, second_score) values
(1, 30, 45, 10, 12),
(2, 20 ,50, 5, 5),
(13, 65, 45, 10, 10),
(5, 30, 65, 3, 15),
(42, 45, 65, 8, 4);


    
-- 
with result_table as(
	with score_per_player as ( -- start -> count total score per player_id
		select  m1.first_player as player_Id ,m1.first_score as player_Score
		from matches m1
		union 
		select  m2.second_player,m2.second_score
		from matches m2  
		order by player_Id
	)
	select  p.group_id,p.player_Id , ifnull(sum(player_Score),0) as total_score 
	from players p 
	left join score_per_player spp on p.player_id = spp.player_Id
	group by player_Id
	order by total_score desc 
)  -- end count score 
select outter.group_id as group_id , outter.player_id as winner_id
from (
	select row_number() over (PARTITION by result_table.group_id order by total_score desc) as answer , result_table.*
	from result_table 
    ) as outter
where answer =1 
;