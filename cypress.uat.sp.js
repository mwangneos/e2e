require("dotenv").config();

const { defineConfig } = require("cypress");
const preprocessor = require("@badeball/cypress-cucumber-preprocessor");
const browserify = require("@badeball/cypress-cucumber-preprocessor/browserify");
const { decryptPdf, readPdf } = require("./utils");

async function setupNodeEvents(on, config) {
  await preprocessor.addCucumberPreprocessorPlugin(on, config);
  on("file:preprocessor", browserify.default(config));
  on("task", { decryptPdf });
  on("task", { readPdf });
  return config;
}

module.exports = defineConfig({
  e2e: {
    setupNodeEvents,
    specPattern: ["cypress/features/servicePortal.feature"],
    supportFile: "cypress/support/commands.js",
  },
  env: {
    environment: "uat",
    servicePortalBaseUrl: "https://uat.service.neoslife.com.au/",
    SP_ADVISER_USER_NAME: process.env.SP_ADVISER_USER_NAME,
    SP_ADVISER_PASSWD: process.env.SP_ADVISER_PASSWD,
    SP_OPS_USER_NAME: process.env.SP_OPS_USER_NAME,
    SP_OPS_PASSWD: process.env.SP_OPS_PASSWD,
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
  taskTimeout: 120000,
  retries: {
    runMode: 2,
    openMode: 0,
  },
  projectId: "6pz1ng",
});
