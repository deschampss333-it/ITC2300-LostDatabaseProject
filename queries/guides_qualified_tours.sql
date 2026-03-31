CREATE VIEW `view4` AS
SELECT g.guideID, g.lastName, g.firstName, COUNT(qg.Tours_tourID) AS qualifiedTours
FROM Guides g
LEFT JOIN QualifiedGuides qg ON qg.Guides_guideID = g.guideID
GROUP BY g.guideID, g.lastName, g.firstName
ORDER BY qualifiedTours DESC, g.lastName, g.firstName;
/*Number of tours guides are qualified for */