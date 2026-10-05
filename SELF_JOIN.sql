use self_t388;
select * from self;

select 
E.Emp_id,
E.Emp_name as Employees,
M.Emp_name as Manager
from
self as E
left join
self as M
on
M.Emp_id = E.Manager_id;

-- CROSS JOIN --
select * from Chess_team_A;
select * from Chess_team_B;
select id as A_ID,team_B_ID as B_ID, A.name,B.name
from 
Chess_team_A as A
cross join
Chess_team_B as B;


-- VIEW AND CTE
create view T388_view1 as 
select id,Team_B_ID,A.name as name_a,B.Name as name_B
from 
Chess_team_A as A
cross join
Chess_team_B as B;

select * from t388_view1;

-- CTE comman table experssion --
with T388_CTE as (select id,Team_B_ID,A.name as name_a,B.Name as name_B
from 
Chess_team_A as A
cross join
Chess_team_B as B)
select * from T388_CTE;