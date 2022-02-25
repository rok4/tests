var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Version 1.0.0 : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/1.0.0")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Version 2.0.0 : wrong", done => {
    chai
        .request(common.SERVER_URL)
        .get("/tms/2.0.0")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
