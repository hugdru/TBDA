-- Counts the total number of work done by a journalist
-- If a journalist has many roles in a news item they are
-- all counted
SELECT
  j.id,
  j.name,
  j.professional_id,
  q.number_of_tasks
FROM journalist_table j
  INNER JOIN (
               SELECT
                 d.journalist.id AS id,
                 count(*)        AS number_of_tasks
               FROM item_table c, TABLE (journalist_role_set) d
               GROUP BY d.journalist.id
               ORDER BY count(*) DESC) q ON q.id = j.id;