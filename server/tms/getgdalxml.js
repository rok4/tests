var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("FAKE : not a layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/FAKE/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_BDORTHO/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_ALTI : wrong (TMS is not a quad tree)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_ALTI/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_PENTE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_PENTE/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
