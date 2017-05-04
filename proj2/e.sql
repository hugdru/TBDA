select d.journalist.name, count(c.title)
from item_table c, table(journalist_role_set) d
group by d.journalist.name;