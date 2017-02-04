select aname from author natural join writes natural join book group by aname having count(distinct title)>1;

select title from book natural join writes natural join author group by title having count(distinct aname)=1;

select aname from author natural join writes natural join book group by aname having max(count(distinct title));

select pname from publisher natural join book group by category having max(count(category));
