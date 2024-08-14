import { When, Then } from "@badeball/cypress-cucumber-preprocessor";
const { calculatedAge, calculatedDate } = require("../support/dataUtils");

Then(
  "{string} should receive {string} email with {string} link",
  (firstName, subject, linkName) => {
    const env = Cypress.env("environment");
    const uniFirstName = firstName + Cypress.env("uniSuffix");
    const emailSubject =
      env === "prd"
        ? `${uniFirstName}${subject}`
        : `Sandbox: ${uniFirstName}${subject}`;
    cy.retrieveLinkFromEmail(
      `${uniFirstName}@szxu2q77.mailosaur.net`,
      emailSubject,
      linkName
    );
  }
);

When(
  "I click the link and input my date of birth as age of {string} then click 'Validate' to continue my quote",
  (age) => {
    cy.clickLinkFromEmail();
    cy.get('[placeholder="dd/mm/yyyy"]').type(calculatedAge(age));
    cy.clickButton("Validate");
  }
);

When(
  "I click the link and enter code from sms message then click 'Validate'",
  () => {
    cy.clickLinkFromEmail();
    cy.clickButton("Get Code");
    cy.retrieveCodeFromSms();
    cy.enterSmsCode('[id="mui-1"]');
    // change to data-testid when Harley's change is deployed
    cy.clickButton("Validate");
  }
);

When("I click the link to download {string} file", (fileName) => {
  cy.downloadFileFromEmail(`cypress/downloads/${fileName}.pdf`);
});

When("I click the {string} link in the email", () => {
  cy.clickLinkFromEmail();
});

When(
  "I use my date of birth as age of {string} to open {string} file",
  (age, fileName) => {
    cy.wait(5000);
    cy.task("decryptPdf", {
      pathToEncryptedPdf: `cypress/downloads/${fileName}.pdf`,
      password: calculatedAge(age),
      pathToDecryptedPdf: `cypress/downloads/decrypted${fileName}.pdf`,
    });
  }
);

Then(
  "I should be able to see {string} in the {string} file",
  (value, fileName) => {
    cy.wait(5000);
    cy.task("readPdf", `cypress/downloads/decrypted${fileName}.pdf`).should(
      "contain",
      value
    );
  }
);

Then(
  "I should be able to see a future date with {string} years from current date in the {string} file",
  (year, fileName) => {
    cy.wait(5000);
    cy.task("readPdf", `cypress/downloads/decrypted${fileName}.pdf`).should(
      "contain",
      calculatedDate(year)
    );
  }
);
