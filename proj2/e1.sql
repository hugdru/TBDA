-- Number of journalist participations
-- Different roles in the same item count
-- as one participation
SELECT
  j.id,
  j.name,
  j.professional_id,
  c.number_of_participations
FROM journalist_table j
  INNER JOIN (
               SELECT
                 journalist_id,
                 count(*) AS number_of_participations
               FROM journalist_participated_item
               GROUP BY journalist_id
               ORDER BY count(*) DESC
             ) c ON c.journalist_id = j.id;