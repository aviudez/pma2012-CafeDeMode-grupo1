Feature: Orders Delivery
  As Cafe deMode owners's
  In order to customers satisfaction
  I want that my customers can pick up the orders without problems

  Background: 
    Given The orders prioritized list is "Tom, Peter"
    And There are no more requests
    And "Peter" is in the shop to pick up the order 
    
  Scenario: Pick up an order
    Given "Peter" have a ticked number
    When "Peter" asks to shopkeeper to deliver the order
    Then The shopkeeper deliver the beverage to "Peter" 
    And The "Peter" order is in state "picked up"
    And The orders list is "Tom"
    And In the after-sales lists appears a new order from "Peter"
    
  Scenario: Pick up an order without the ticket number
    Given "Peter" don't have the ticket number
    When "Peter" asks to shopkeeper to deliver the order
    Then The shopkeeper alerts "Peter" that "you can not pick up the order without ticket number"
    And The orders list is "Tom, Peter"
    And In the after-sales lists don't appears the "Peter" order