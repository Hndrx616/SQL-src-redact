/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Alter Database & Outer Joints*/
ALTER DATABASE database_name 
{
    <add_or_modify_files>
  | <add_or_modify_filegroups>
}
[;]

<add_or_modify_files>::=
{
    ADD FILE <filespec> [ ,...n ] 
        [ TO FILEGROUP { filegroup_name } ]
  | ADD LOG FILE <filespec> [ ,...n ] 
  | REMOVE FILE logical_file_name 
  | MODIFY FILE <filespec>
  | MODIFY FILE ( NAME = logical_file_name, NEWNAME = new_logical_name )
  | MODIFY FILE ( NAME = logical_file_name, FILENAME = ' new_path/os_file_name ' )
}

<filespec>::= 
(
    NAME = logical_file_name  
    [ , NEWNAME = new_logical_name ] 
    [ , FILENAME = {'os_file_name' | 'filestream_path' | 'memory_optimized_data_path' } ] 
    [ , SIZE = size [ KB | MB | GB | TB ] ] 
    [ , MAXSIZE = { max_size [ KB | MB | GB | TB ] | UNLIMITED } ] 
    [ , FILEGROWTH = growth_increment [ KB | MB | GB | TB| % ] ] 
    [ , OFFLINE ]
) 

<add_or_modify_filegroups>::=
{
    | ADD FILEGROUP filegroup_name 
        [ CONTAINS FILESTREAM | CONTAINS MEMORY_OPTIMIZED_DATA ]
    | REMOVE FILEGROUP filegroup_name 
    | MODIFY FILEGROUP filegroup_name
        { <filegroup_updatability_option>
        | DEFAULT
        | NAME = new_filegroup_name 
        | { AUTOGROW_SINGLE_FILE | AUTOGROW_ALL_FILES }
        }
}
<filegroup_updatability_option>::=
{
    { READONLY | READWRITE } 
    | { READ_ONLY | READ_WRITE }
}
ALTER DATABASE xtp_db ADD FILEGROUP xtp_fg CONTAINS MEMORY_OPTIMIZED_DATA;
GO
ALTER DATABASE xtp_db ADD FILE (NAME='xtp_mod', FILENAME='d:\data\xtp_mod') TO FILEGROUP xtp_fg;