-- Number of journalists allotted to each item
SELECT
  i.id,
  i.title,
  jpi.number_of_journalists
FROM item_table i
  INNER JOIN journalists_per_item jpi ON jpi.item_id = i.id
ORDER BY jpi.number_of_journalists DESC;