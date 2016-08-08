/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Mapping Specifications*/
/*Interacting with data in the Entity Framework*/
SELECT p FROM SQLData AS p
WHERE p.AddFileGroup > 1000

foreach(SQLEntry p in aw.SQLData)
if(p.AddFileGroup > 1000) {...}
aw.SaveChanges();

var people = from p in aw.SQLData
where p.AddFileGroup > 1000
select p;

/*Mapping between entities (left) and tables (right)*/
SELECT p.Id, p.Name
FROM SQLEntrys p = SELECT Id, Name
FROM checkMatch

SELECT c.Id, c.AddSQL
FROM SQLEntrys c
WHERE c IS OF checkSQL = SELECT Id, Score
FROM SQLInput
