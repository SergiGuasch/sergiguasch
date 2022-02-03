SELECT au_lname, au_fname, title, type FROM pubs.authors
join titleauthor
using(au_id)
join titles
using(title_id)
;


# through the join with a bridge table you have to do the same kind of join
SELECT au_lname, au_fname, title, type FROM pubs.authors
left join titleauthor
using(au_id)
left join titles
using(title_id)
;

SELECT au_lname, au_fname, title, type FROM pubs.authors
right join titleauthor
using(au_id)
right join titles
using(title_id)
;