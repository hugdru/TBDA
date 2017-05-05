-- View to get the items in which the journalist
-- participated. They might have multiple roles,
-- so we group by the item.id and the journalist.id
CREATE VIEW journalist_participated_item AS
  SELECT
    i.id             AS item_id,
    jr.journalist.id AS journalist_id
  FROM item_table i, TABLE (journalist_role_set) jr
  GROUP BY i.id, jr.journalist.id;

-- View that gets the number of journalists that
-- participated in each news item
CREATE VIEW journalists_per_item AS
  SELECT
    item_id,
    count(*) AS number_of_journalists
  FROM journalist_participated_item
  GROUP BY item_id;