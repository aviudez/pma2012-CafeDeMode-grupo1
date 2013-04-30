Feature: Selecting beverages
  As a customer
  In order to have a good time
  I want to be able to choose beverages I want

  Background: 
    Given that the working hours is from "9:00am" to "6:00pm" from "Monday" to "Friday"
    And that the default set of beverages is available
    And that it is "11/02/2013" "10:00am"
    And the customer is watching the list of beverages

  Scenario: Add a beverage to an empty order
    Given the customer''s order is empty
    And she selects a "ristretto" from the list of beverages
    When she adds the "ristretto" to the order
    Then the customer''s order contains only "ristretto"
    And she will be able to pay

  Scenario: Add a beverage to an existing order
    Given the customer''s order contains "capuccino"
    And she selects a "ristretto" from the list of beverages
    When she adds the "ristretto" to the order
    Then the customer''s order contains only "ristretto" and "capuccino"
    And she will be able to pay

  Scenario: Delete a beverage from order
    Given the customer''s order contains "ristretto"
    And the customer''s order contains "capuccino"
    And she selects the "ristretto" from the order
    When she deletes "ristretto" from the order
    Then the customer''s order contains "capuccino"
    But the customer''s order does not contain "ristretto"
    And she will be able to pay

  Scenario: Delete the last beverage from order
    Given the customer''s order contains only "ristretto"
    And she selects the "ristretto" from the order
    When she deletes "ristretto" from the order
    Then the customer''s order is empty
    And she will not be able to pay

  Scenario: Delete all beverages from order
    Given the customer''s order contains "ristretto"
    And the customer''s order contains "capuccino"
    When she deletes all orders
    Then the customer''s order is empty
    And she will not be able to pay

  Scenario Outline: Add more than one beverage of one kind
    Given the customer''s order contains "ristretto" with quantity "<current>"
    And she selects the "ristretto" from the order
    When she modifies the quantity of "ristretto" to "<requested>"
    Then the customer''s order contains "ristretto" with quantity "<final>"
    And she will be able to pay

    Examples: 
      | current | requested | final |
      | 1       | 3         | 3     |
      | 2       | 1         | 1     |
      | 2       | 0         | 2     |