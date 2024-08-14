import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";
const { calculatedAge } = require("../support/dataUtils");
const { timedIdentifier } = require("../support/dataUtils");

beforeEach(function () {
  cy.fixture("inputData").then(function (data) {
    this.data = data;
  });
  const uniSuffix = timedIdentifier();
  Cypress.env("uniSuffix", uniSuffix);
});

Given("I start a new application of medibank life insurance", () => {
  cy.visit(Cypress.env("medibankBaseUrl"), { timeout: 50000 });
});

Given("I start a new application of ahm life insurance", () => {
  cy.visit(Cypress.env("ahmBaseUrl"), { timeout: 50000 });
});

Given(
  "I start a new application of medibank {string} protection",
  (policyName) => {
    cy.visit(Cypress.env("medibankBaseUrl") + `${policyName}`, {
      timeout: 50000,
    });
  }
);

Given("I start a new application of ahm {string} protection", (policyName) => {
  cy.visit(Cypress.env("ahmBaseUrl") + "/" + `${policyName}`, {
    timeout: 50000,
  });
});

When(
  "I provide my basic personal information with age of {string}",
  function (age, dataTable) {
    dataTable.hashes().forEach((element) => {
      const uniFirstName = element.firstName + Cypress.env("uniSuffix");
      cy.fillDataByIdAndVerify(
        "firstName",
        element.firstName === "useInputData"
          ? this.data.firstName
          : uniFirstName
      );
      cy.fillDataByIdAndVerify(
        "lastName",
        element.lastName === "useInputData"
          ? this.data.lastName
          : element.lastName
      );
      cy.fillDataByName(
        "dateOfBirth",
        element.dateOfBirth === "useInputData"
          ? this.data.dateOfBirth
          : calculatedAge(age)
      );
      cy.clickButton(element.gender);
      cy.clickButton(element.smokeStatus);
      cy.selectFromDropdownByLabel("State", element.state);
      cy.fillDataByIdAndVerify(
        "email",
        element.email === "useInputData"
          ? this.data.email
          : uniFirstName + "@szxu2q77.mailosaur.net"
      );
    });
  }
);

Then(
  "I should be able to see total premium is {string}{string} {string}",
  (dollars, cents, frequency) => {
    cy.wait(2000);
    // cy.verifyByTestid("quote-dollars", dollars);
    // cy.verifyByTestid("quote-cents", cents);
    cy.get('[data-testid="quote-dollars"]').contains("$").should("be.visible");
    cy.get('[data-testid="quote-dollars"]').should("not.have.value", "$0");
    cy.get('[data-testid="quote-cents"]').contains(".").should("be.visible");
    cy.verifyByTestid("quote-schedule", frequency);
  }
);

Then(
  "I should be able to see cover amount is {string} for {string} on slider bar",
  (coverAmount) => {
    cy.get('[class="MuiSlider-valueLabelLabel"]')
      // change to a proper test identifier after Harley's PR
      .last()
      .contains(`${coverAmount}`)
      .should("be.visible");
  }
);

When("I click to add {string} cover", () => {
  cy.get('[data-testid="AddCircleOutlineIcon"]').last().click();
  // change to a proper test identifier after Harley's PR
});
