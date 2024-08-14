const fs = require("fs");
const path = require("path");
const pdf = require("pdf-parse");
const qpdf = require("node-qpdf");

function decryptPdf({ pathToEncryptedPdf, password, pathToDecryptedPdf }) {
  const doc = qpdf.decrypt(pathToEncryptedPdf, password);
  doc.pipe(fs.createWriteStream(pathToDecryptedPdf));
  return null;
}

function readPdf(pathToPdf) {
  return new Promise((resolve) => {
    const resolvedPath = path.resolve(pathToPdf);
    let dataBuffer = fs.readFileSync(resolvedPath);
    pdf(dataBuffer).then(function ({ text }) {
      resolve(text);
    });
  });
}

module.exports = {
  decryptPdf,
  readPdf,
};