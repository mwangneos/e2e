import { When } from "@badeball/cypress-cucumber-preprocessor";
const { timedIdentifier } = require("../support/dataUtils");
const pasUsername = Cypress.env("PAS_USER_NAME");
const pasPassword = Cypress.env("PAS_PASSWD");

When(
  "I logged into PAS as an admin user and navigate to {string} page to view {string}",
  (pageName, heading) => {
    cy.clearAllLocalStorage();
    cy.clearAllSessionStorage();
    cy.clearCookies();
    cy.visit(Cypress.env("medibankBaseUrl") + `${pageName}`, {
      timeout: 100000,
    });
    cy.fillDataById("username", pasUsername);
    cy.fillDataById("password", pasPassword);
    cy.get('[name="action"]').contains("Continue").click();
    cy.wait(10000);
    cy.get('[class="MuiTypography-root MuiTypography-h4 css-1v0rq27"]')
      .contains(`${heading}`)
      .scrollIntoView()
      .should("be.visible");
  }
);

When("I click targeted policy number", () => {
  cy.clickPolicyNumber();
});

When("I click View Transactions then click the scheduled transaction", () => {
  cy.contains("View Transactions").click();
  cy.get(
    '[class="MuiTypography-root MuiTypography-subtitle2 MuiLink-root MuiLink-underlineNone css-1ije7fa"]'
  ).click({ force: true });
});

When("I navigate to dashboard section", () => {
  cy.clickByTestid("DashboardIcon");
});

When("I change {string} of the insured person", (item) => {
  const changeName = timedIdentifier();
  cy.fillDataById("baseAnswers." + `${item}`, changeName);
  Cypress.env("changeName", changeName);
});

When("I should be able to see the {string} alteration", (changeItem) => {
  cy.get('[class="MuiTypography-root MuiTypography-h4 css-1v0rq27"]')
    .contains("Audit Log")
    .scrollIntoView()
    .should("be.visible");
  cy.contains(Cypress.env(`${changeItem}`)).should("be.visible");
});

When("I select {string} as new assignee", (assignee) => {
  cy.get(
    '[class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary  css-1dakzzh"]'
  )
    .eq(0)
    .click();
  cy.contains(`${assignee}`).click();
  cy.clickButton("Assign Task");
});

When("I select {string} as my decison", (decision) => {
  cy.get(
    '[class="MuiTypography-root MuiTypography-body1 css-1v3tdbc"]'
  ).click();
  cy.contains(`${decision}`).click();
});

When("I make full amount payment via webhook", () => {
  cy.makePaymentViaWebhook();
  cy.wait(36000);
});

When("I click Confirm on the popup dialog", () => {
  cy.clickByTestid("confirmation-popup-Confirm");
});
