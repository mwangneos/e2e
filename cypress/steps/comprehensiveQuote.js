import { When } from "@badeball/cypress-cucumber-preprocessor";

beforeEach(function () {
  cy.fixture("inputData").then(function (data) {
    this.data = data;
  });
});

When("I provide occupation and annual income", (dataTable) => {
  cy.get("#occupation").type("Chiropodist");
  cy.contains("Chiropodist").click();
  dataTable.hashes().forEach((element) => {
    cy.fillDataById("annualIncome", element.annualIncome);
  });
});

When(
  "I verify my mobile number with valid code then click 'Continue'",
  function (dataTable) {
    dataTable.hashes().forEach((element) => {
      cy.typeByTestid(
        "contact-number",
        element.mobile === "useInputData" ? this.data.mobile : element.mobile
      );
      cy.clickButton("Get Code");
      cy.typeByTestid("verification-code", "123456");
      cy.contains("Verify").click();
    });
    cy.clickButton("Continue");
  }
);

When(
  "I enter real phone number and code from sms message then click 'Continue'",
  () => {
    cy.typeByTestid("contact-number", "0480094127");
    cy.clickButton("Get Code");
    cy.retrieveCodeFromSms();
    cy.enterSmsCode('[data-testid="verification-code"]');
    cy.contains("Verify").click();
    cy.clickButton("Continue");
  }
);

When(
  "I fill in my mobile number and address on the customer details screen",
  (dataTable) => {
    cy.fillDataById("contactNumber", "0480094127");
    dataTable.hashes().forEach((element) => {
      cy.fillDataById("streetAddress", element.streetAddress);
      cy.fillDataById("suburb", element.suburb);
      cy.fillDataById("postcode", element.postcode);
    });
  }
);

When("I fill in my member number then wait for validation", () => {
  const env = Cypress.env("environment");
  if (env == "dev") {
    cy.fillDataByIdAndVerify("memberNumber", "40042062A");
  }
  if (env == "uat") {
    cy.fillDataByIdAndVerify("memberNumber", "41128474");
  }
  cy.get('[data-testid="CheckIcon"]').should("be.visible");
});

When("I fill in {string} children details", (childIndex, dataTable) => {
  dataTable.hashes().forEach((row, index) => {
    cy.fillDataById(`childDetails.${index}.childFirstName`, row.firstName);
    cy.fillDataById(`childDetails.${index}.childLastName`, row.lastName);
    cy.fillDataByName(
      `childDetails.${index}.childDateOfBirth`,
      row.dateOfBirth
    );
  });
});

When("I toggle {string} cover", () => {
  cy.get('[type="checkbox"]').last().click();
  // change to a proper test identifier after Harley's PR
});
