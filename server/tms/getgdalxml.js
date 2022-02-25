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

it("SCAN1000 : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/SCAN1000/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("RGEALTI : wrong (TMS is not a quad tree)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/RGEALTI/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("BDPARCELLAIRE : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/BDPARCELLAIRE/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/MONTAGNE/gdal.xml")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
