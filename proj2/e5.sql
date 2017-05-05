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