/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Merge views*/
SQLInput(Id, Score, Date):
SQLInputnew = SELECT upd.Id, upd.Score, old.Date
FROM SQLInput AS upd
LEFT OUTER JOIN SQLInputold AS old
ON upd.Id = old.Id
'CASE WHEN Rold.ID IS NOT NULL THEN Rold.C ELSE 3 END'