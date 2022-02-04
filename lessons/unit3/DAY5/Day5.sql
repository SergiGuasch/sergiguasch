#CASE SCENARIO 

CREATE or REPLACE VIEW bad_clients as 
SELECT l.status, date_format(convert(a.date, date),'%M,%Y') as M_Y,
count(distinct account_id) as noofaccounts, 
count(distinct d.client_id) as noofclients,
ceiling(sum(t.amount)) as moved_amount,
count(distinct t.trans_id) as nooftrans
from trans t 
join account a 
using(account_id)
join disp d
using(account_id)
join loan l
using(account_id)
where d.type = 'OWNER'
and l.status in ('B','D')
group by
date_format(convert(a.date, date),'%M,%Y'),
l.status
order by l.status asc;

select * from bad_clients;

SELECT l.status, date_format(convert(t.date, date),'%M,%Y') as M_Y,
count(distinct account_id) as noofaccounts, 
count(distinct d.client_id) as noofclients,
ceiling(sum(t.amount)) as moved_amount,
count(distinct t.trans_id) as nooftrans
from trans t 
join account a 
using(account_id)
join disp d
using(account_id)
join loan l
using(account_id)
where d.type = 'OWNER'
group by
date_format(convert(t.date, date),'%M,%Y'),
l.status
order by l.status asc;