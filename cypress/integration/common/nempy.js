import { And, Then } from "cypress-cucumber-preprocessor/steps";

Then("I filter on {string}", (str) => {
  cy.get("#searchBox").focus().clear().type(str);
});

Then("I open the event", () => {
  cy.get(".editrow:visible").click(); // ✎
  // eslint-disable-next-line cypress/no-unnecessary-waiting
  cy.wait(500);
});

And("wait {int} ms", (ms) => {
  // eslint-disable-next-line cypress/no-unnecessary-waiting
  cy.wait(ms);
});

