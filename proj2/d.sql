SELECT value(q).title AS image_title
FROM TABLE (
     SELECT di.downloaded_item.images AS images
     FROM client_table c, TABLE (c.DOWNLOADED_ITEMS) di
     WHERE c.username = 'lugubrious46' AND
           di.downloaded_item.published_date = TO_TIMESTAMP('2017-05-01 23:55:00', 'YYYY-MM-DD HH24:MI:SS')) q;
--      WHERE c.username = 'lugubrious46' AND
--            di.download_date = TO_TIMESTAMP('2017-05-03 10:35:00', 'YYYY-MM-DD HH24:MI:SS')) q;