import { When } from "@badeball/cypress-cucumber-preprocessor";

When("I agree on the policy declaration and click 'Continue'", () => {
  cy.get(
    'div[class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-15j76c0"]'
  )
    .eq(0)
    .contains("Yes")
    .click();
  cy.get(
    'div[class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-15j76c0"]'
  )
    .eq(-1)
    .contains("Yes")
    .click();
  cy.clickButton("Continue");
});
