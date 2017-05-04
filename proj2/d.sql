-- d)
SELECT value(p).title
FROM TABLE (SELECT v.downloaded_item.images
            FROM TABLE (SELECT c.downloaded_items
                        FROM client_table c
                        WHERE c.username = 'lugubrious46') v
            WHERE v.download_date = TO_TIMESTAMP('17.05.03 10:35:00', 'YYYY-MM-DD HH24:MI:SS')) p;
