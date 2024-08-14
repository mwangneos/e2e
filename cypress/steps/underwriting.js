import { When } from "@badeball/cypress-cucumber-preprocessor";

When("I fill in my height and weight", (dataTable) => {
  dataTable.hashes().forEach((element) => {
    cy.fillDataById("HEIGHT", element.height);
    cy.fillDataById("WEIGHT_FEMALE", element.weight);
  });
});

When(
  "I go through eligibility criteria questions with answer {string} to existing {string} cover question",
  (answer, type) => {
    cy.clickByTestid("Residency/Residence_Medi_Q-Agree");
    if (answer == "No" && type == "Life") {
      cy.clickByTestid("EXISTING_COVER_LIFE-No");
    }
    if (answer == "No" && type == "Income") {
      cy.clickByTestid("EXISTING_COVER_IP-No");
    }
    if (answer == "No" && type == "Life and Income") {
      cy.clickByTestid("EXISTING_COVER_IP-No");
      cy.clickByTestid("EXISTING_COVER_LIFE-No");
    }
    if (answer == "No" && type == "Life and Income plus all attached") {
      cy.clickByTestid("EXISTING_COVER_IP-No");
      cy.clickByTestid("EXISTING_COVER_TPD-No");
      cy.clickByTestid("EXISTING_COVER_CI-No");
      cy.clickByTestid("EXISTING_COVER_LIFE-No");
    }
    if (answer == "Yes" && type == "Income") {
      cy.clickByTestid("EXISTING_COVER_IP-Yes");
      cy.clickByTestid("Is_IP_Being_Replaced-No");
      cy.clickByTestid("Unsure-4");
      cy.clickByTestid("Unsure-6");
      cy.clickByTestid("Other_IPAmt_Known-Yes");
      cy.fillDataById("Financial_IP_Total", "50000");
    }
    if (answer == "Yes" && type == "Life") {
      cy.clickByTestid("EXISTING_COVER_LIFE-Yes");
      cy.clickByTestid("Is_LIFE_Being_Replaced-No");
      cy.fillDataById("Income_LumpSum_TotalLife", "30000000");
      cy.tickCheckbox(-2, "None of the above");
    }
    cy.clickByTestid("Eligibility_criteria/Concurrent_Application-No");
  }
);

When("I fill in {string} working hours per week", (value) => {
  cy.fillDataById("HOURS_WORKED", value);
});

When("I go through medical eligibility then click 'Continue'", () => {
  cy.tickCheckbox(0, "None of the above");
  cy.tickCheckbox(-2, "None of the above");
  cy.tickCheckbox(-2, "None of the above");
  cy.tickCheckbox(-2, "None of the above");
  cy.clickByTestid("Prev_Ins_Declined-No");
  cy.clickButton("Continue");
});

When(
  "I tick medical condition {string} then click 'Continue'",
  (medicalCondition) => {
    cy.tickCheckbox(0, medicalCondition);
    cy.fillDataById("Serious_Med1_Neuro", "stroke");
    cy.clickButton("Continue");
  }
);

When("I provide medical history in last 5 years then click 'Continue'", () => {
  cy.tickCheckbox(0, "None of the above");
  cy.clickButton("Continue");
  cy.tickCheckbox(0, "None of the above");
  cy.clickByTestid("Current_Pregnancy-No");
  cy.clickButton("Continue");
});

When(
  "I provide other general medical information then click 'Continue'",
  () => {
    cy.clickByTestid("Weight_Loss/Weight_Loss_Initial-No");
    cy.tickCheckbox(1, "None of the above");
    cy.clickByTestid("Genetics_Medi-No");
    cy.tickCheckbox(-3, "None of the above");
    cy.selectButton(-3, "No");
    cy.clickButton("Continue");
  }
);

When(
  "I provide other general medical information without genetic test then click 'Continue'",
  () => {
    cy.clickByTestid("Weight_Loss/Weight_Loss_Initial-No");
    cy.tickCheckbox(1, "None of the above");
    cy.tickCheckbox(-3, "None of the above");
    cy.selectButton(-3, "No");
    cy.clickButton("Continue");
  }
);
