var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Delete TEST_ALTI layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/TEST_ALTI")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Delete TEST_PENTE layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/TEST_PENTE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Delete TEST_BDORTHO layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});