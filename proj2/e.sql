-- View to get the items in which the journalist
-- participated. They might have multiple roles,
-- so we group by the item.id and the journalist.id
CREATE VIEW journalist_participated_item AS
  SELECT
    i.id             AS item_id,
    jr.journalist.id AS journalist_id
  FROM item_table i, TABLE (journalist_role_set) jr
  GROUP BY i.id, jr.journalist.id;

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

CREATE VIEW journalists_per_item AS
  SELECT
    item_id,
    count(*) AS number_of_journalists
  FROM journalist_participated_item
  GROUP BY item_id;

-- Number of journalists allotted to each item
SELECT
  i.id,
  i.title,
  jpi.number_of_journalists
FROM item_table i
  INNER JOIN journalists_per_item jpi ON jpi.item_id = i.id
ORDER BY jpi.number_of_journalists DESC;

-- Average journalists alloted to the items
SELECT AVG(jpi.number_of_journalists) AS average_journalists_in_items
FROM journalists_per_item jpi;

-- Number of downloads per item
SELECT
  i.id,
  i.title,
  q.number_of_downloads
FROM item_table i
  INNER JOIN (
               SELECT
                 di.downloaded_item.id AS id,
                 COUNT(*)              AS number_of_downloads
               FROM client_table c, TABLE (c.DOWNLOADED_ITEMS) di
               GROUP BY di.downloaded_item.id
               ORDER BY count(*) DESC
             ) q ON q.id = i.id;
