[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg)](http://standardjs.com)

# Automated end-to-end test in BDD style using Cucumber 🥒 and Cypress 🌳

## 📋 Table of contents

- 💌 What is BDD?
- 🥒 What is Cucumber?
- 🌳 What is Cypress?
- 🏗️ Project structure
- 🛼 How to run tests
- ✏️ How to write tests

## 💌 What is BDD?

Behavioural Driven Development (BDD) is an Agile Software Development process that has evolved from TDD (Test Driven Development). It differs by being written in a shared language, which improves communication between the tech and non-tech teams and stakeholders and also encourages the collaboration between different roles within the same team. In both development approaches, though, tests are written ahead of the code. But in BDD, the only difference is that tests are more end user-focused. That includes user journeys based on the system's behavior and uses the English level syntax to documenting the test cases.

## 🥒 What is Cucumber?

Cucumber is one of Gherkin based tool which supports and helps in Behavior Driven Development (BDD). This tool offers the capability to write our tests in a syntax similar to English.

## 🌳 What is Cypress?

Cypress is a JavaScript-based end-to-end (E2E) testing tool built for the modern web. It aims to address the pain points developers or QA engineers face while testing an application. Cypress is a more developer-friendly tool that uses a unique DOM manipulation technique and operates directly in the browser.

## 🏗️ Project structure

```
.

├── cypress
│     ├── features
│     │    ├── foo1.feature
│     │    ├── foo2.feature
│     ├── fixtures
│     │    ├── data1.json
│     │    ├── data2.json
│     ├── reports
|     |    ├── cucumber-report.json
|     |    ├── test-report-yyyy-mm-ddThh:mm:ss.html
│     ├── steps
│     │    ├── foo1.spec.js
│     │    ├── foo2.spec.js
│     |    ├── index.js
│     └── support
│          ├── commands.js
│          └── helper.js
├── cypress.js
├── package.json
├── README.md

.

```

## 🛼 How to run tests

#### Install homebrew following the steps in this link:

```
https://brew.sh
```
#### Install qpdf by running:

```
brew install qpdf
```

#### Install Cypress and Cucumber by running:

```
npm install
```

#### Open Cypress console and run individual test. e.g.

```
npx cypress open
```
#### Run tests via browser (Chrome), e.g.

```
npm run uat:chrome
```

#### Generate test report in HTML format after test run:

```
npm run report
```


## ✏️ How to write tests

1. Create `foo.feature` file to describe test scenario.
2. Add `foo.js` file to write test steps as a function.
3. Organise test actions in commands file under `support` folder.

## 🍡 How to tag test for cypress open

```
Add tag @focus against the scenario in the feature file, cypress open will only run against that scenario in the feature file

```

## 💅 How to setup formatting into Visual Studio

1. Install Prettier, feature-file(includes indent-rainbow) and Feature Syntax Highlight and Snippets extension
2. Open Command Pallete(Ctrl+Shift+P), type "settings' and click on 'Preferences: Open Settings UI'
3. Into search settings, type 'form', and update 'Editor: Default Formatter' to 'Prettier - Code formatter'
4. Tick the box against 'Editor: Format On Save'

### 💕 Build with 💖 by NEOS technology team, enjoy testing 💕
