var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Version 1.3.0", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetCapabilities")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("Version 1.1.1", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.1.1&REQUEST=GetCapabilities")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});
