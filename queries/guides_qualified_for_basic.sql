CREATE VIEW `view3` AS
SELECT t.tourName, g.guideID, g.lastName, g.firstName, qg.qualifiedDate
FROM Tours t
JOIN QualifiedGuides qg ON qg.Tours_tourID = t.tourID
JOIN Guides g ON g.guideID = qg.Guides_guideID
WHERE t.tourName = 'Basic'
ORDER BY qg.qualifiedDate DESC, g.lastName;

/* Guides qualified for basic */