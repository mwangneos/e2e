const sub = require("date-fns/sub");
const format = require("date-fns/format");
const addYears = require("date-fns/addYears");

function reportDate() {
  return format(new Date(), "HH:mm:ss-ddMMyyyy");
}

function calculatedAge(age) {
  const result = sub(new Date(), {
    years: age - 1,
  });
  return format(new Date(result), "ddMMyyyy");
}

function calculatedDate(year) {
  const result = addYears(new Date(), year);
  return format(new Date(result), "dd-MM-yyyy");
}

function timedIdentifier() {
  return format(new Date(), "HHmmss");
}

module.exports = {
  reportDate,
  calculatedAge,
  calculatedDate,
  timedIdentifier,
};
