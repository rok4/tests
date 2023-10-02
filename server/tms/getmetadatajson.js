var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("FAKE : not a layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/FAKE/metadata.json")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_BDORTHO/metadata.json")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_ALTI : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_ALTI/metadata.json")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_PENTE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_PENTE/metadata.json")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
