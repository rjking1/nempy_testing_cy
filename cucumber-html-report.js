const report = require("multiple-cucumber-html-reporter");
report.generate({
  jsonDir: "cypress/cucumber-json", // ** Path of .json file **//
  reportPath: "./reports/cucumber-html",
  metadata: {
    browser: {
      name: "chrome",
      version: "??",
    },
    device: "Local DELL test machine",
    platform: {
      name: "Windows",
      version: "10",
    },
  },
});