var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("TEST_BDORTHO : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_BDORTHO/5/1038/729.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("TEST_BDORTHO : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_BDORTHO/12/1354/1881.jpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_PENTE : wrong (TMS disabled)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0/TEST_PENTE/16/23940/33030.png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
