var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Version 1.0.0", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&VERSION=1.0.0&REQUEST=GetCapabilities")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Version 2.0.0", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&VERSION=2.0.0&REQUEST=GetCapabilities")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
