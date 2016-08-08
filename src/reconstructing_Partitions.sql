/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Reconstructing Partitions*/
SELECT * 
FROM sys.tables AS t 
JOIN sys.indexes AS i 
    ON t.[object_id] = i.[object_id] 
    AND i.[type] IN (0,1) 
JOIN sys.partition_schemes ps 
    ON i.data_space_id = ps.data_space_id 
WHERE t.name = 'PartitionTable'; 

SELECT t.name AS TableName, i.name AS IndexName, p.partition_number, p.partition_id, i.data_space_id, f.function_id, f.type_desc, r.boundary_id, r.value AS BoundaryValue 
FROM sys.tables AS t
JOIN sys.indexes AS i
    ON t.object_id = i.object_id
JOIN sys.partitions AS p
    ON i.object_id = p.object_id AND i.index_id = p.index_id 
JOIN  sys.partition_schemes AS s 
    ON i.data_space_id = s.data_space_id
JOIN sys.partition_functions AS f 
    ON s.function_id = f.function_id
LEFT JOIN sys.partition_range_values AS r 
    ON f.function_id = r.function_id and r.boundary_id = p.partition_number
WHERE t.name = 'PartitionTable' AND i.type <= 1
ORDER BY p.partition_number;
GO