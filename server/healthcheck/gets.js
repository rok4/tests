var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Global", done => {
    chai
        .request(common.SERVER_URL)
        .get("/healthcheck")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Details", done => {
    chai
        .request(common.SERVER_URL)
        .get("/healthcheck/info")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Threads", done => {
    chai
        .request(common.SERVER_URL)
        .get("/healthcheck/threads")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Dependences", done => {
    chai
        .request(common.SERVER_URL)
        .get("/healthcheck/depends")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});