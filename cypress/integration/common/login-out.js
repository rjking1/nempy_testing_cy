import { Given, Then } from "cypress-cucumber-preprocessor/steps";

And("I login to {string} on pybase", (dbName) => {
  cy.visit(Cypress.env("NEMPY_URL"));
  cy.get("#db")
    .focus()
    .clear()
    .type(dbName + ":py");
  cy.get("#user").focus().clear().type(Cypress.env("DEV_NAME"));
  cy.get("#password").focus().clear().type(Cypress.env("DEV_PASSWORD"));
  cy.get("#login").click();
  // eslint-disable-next-line cypress/no-unnecessary-waiting
  cy.wait(1000);
});

Then("I logout", () => {
  cy.visit(Cypress.env("NEMPY_URL"));
});
