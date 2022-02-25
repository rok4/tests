var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("SCAN1000 : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/SCAN1000/11/1038/729.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("SCAN1000 : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/SCAN1000/8/129/90.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/BDPARCELLAIRE/18/272102/61673.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/MONTAGNE/16/33030/23940.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
