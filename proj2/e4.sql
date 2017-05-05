-- Average journalists alloted to the items
SELECT AVG(jpi.number_of_journalists) AS average_journalists_in_items
FROM journalists_per_item jpi;