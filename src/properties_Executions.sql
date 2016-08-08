/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Properties and Executions*/
Entities = SELECT QueryViews FROM Tables
Tables = SELECT UpdateViews FROM Entities
Entities = SELECT QueryViews FROM UpdateViews
WHERE Entities IS of Tables