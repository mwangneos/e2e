import { Given, When } from "@badeball/cypress-cucumber-preprocessor";
const spAdviserUsername = Cypress.env("SP_ADVISER_USER_NAME");
const spAdvisersPassword = Cypress.env("SP_ADVISER_PASSWD");
const spOpsUsername = Cypress.env("SP_OPS_USER_NAME");
const spOpsPassword = Cypress.env("SP_OPS_PASSWD");
const { timedIdentifier } = require("../support/dataUtils");

Given("I logged into service portal as {string} user", (role) => {
  cy.clearAllLocalStorage();
  cy.clearAllSessionStorage();
  cy.clearCookies();
  cy.visit(Cypress.env("servicePortalBaseUrl"), { timeout: 50000 });
  const user = role;
  if (user == "adviser") {
    cy.fillDataById("username", spAdviserUsername);
    cy.fillDataById("password", spAdvisersPassword);
  }
  if (user == "ops") {
    cy.fillDataById("username", spOpsUsername);
    cy.fillDataById("password", spOpsPassword);
  }
  cy.get('[name="action"]').contains("Continue").click();
});

When(
  "I navigate to {string} page via {string} of client {string}",
  (pageName, menuName, client) => {
    cy.get(
      '[class="MuiTypography-root MuiTypography-body2 MuiListItemText-primary css-12rlkus"]'
    )
      .contains(menuName)
      .click();
    cy.selectButton(client, "Go to");
    cy.get('[class="MuiList-root MuiList-padding MuiMenu-list css-r8u8y9"]')
      .contains(pageName)
      .click();
    cy.wait(3000);
  }
);

When("I click to add a new quote for client {string}", (client) => {
  cy.get('button[aria-label="New quote"]').then(($input) => {
    if ($input.is(":disabled")) {
      if (client == 1) {
        cy.then(() => cy.state("test").skip());
      } else {
        cy.fixTestDataForSP();
      }
    } else {
      cy.get('button[aria-label="New quote"]').click();
    }
  });
});

When("I click update to popup the details", () => {
  cy.get('[type="button"]')
    .eq(1)
    .then(($input) => {
      if ($input.is(":disabled")) {
        cy.fixTestDataForSP();
      } else {
        cy.clickButton("Update");
      }
    });
});

When("I reduce the sum insured amount to {string}", (value) => {
  cy.get('[name="sumInsured"]')
    .eq(0)
    .click({ delay: 25 })
    .type(value, { delay: 25 });
  cy.get('[name="sumInsured"]').eq(1).click({ delay: 25 });
  cy.wait(3000);
});

When("I navigate to {string} page", (pageName) => {
  cy.get('[class="MuiTabs-flexContainer css-k008qs"]')
    .contains(pageName)
    .click();
});

When("I click Load to view the saved quote", () => {
  cy.get('[class="MuiStack-root css-n12z79"]').eq(0).contains("Load").click();
});

When("I search for the target request", () => {
  cy.fillDataByIdAndVerify(":r0:", "c1848");
});

When("I click Load to view the submitted request", () => {
  cy.get('[class="MuiTableRow-root css-ptlt9o"]')
    .last()
    .contains("Load")
    .click();
});

When("I tick the checkbox to confirm the request then click Submit", () => {
  cy.get('[type="checkbox"]').check();
  cy.get('[class="MuiDialogActions-root MuiDialogActions-spacing css-no7img"]')
    .contains("Submit")
    .click();
});

When("I click {string} from menu", (menuName) => {
  cy.get('[class="MuiListItemText-root css-1mhfk5x"]')
    .contains(menuName)
    .click({ force: true });
  cy.wait(3000);
});

When("I update the email field", () => {
  const updatedEmailAddress =
    "autotest" + timedIdentifier() + "@neoslife.com.au";
  cy.fillDataByName("details.email", updatedEmailAddress);
  Cypress.env("updatedEmailAddress", updatedEmailAddress);
});

When("I should be able to see the updated email address", () => {
  const updatedEmailAddress = Cypress.env("updatedEmailAddress");
  cy.contains(`${updatedEmailAddress}`).should("be.visible");
});

When("I input the bank account details", () => {
  cy.fillDataByName("details.accountName", "auto test");
  cy.fillDataByName("details.bsb", "123-456");
  cy.fillDataByName("details.financialInstitution", "ANZ");
  cy.fillDataByName("details.accountNumber", "123456789");
});
