/**
 * @author Stephen Hilliard (c) 2015.
 * @developer Stephen Hilliard (c) 2015.
 */
/*Alter Database Whole*/
ALTER DATABASE { database_name  | CURRENT }
SET 
{
    <optionspec> [ ,... n ] [ WITH <termination> ] 
}
<set_database_options>::=
{
  <optionspec> ::= 
{
    <auto_option> 
  | <change_tracking_option> 
  | <containment_option> 
  | <cursor_option> 
  | <database_mirroring_option>
  | <date_correlation_optimization_option>
  | <db_encryption_option>
  | <db_state_option>
  | <db_update_option> 
  | <db_user_access_option> 
  | <delayed_durability_option>
  | <external_access_option>
  | FILESTREAM ( <FILESTREAM_option> )
  | <HADR_options>
  | <mixed_page_allocation_option>
  | <parameterization_option>
  | <query_store_options>
  | <recovery_option>
  | <remote_data_archive_option>
  | <service_broker_option>
  | <snapshot_option>
  | <sql_option> 
  | <target_recovery_time_option> 
  | <termination>
}

<auto_option> ::= 
{
    AUTO_CLOSE { ON | OFF } 
  | AUTO_CREATE_STATISTICS { OFF | ON [ ( INCREMENTAL = { ON | OFF } ) ] } 
  | AUTO_SHRINK { ON | OFF } 
  | AUTO_UPDATE_STATISTICS { ON | OFF } 
  | AUTO_UPDATE_STATISTICS_ASYNC { ON | OFF }
}

<change_tracking_option> ::=
{
  CHANGE_TRACKING 
   { 
       = OFF
     | = ON [ ( <change_tracking_option_list > [,... n] ) ] 
     | ( <change_tracking_option_list> [,... n ] )
   }
}

   <change_tracking_option_list> ::=
   {
       AUTO_CLEANUP = { ON | OFF } 
     | CHANGE_RETENTION = retention_period { DAYS | HOURS | MINUTES }
   }

<containment_option> ::= 
   CONTAINMENT = { NONE | PARTIAL }

<cursor_option> ::= 
{
    CURSOR_CLOSE_ON_COMMIT { ON | OFF } 
  | CURSOR_DEFAULT { LOCAL | GLOBAL } 
}

<database_mirroring_option>
  ALTER DATABASE Database Mirroring

<date_correlation_optimization_option> ::=
    DATE_CORRELATION_OPTIMIZATION { ON | OFF }

<db_encryption_option> ::=
    ENCRYPTION { ON | OFF }

<db_state_option> ::=
    { ONLINE | OFFLINE | EMERGENCY }

<db_update_option> ::=
    { READ_ONLY | READ_WRITE }

<db_user_access_option> ::=
    { SINGLE_USER | RESTRICTED_USER | MULTI_USER }

<delayed_durability_option> ::=    DELAYED_DURABILITY = { DISABLED | ALLOWED | FORCED }

<external_access_option> ::=
{
    DB_CHAINING { ON | OFF }
  | TRUSTWORTHY { ON | OFF }
  | DEFAULT_FULLTEXT_LANGUAGE = { <lcid> | <language name> | <language alias> }
  | DEFAULT_LANGUAGE = { <lcid> | <language name> | <language alias> }
  | NESTED_TRIGGERS = { OFF | ON }
  | TRANSFORM_NOISE_WORDS = { OFF | ON }
  | TWO_DIGIT_YEAR_CUTOFF = { 1753, ..., 2049, ..., 9999 }
}
<FILESTREAM_option> ::=
{
    NON_TRANSACTED_ACCESS = { OFF | READ_ONLY | FULL 
  | DIRECTORY_NAME = <directory_name>
}
<HADR_options> ::=
    ALTER DATABASE SET HADR

<mixed_page_allocation_option> ::=
    MIXED_PAGE_ALLOCATION { OFF | ON }

<parameterization_option> ::=
    PARAMETERIZATION { SIMPLE | FORCED }

<query_store_options> ::=
{
    QUERY_STORE 
    {
          = OFF 
        | = ON [ ( <query_store_option_list> [,... n] ) ]
        | ( < query_store_option_list> [,... n] )
        | CLEAR [ ALL ]
    }
} 

<query_store_option_list> ::=
{
      OPERATION_MODE = { READ_WRITE | READ_ONLY } 
    | CLEANUP_POLICY = ( STALE_QUERY_THRESHOLD_DAYS = number )
    | DATA_FLUSH_INTERVAL_SECONDS = number 
    | MAX_STORAGE_SIZE_MB = number 
    | INTERVAL_LENGTH_MINUTES = number 
    | SIZE_BASED_CLEANUP_MODE = [ AUTO | OFF ]
    | QUERY_CAPTURE_MODE = [ ALL | AUTO | NONE ]
    | MAX_PLANS_PER_QUERY = number
}

<recovery_option> ::= 
{
    RECOVERY { FULL | BULK_LOGGED | SIMPLE } 
  | TORN_PAGE_DETECTION { ON | OFF }
  | PAGE_VERIFY { CHECKSUM | TORN_PAGE_DETECTION | NONE }
}

<target_recovery_time_option> ::=
    TARGET_RECOVERY_TIME = target_recovery_time { SECONDS | MINUTES }

<remote_data_archive_option> ::=
{
    REMOTE_DATA_ARCHIVE =
    {
        ON ( SERVER = <server_name> , 
                  {   CREDENTIAL = <db_scoped_credential_name>
                     | FEDERATED_SERVICE_ACCOUNT =  ON | OFF 
                  }
               )
      | OFF
    }
}

<service_broker_option> ::=
{
    ENABLE_BROKER
  | DISABLE_BROKER
  | NEW_BROKER
  | ERROR_BROKER_CONVERSATIONS
  | HONOR_BROKER_PRIORITY { ON | OFF}
}

<snapshot_option> ::=
{
    ALLOW_SNAPSHOT_ISOLATION { ON | OFF }
  | READ_COMMITTED_SNAPSHOT {ON | OFF }
  | MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT {ON | OFF }
}
<sql_option> ::= 
{
    ANSI_NULL_DEFAULT { ON | OFF } 
  | ANSI_NULLS { ON | OFF } 
  | ANSI_PADDING { ON | OFF } 
  | ANSI_WARNINGS { ON | OFF } 
  | ARITHABORT { ON | OFF } 
  | COMPATIBILITY_LEVEL = { 90 | 100 | 110 | 120}
  | CONCAT_NULL_YIELDS_NULL { ON | OFF } 
  | NUMERIC_ROUNDABORT { ON | OFF } 
  | QUOTED_IDENTIFIER { ON | OFF } 
  | RECURSIVE_TRIGGERS { ON | OFF } 
}

<termination>  ::= 
{
    ROLLBACK AFTER integer [ SECONDS ] 
  | ROLLBACK IMMEDIATE 
  | NO_WAIT
}

ALTER DATABASE xtp_db ADD FILEGROUP xtp_fg CONTAINS MEMORY_OPTIMIZED_DATA;
GO
ALTER DATABASE xtp_db ADD FILE (NAME='xtp_mod', FILENAME='d:\data\xtp_mod') TO FILEGROUP xtp_fg;