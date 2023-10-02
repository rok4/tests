const chai = require("chai");
const chaiHttp = require("chai-http");
const should = chai.should();

if (process.env.SERVER_URL) {
    exports.SERVER_URL = process.env.SERVER_URL;
} else {
    exports.SERVER_URL = "http://front";
}

exports.chai = chai;
exports.chaiHttp = chaiHttp;
exports.should = should;