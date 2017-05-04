-- d)
SELECT value(p).title as image_title
FROM TABLE (SELECT v.downloaded_item.images
            FROM TABLE (SELECT c.downloaded_items
                        FROM client_table c
                        WHERE c.username = 'lugubrious46') v
            WHERE v.downloaded_item.published_date = TO_TIMESTAMP('2017-05-01 23:55:00', 'YYYY-MM-DD HH24:MI:SS')) p;
--             WHERE v.download_date = TO_TIMESTAMP('2017-05-03 10:35:00', 'YYYY-MM-DD HH24:MI:SS')) p;

