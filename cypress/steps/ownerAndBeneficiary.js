import { When } from "@badeball/cypress-cucumber-preprocessor";

beforeEach(function () {
  cy.fixture("inputData").then(function (data) {
    this.data = data;
  });
});

When("I confirm policy owner and my origin then click 'Continue'", () => {
  cy.selectFromDropdownByLabel(
    "Are you of Aboriginal or Torres Strait Islander origin?",
    "Prefer not to say"
  );
  cy.clickButton("Continue");
});

When(
  "I nominate policy owner by filling in owner details then click 'Continue'",
  function (dataTable) {
    cy.clickButton("No");
    cy.selectFromDropdownByLabel(
      "Are you of Aboriginal or Torres Strait Islander origin?",
      "Prefer not to say"
    );
    dataTable.hashes().forEach((element) => {
      const uniFirstName = element.firstName + Cypress.env("uniSuffix");
      cy.fillDataByIdAndVerify("firstName", uniFirstName);
      cy.fillDataByIdAndVerify("lastName", element.lastName);
      cy.fillDataById("contactNumber", element.contactNumber);
      cy.fillDataByIdAndVerify(
        "email",
        element.email === "useInputData"
          ? this.data.ownerEmail
          : `${uniFirstName}@szxu2q77.mailosaur.net`
      );
    });
    cy.get("#relationshipToInsuredPerson").click();
    cy.contains("Spouse").click();
    cy.clickButton("Continue");
  }
);

When(
  "I nominate {string} beneficiaries by filling in beneficiary details then click 'Continue'",
  (beneficiaryIndex, dataTable) => {
    cy.contains("Beneficiaries").should("be.visible");
    cy.get('[name="isBeneficiariesNominated"]').first().click({ force: true });
    cy.wait(2000);
    cy.contains("Beneficiary 1").should("be.visible");
    for (let i = 1; i < beneficiaryIndex; i++) {
      cy.contains("Add another beneficiary").click();
    }
    dataTable.hashes().forEach((element, index) => {
      cy.fillDataById(
        `beneficiariesList.${index}.firstName`,
        element.firstName
      );
      cy.fillDataById(`beneficiariesList.${index}.lastName`, element.lastName);
      cy.fillDataByName(
        `beneficiariesList.${index}.dateOfBirth`,
        element.dateOfBirth
      );
      cy.clickByTestid(
        `beneficiariesList.${index}.relationshipToInsuredPerson`
      );
      cy.get(`[data-value=${element.relationship}]`).click();
      cy.fillDataById(
        `beneficiariesList.${index}.benefitProportion`,
        element.proportion
      );
      cy.fillDataById(
        `beneficiariesList.${index}.streetAddress`,
        element.streetAddress
      );
      cy.fillDataById(`beneficiariesList.${index}.suburb`, element.suburb);
      cy.fillDataById(`beneficiariesList.${index}.postcode`, element.postcode);
      cy.get(`[id="beneficiariesList.${index}.state"]`).click();
      cy.get(`[data-value=${element.state}]`).click();
    });
  }
);
