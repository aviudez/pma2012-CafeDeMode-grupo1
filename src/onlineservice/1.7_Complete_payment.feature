Feature: Complete payment
  As a "Cafe deMode" owner
  In order to keep my business from failing and not being fooled
  I want to be able to charge my customers in advance

  # Validate payment data here, like in 1.6?
  Background: 
    Given order is not empty
    And payment data is correct

  Scenario: payment is correct and client has email configured
    When payment is correctly completed
    Then a ticket will be generated
    And the order will be queued to the cofee shop
    And the customer will be able to see the ticket
    And the option to make a new order is shown
    And the customer receives an email with his ticket

  Scenario: payment is correct but client does not has email configured
    When payment is correctly completed
    Then a ticket will be generated
    And the order is queued to the cofee shop
    And the customer will be able to see the ticket
    And the option to make a new order is shown
    But the customer does not receive an email with his ticket (???)

  Scenario: payment failed
    When payment is not correctly completed
    Then user will be notified that payment has failed
    And user will be able to return to her current order
