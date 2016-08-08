/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Mapping Compilation*/
/* Bidirectional views compiled from mapping*/
SQLEntrys =
SELECT
CASE WHEN T2.from2
THEN checkSQL(T1.Id, T1.Name, T2.AddSQL)
ELSE SQLEntry(T1.Id, T1.Name) END
FROM checkMatch AS T1
LEFT OUTER JOIN (
SELECT Id, Score AS AddSQL,
True AS from2
FROM SQLInput) AS T2
ON T1.Id = T2.Id
checkMatch = SELECT p.Id, p.Name
FROM SQLEntrys p
SQLInput = SELECT c.Id, c.AddSQL
FROM SQLEntrys c
WHERE c IS OF checkSQL