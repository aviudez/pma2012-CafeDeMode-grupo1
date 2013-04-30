Feature: Insert contract data
  As a customer
  In order to not formet my ticket number
  I want to receive it in my email

  Background: 
    Given that the order is not empty

  Scenario: The user introduces her email
    Given that the user does not have completed her order
    When the user introduces her email
    Then the user will be able to complete her order
    And the user will be able to receive tickets by email
