import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given("I am on medibank {string} home page", (policyName) => {
  cy.visit(Cypress.env("medibankUrl") + `${policyName}`, {
    timeout: 50000,
  });
});

Given("I am on ahm {string} home page", (policyName) => {
  cy.visit(Cypress.env("ahmUrl") + `${policyName}`, {
    timeout: 50000,
  });
});

When("I click {string}", (value) => {
  cy.get('[class="countdown-banner-actions"]')
    .contains(value)
    .click({ force: true });
});

Then(
  "I should be able to click and redirect to get a quick quote for {string}",
  (policyName) => {
    const ctaLink = Cypress.env("ahmBaseUrl") + `${policyName}`;
    cy.get("a").eq(30).should("have.attr", "href", ctaLink);
  }
);
