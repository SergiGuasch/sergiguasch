select d.A2 as district, sum(amount) as loans, avg(l.amount) as avgloan,
count(l.loan_id) as noloans
from bank.loan as l
join account a
using(account_id)
join district as d 
on a.district_id = d.A1
group by d.A2;

# 3.06 Activity 2
# Use Python to launch a query to obtain a dataframe with how many loans of each status were granted every year.

select year(date) as Year, status, count(loan_id) as Loans 
from bank.loan
group by Year, status
order by Year, status;