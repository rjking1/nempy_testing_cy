Feature: Tasmania gas test

# reload a day into test db that was loaded by the importer into prod and check we get same results which have been saved from prod
# must cover period of 01:45 to 01:40 as nem has all data; test will only have what we load here

  Scenario: Tasmania gas running
    Given I login to "test" on pybase
    And   go to "Database"
    And   Load historical data for "2021 09 22 01 00 23 02 00 load pybaseco_test"
    And wait 10000 ms
    # added wait above as maybe Loaded is not really loaded when we have a whole day to load ???    
    # create event -- then won't need to load events above

@focus
  Scenario: check tabular data
    Given I login to "test" on pybase
    And go to ". Events"
    And I filter on "Tasmania gas running"
    And I open the event
    And save table "#t1" to file "tas_prices.csv"
    And It should match the expected "tas_prices" csv file
    And save table "#t2" to file "tas_interconnectors.csv"
    And It should match the expected "tas_interconnectors" csv file

@focus
  Scenario: check ft chart 1
    Given I login to "test" on pybase
    And go to ". Events"
    And I filter on "Tasmania gas running"
    And I open the event
    And wait 2000 ms
    And save chart "#c1" to file "tas_ft_chart"
    And the saved chart should match the expected "tas_ft_chart" csv file
@focus
  Scenario: check ft chart 2
    And save chart "#c4" to file "tas_ft_diff_chart"
    And the saved chart should match the expected "tas_ft_diff_chart" csv file

  # -12 to 12 hours

@focus
  Scenario: save qld chart
    Given I login to "test" on pybase
    And go to ". Events"
    And I filter on "Tasmania gas running"
    And I open the event
    And go to "-12 to +12 hours"
    And save chart "#c2-0" to file "qld_price_demand_tas"
    And the saved chart should match the expected "qld_price_demand_tas" csv file
@focus
  Scenario: save tas chart
    And save chart "#c2-4" to file "tas_price_demand_tas"
    And the saved chart should match the expected "tas_price_demand_tas" csv file
@focus
  Scenario: save qld gen
    And save chart "#c3-0" to file "qld_gen_tas"
    And the saved chart should match the expected "qld_gen_tas" csv file
@focus
  Scenario: save tas gen
    And save chart "#c3-4" to file "tas_gen_tas"
    And the saved chart should match the expected "tas_gen_tas" csv file
