// Sync object
module.exports = {
  verbose: true,
  testMatch: [
    "**/test/**/*.[jt]s?(x)",
    "**/?(*.)+(spec|test).[jt]s?(x)"
  ],
  reporters: [
    "default",
    ["./node_modules/jest-html-reporter", {
      "pageTitle": "Functionality: Deposit and Withdraw at Window Aave Vault for Stablecoins."
    }]
  ]
};