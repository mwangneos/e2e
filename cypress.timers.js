const { defineConfig } = require("cypress");
const preprocessor = require("@badeball/cypress-cucumber-preprocessor");
const browserify = require("@badeball/cypress-cucumber-preprocessor/browserify");

async function setupNodeEvents(on, config) {
  await preprocessor.addCucumberPreprocessorPlugin(on, config);
  on("file:preprocessor", browserify.default(config));
  return config;
}

module.exports = defineConfig({
  e2e: {
    setupNodeEvents,
    specPattern: "cypress/features/timersCreatePolicy.feature",
    supportFile: "cypress/support/commands.js",
  },
  env: {
    environment: "timers",
    medibankBaseUrl: "https://timers.dev.medibanklife.com.au/",
    ahmBaseUrl: "https://timers.dev.ahmlife.com.au",
  },
  watchForFileChanges: false,
  chromeWebSecurity: false,
  experimentalModifyObstructiveThirdPartyCode: true,
  viewportWidth: 1200,
  viewportHeight: 1000,
  video: false,
  requestTimeout: 15000,
  defaultCommandTimeout: 30000,
  pageLoadTimeout: 10000,
  retries: {
    runMode: 2,
    openMode: 0,
  },
});
