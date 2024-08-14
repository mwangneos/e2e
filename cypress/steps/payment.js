import { When } from "@badeball/cypress-cucumber-preprocessor";

When("I fill in bank account details", (dataTable) => {
  dataTable.hashes().forEach((element) => {
    cy.fillDataByName("accountName", element.accountName);
    cy.fillDataByName("bsb", element.bsb);
    cy.fillDataByName("bankName", element.bankName);
    cy.fillDataByName("accountNumber", element.accountNumber);
  });
  cy.clickButton("Continue");
});
