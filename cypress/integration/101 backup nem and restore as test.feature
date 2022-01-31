Feature: Backup nem db on pybase and restore as test

  the nem py database is now so large (> 15GB as at Dec 2021) that it cannot 
  be backed up and restored as a test db in a timely db.
  So build "from scratch" and load daily data as necessary for tests

  BE VERY CAREFUL-- THIS LOGS IN TO THE *** nem *** DATBASE TO START TO GET THE LATEST SCHEMA
  AND CRITICAL SYSTEM TABLES AND RESTORES INTO THE TEST DATABASE. IF THIS GOES WRONG YOU COULD OVERWRITE THE NEM DB !!

  Scenario: Build test db from current prod db
    # ***** login to "nem" as can be locked out of "test" -- CAREFUL!!!
    Given I login to "nem" on pybase
    And   go to "Database"
    # backup modifies definer user to pybaseco_nem so views will be restored
    And   Backup the "nem" db schema copy
    And   Backup the "nem" db schema
    And   Restore to the test db
    And   Backup the "nem" db tables "py_named_values py_roles py_users py_views py_actions STATIONS MARKET events"
    And   Restore to the test db
    And   I logout

  Scenario: Perform a basic check we have restored system data
    Given I login to "test" on pybase
    And   go to "Database"
    #And   run query "select..." 
    And   I logout
  