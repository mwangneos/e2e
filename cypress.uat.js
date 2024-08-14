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
    specPattern: [
      "cypress/features/incomeProtection.feature",
      "cypress/features/lifeInsurance.feature",
      "cypress/features/basicPas.feature",
    ],
    supportFile: "cypress/support/commands.js",
  },
  env: {
    environment: "uat",
    medibankBaseUrl: "https://uat.medibanklife.com.au/",
    ahmBaseUrl: "https://uat.ahmlife.com.au",
    webhookUrl:
      "https://api.uat.medibanklife.com.au/ipsi-webhook/notification/",
    MAILOSAUR_SERVER_ID: process.env.MAILOSAUR_SERVER_ID,
    MAILOSAUR_API_KEY: process.env.MAILOSAUR_API_KEY,
    PAS_USER_NAME: process.env.PAS_USER_NAME,
    PAS_PASSWD: process.env.PAS_PASSWD,
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
  projectId: "ej2onj",
});
