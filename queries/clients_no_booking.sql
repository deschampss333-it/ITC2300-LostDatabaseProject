CREATE VIEW `view5` AS
SELECT c.clientID, c.lastName, c.firstName
FROM Clients c
LEFT JOIN OutingsClients oc ON oc.Client_clientID = c.clientID
WHERE oc.Client_clientID IS NULL
ORDER BY c.lastName, c.firstName;

/* Clients who have not booked anything */