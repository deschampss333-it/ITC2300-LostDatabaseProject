SELECT o.outingID,
       o.outingDateTime,
       t.tourName,
       CONCAT(g.firstName, ' ', g.lastName) AS guideName
FROM Outings o
JOIN Tours t  ON t.tourID = o.Tours_tourID
JOIN Guides g ON g.guideID = o.Guides_guideID
WHERE o.outingDateTime > '2009-09-01'
ORDER BY o.outingDateTime;
/* List of the outings scheduled after September with tour name and guide */