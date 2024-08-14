import "cypress-mailosaur";
const { timedIdentifier } = require("../support/dataUtils");
const spOpsUsername = Cypress.env("SP_OPS_USER_NAME");
const spOpsPassword = Cypress.env("SP_OPS_PASSWD");

Cypress.Commands.add("selectFromDropdownByLabel", (label, value) => {
  cy.contains("label", label).next().find(".MuiSelect-select").click();
  cy.get(`li[data-value="${value}"]`).click();
});

Cypress.Commands.add("fillDataById", (id, value) => {
  cy.get(`[id="${id}"]`).click({ delay: 25 }).type(value, { delay: 25 });
});

Cypress.Commands.add("fillDataByIdAndVerify", (id, value) => {
  cy.get(`[id="${id}"]`)
    .click({ delay: 25 })
    .type(value, { delay: 25 })
    .should("have.value", value);
});

Cypress.Commands.add("clickByTestid", (id) => {
  cy.get(`[data-testid="${id}"]`).click();
});

Cypress.Commands.add("typeByTestid", (id, value) => {
  cy.get(`[data-testid="${id}"]`).type(value);
});

Cypress.Commands.add("verifyByTestid", (id, value) => {
  cy.get(`[data-testid="${id}"]`).contains(`${value}`).should("be.visible");
});

Cypress.Commands.add("fillDataByName", (name, value) => {
  cy.get(`[name="${name}"]`)
    .click({ delay: 25 })
    .clear()
    .type(value, { delay: 25 });
});

Cypress.Commands.add("clickButton", (value) => {
  cy.get('[type="button"]').contains(value).click({ force: true });
  cy.wait(3000);
});

Cypress.Commands.add("selectButton", (position, value) => {
  cy.wait(3000);
  cy.get('[type="button"]').eq(position).contains(value).click({ force: true });
});

Cypress.Commands.add("tickCheckbox", (position, value) => {
  cy.wait(3000);
  cy.get('div[class="MuiBox-root css-0"]').eq(position).contains(value).click();
});

Cypress.Commands.add(
  "retrieveLinkFromEmail",
  (emailAddress, emailSubject, emailLinkName) => {
    cy.wait(5000);
    const serverId = Cypress.env("MAILOSAUR_SERVER_ID");
    const testStart = new Date(Date.now() - 1000 * 60);
    cy.mailosaurGetMessage(
      serverId,
      {
        sentTo: emailAddress,
        subject: emailSubject,
      },
      {
        receivedAfter: testStart,
      }
    ).then((email) => {
      const verifyEmail = (indexCode, indexLink) => {
        expect(email.html.codes[indexCode].value).to.match(/[A-Za-z0-9]+/);
        expect(email.html.links[indexLink].text).to.contain(emailLinkName);

        const firstLink = email.html.links[indexLink].href;
        Cypress.env("firstLink", firstLink);
        const policyNumber = email.html.codes[indexCode].value;
        Cypress.env("policyNumber", policyNumber);
      };

      if (
        emailAddress ==
          `medibankincomeretrieve${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Retrieve my quote"
      ) {
        verifyEmail(3, 2);
      }

      if (
        emailAddress ==
          `medibankincomeretrieve${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Application summary"
      ) {
        verifyEmail(3, 3);
      }

      if (
        emailAddress ==
          `mediincomedeclined${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Application decision"
      ) {
        verifyEmail(3, 3);
      }

      if (
        emailAddress ==
          `ahmincomemultiple${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Retrieve my quote"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `medilifeinsuredperson${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Policy schedule"
      ) {
        verifyEmail(3, 3);
      }

      if (
        emailAddress ==
          `ahminsuredperson${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Retrieve my quote"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `ahmlifepolicyowner${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Policy schedule"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `ahmlifedeclined${Cypress.env("uniSuffix")}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Application decision"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `basicpasmodify${Cypress.env("uniSuffix")}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Policy schedule"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `basicpasreassign${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Product Disclosure Statement"
      ) {
        verifyEmail(3, 6);
      }

      if (
        emailAddress ==
          `basicpasdecision${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Product Disclosure Statement"
      ) {
        verifyEmail(0, 0);
      }

      if (
        emailAddress ==
          `basicpasmultiple${Cypress.env(
            "uniSuffix"
          )}@szxu2q77.mailosaur.net` &&
        emailLinkName == "Policy schedule"
      ) {
        verifyEmail(3, 2);
      }
    });
  }
);

Cypress.Commands.add("clickLinkFromEmail", () => {
  cy.visit(Cypress.env("firstLink"));
});

Cypress.Commands.add("clickPolicyNumber", () => {
  const policyNumber = Cypress.env("policyNumber");
  cy.contains(policyNumber).click();
});

Cypress.Commands.add("downloadFileFromEmail", (pathToFile) => {
  cy.request({
    url: Cypress.env("firstLink"),
    encoding: "binary",
  }).then((response) => {
    cy.writeFile(pathToFile, response.body, "binary");
  });
});

Cypress.Commands.add("retrieveCodeFromSms", () => {
  cy.wait(5000);
  const serverId = Cypress.env("MAILOSAUR_SERVER_ID");
  const testStart = new Date(Date.now() - 100 * 60);
  cy.mailosaurGetMessage(
    serverId,
    {
      sentTo: "61480094127",
    },
    {
      receivedAfter: testStart,
    }
  ).then((message) => {
    const smsCode = message.text.codes[0].value;
    Cypress.env("smsCode", smsCode);
  });
});

Cypress.Commands.add("enterSmsCode", (identifier) => {
  const smsCode = Cypress.env("smsCode");
  cy.get(identifier).click().type(smsCode);
});

Cypress.Commands.add("makePaymentViaWebhook", () => {
  const webhookUrl = Cypress.env("webhookUrl");
  const policyNumber = Cypress.env("policyNumber");
  const merchReference = policyNumber + " d524c751-83c5-4116-91d1-e0b639f31846";
  const txnReference = timedIdentifier() + "410a0e47g";
  cy.request({
    url: webhookUrl + "receive?brand=Medibank&type=PFR",
    method: "POST",
    body: {
      cardSchema: "VISA",
      metadata: {
        policyNumber: policyNumber,
      },
      amount: 14430,
      maskedPAN: "411111XXXXXX1111",
      cardHolderName: "change",
      hierarchy: "NEOS|Medibank",
      cardCategory: "CREDIT",
      txnType: 1,
      settlementDate: "2024-01-29T08: 00: 00Z",
      transactionDate: "2024-01-29T04: 41: 09Z",
      userName: "ttecdigital.elizabeth.medibank.demo",
      cardExpiryDate: "11/28",
      cardToken: "4111117LN67t1111",
      responseCode: "00",
      txnReference: txnReference,
      pspSelected: "IPSI_MOCK",
      customerId: "NEOS",
      notificationId: "2434a1f8-97f3-4bd2-b4a1-f897f3cbd2fa",
      additionalData: {},
      merchReference: merchReference,
    },
  }).then((res) => {
    expect(res.status).to.eq(201);
  });
  cy.wait(36000);
});

Cypress.Commands.add("fixTestDataForSP", () => {
  cy.get('[class="MuiListItemText-root css-1mhfk5x"]')
    .last()
    .contains("Logout")
    .click();
  cy.clearCookies();
  cy.visit(Cypress.env("servicePortalBaseUrl"), { timeout: 50000 });
  cy.fillDataById("username", spOpsUsername);
  cy.fillDataById("password", spOpsPassword);
  cy.get('[name="action"]').contains("Continue").click();
  cy.get('[class="MuiListItemText-root css-1mhfk5x"]')
    .contains("Submitted requests")
    .click();
  cy.fillDataByIdAndVerify(":r0:", "c1848");
  cy.get('[class="MuiTableRow-root css-ptlt9o"]')
    .last()
    .contains("Load")
    .click();
  cy.clickButton("Cancel");
});