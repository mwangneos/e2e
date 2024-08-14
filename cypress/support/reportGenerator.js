var reporter = require("cucumber-html-reporter");
const { reportDate } = require("../support/dataUtils");

var options = {
  theme: "bootstrap",
  jsonFile: "cypress/reports/cucumber-report.json",
  output: `cypress/reports/test-report-${reportDate()}.html`,
  reportSuiteAsScenarios: true,
  scenarioTimestamp: true,
  launchReport: true,
  columnLayout: 1,
  metadata: {
    "Test Environment": "UAT",
    "Cypress Version": "12.17.1",
    Browser: "Chrome 114 (headed) | Electron 106 (headless)",
    Parallel: "Scenarios",
    Executed: "Remote",
  },
};

reporter.generate(options);
