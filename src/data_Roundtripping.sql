/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Data Roundtripping*/
/*View maintenance:*/
Tables = SELECT UpdateViews FROM (Entities, Entities)
/*View unfolding:*/
Tables = SELECT UpdateViews FROM (QueryViews(Tables), Entities)