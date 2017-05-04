--------------------- d)
SELECT value(p).title
FROM table(SELECT v.downloaded_item.images
           FROM table(select c.downloaded_items from client_table c where c.username='lugubrious46') v
           WHERE v.download_date='17.05.03 10:35:00') p;
