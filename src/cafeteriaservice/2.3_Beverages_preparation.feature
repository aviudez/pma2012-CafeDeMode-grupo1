Feature: Beverages Preparation
  As Cafe deMode owners's
  In order to customers wait the minimum time
  I want to prepare the beverages by priority order

  Background: 
    Given The orders prioritized list is "Peter, Tom"
    And There are no more requests
    
  Scenario: Two orders in wait state
    Given The "Peter" order is in "wait" state
    And The "Tom" order is in "wait" state
    When The owner take next order to prepare the beverage	
    Then The "Peter" order is in "preparation" state
    And the "Tom" order is in "wait" state
    
  Scenario: Two orders one in wait state and the other in preparation
    Given The "Peter" order is in "preparation" state
    And The "Tom" order is in "wait" state
    When The owner take next order to prepare the beverage	
    Then The "Peter" order is in "preparation" state
    And the "Tom" order is in "preparation" state