CREATE VIEW `view2` AS
SELECT o.outingID, o.outingDateTime, t.tourName,
       COUNT(oc.Client_clientID) AS clientCount
FROM Outings o
JOIN Tours t ON t.tourID = o.Tours_tourID
LEFT JOIN OutingsClients oc ON oc.Outing_outingID = o.outingID
GROUP BY o.outingID, o.outingDateTime, t.tourName
ORDER BY clientCount DESC, o.outingDateTime;
/*Number of clients scheduled to go on individual outings */