var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("FAKE : not a layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/FAKE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("RGEALTI : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/RGEALTI")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/MONTAGNE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
