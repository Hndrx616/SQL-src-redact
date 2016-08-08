/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Bipartite Mapping*/
SELECT p.Id, p.Name FROM SQLEntrys AS p
WHERE p IS OF (ONLY SQLEntry) OR p IS OF (ONLY Employee) = SELECT t.Id, t.Name FROM HR AS t