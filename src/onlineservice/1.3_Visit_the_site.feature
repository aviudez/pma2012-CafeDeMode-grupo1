Feature: Visiting the site
  As a customer
  In order to avoid queues
  I want to be able to use the "Cafe deMode" site

  Background: 
    Given that the working hours is from "9:00am" to "6:00pm" from "Monday" to "Friday"
    And that the default set of beverages is available

  Scenario: It is open
    Given that it is "11/02/2013" "9:00am"
    When a customer visits the order page
    Then She will see the default set of beverages
    And her order will be empty
    And she will be able to order any of them
    But she will not be able to pay

  Scenario: It is closed
    Given that it is "16/03/2013" "6:00pm"
    When a customer visits the order page
    Then she will see the default set of beverages
    And her order will be empty
    But she will not be able to order any of them
    But she will not be able to pay
