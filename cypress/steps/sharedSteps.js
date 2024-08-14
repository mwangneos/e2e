import { When, Then } from "@badeball/cypress-cucumber-preprocessor";

When("I click {string} to {string}", (value) => {
  cy.clickButton(value);
});

When(
  "I tick the checkbox to {string} then click {string}",
  (purpose, value) => {
    cy.get('[type="checkbox"]').check();
    cy.clickButton(value);
  }
);

Then("I should be able to see {string}", (message) => {
  cy.contains(`${message}`).should("be.visible");
});
