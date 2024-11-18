use pqr;

show tables;

select * from sql_skysports_project16875987300;
select * from sql_skysports_project16875987301;

create table skysports1 select * from sql_skysports_project16875987300;

select * from skysports1;

create table skysports2 select * from sql_skysports_project16875987301;

select * from skysports2;

-- 2
select ss1.team, ss2.team
from 
skysports1 ss1
left outer join
skysports2 ss2 on ss1.team = ss2.team
union
select ss1.team, ss2.team
from
skysports1 ss1
right outer join
skysports2 ss2 on ss1.team = ss2.team;

-- 3
select team from skysports1 where `rank`=1 and `group`=7;

-- 4
select team, count(*) as t1 
from skysports1
group by team;

-- 5
select ss1.team, count(ss1.team) 
from skysports1 ss1 left join skysports2 ss2 
on ss1.team = ss2.team
group by ss1.team 
union
select ss1.team, count(ss1.team)
from skysports1 ss1 right join skysports2 ss2 
on ss1.team = ss2.team
group by ss1.team;

-- 6
select team,
  round(wins / matches_played * 100, 2) as wins_percent
from skysports1
group by team;

-- 7
select team,
  max(goals) as 'Max Goals',
  count(*) as 'Count Max Goals'
from skysports2
group by team
having max(goals) = (
    select max(goals)
    from skysports2
);

-- 8
select team, round(draws / matches_played * 100, 2) as percent_draws
from skysports1;

-- 9
select team,
  min(goals) as 'Min Goals',
  count(*) as 'Count Min Golas'
from skysports2
group by team
having min(goals) = (
    select min(goals)
    from skysports2
);

-- 10
select team,
round(losses * 100, 2) as losses_percent
from skysports2
group by team
order by losses;

-- 11
select avg(goal_difference) from skysports1;

-- 12
select team from skysports1 
where Points = '0';

-- 13
select count(*) from skysports1 
where 'expected_goal_scored' <= 'expected_goal_conceded';

-- 14
select * from skysports1
where goal_difference between -0.5 and 0.5;

-- 15
select * from skysports1
order by exp_goal_difference_per_90 asc;

-- 16
select team, max(players_used) as 'Max Players Used' 
from skysports2
group by team;

select * from skysports1 s;
select * from skysports2 s;

-- 17
select team, avg_age
from skysports2
order by avg_age asc;

-- 18
select team, avg(possession) as 'Avg Possession'
from skysports2 s
group by team;

-- 19
select team, min(games) as 'Min Game'
from skysports2
group by team
having min(games) >= 5; 

-- 20
select * from skysports2
where minutes > 600;

-- 21
select team, goals , assists from skysports2
order by goals asc;

-- 22
select team, pens_made, pens_att from skysports2
order by pens_att desc;

-- 23
select team, cards_yellow, cards_red from skysports2
where cards_red = 1
order by cards_yellow asc;

-- 24
select team, goals_per90, assists_per90, goals_assists_per90 from skysports2
order by goals_assists_per90 desc;

-- 25
select team, goals_pens_per90, goals_assists_pens_per90 from skysports2
order by goals_assists_pens_per90 asc;

-- 26
select team, shots, shots_on_target, shots_on_target_pct from skysports2
where shots_on_target_pct < 30
order by shots_on_target_pct asc;

-- 27
select team, shots_per90, shots_on_target_per90 from skysports2
where team = 'Belgium';

-- 28
select team, goals_per_shot, goals_per_shot_on_target, average_shot_distance from skysports2
order by average_shot_distance desc;

-- 29
select team, errors, touches from skysports2
where errors = 0 and touches <= 1500;

-- 30
select team, max(fouls) from skysports2
group by team;

-- 31
select team, offsides  from skysports2
where offsides < 10 or offsides > 20;

-- 32
select team, aerials_won, aerials_lost, aerials_won_pct from skysports2
order by aerials_won_pct desc;

-- 33
select "group", count(distinct team) as num_teams
from skysports1
group by `group`;

-- 34
select team from skysports1
where `group` = '6';

-- 35
select team, `group` 
from skysports1
where team = 'Australia';

select * from sky

-- 36
select 'group', avg(wins) as 'Avg Wins'
from skysports1
group by `group`;

select * from skysports2;

-- 37
select 'group', max(expected_goal_scored) as 'Max Goal Scored'
from skysports1
group by 'group'
order by max(expected_goal_scored) asc;

-- 38
select 'group', min(exp_goal_conceded) as 'Exp Goal Conceded'
from skysports1
group by `group`
order by min(exp_goal_conceded);

-- 39
select 'group', avg(exp_goal_difference_per_90) as 'Exp Goal Diff per 90'
from skysports1
group by `group`
order by avg(exp_goal_difference_per_90);

-- 40
select team from skysports1
where goals_scored = goals_against;

-- 41
select team, max(players_used) as 'Players Used'
from skysports2
group by team;

-- 42
select team, players_used, avg_age, games, minutes from skysports2
where minutes < 500 and minutes > 200;

-- 43
select * from skysports1 order by points;

-- 44
select distinct team from skysports1
order by team;

-- 45
select ss1.`group`, avg(avg_age) as 'Avg Age' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by 'Avg Age' desc;

-- 46
select ss1.`group`, sum(ss2.fouls) as Fouls
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by Fouls asc;

-- 47(Incorrect)
select ss1.`group`, count(ss2.games) as 'Total Game' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by Total Games desc;


-- 48
select ss1.`group`, count(players_used) as 'Players' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by 'Players' desc;

-- 49
select ss1.`group`, count(offsides) as 'OFFSIDES' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by 'OFFSIDES';

-- 50
select ss1.`group`, avg(passes_pct) as 'Passes Pct' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by 'Passes Pct' desc;

-- 51
select ss1.`group`, avg(goals_per90) as 'Goals per 90' 
from skysports1 ss1
join skysports2 ss2
on ss1.team = ss2.team
group by ss1.`group`
order by 'Goals per 90' asc;






















