var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("Create RGEALTI layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/RGEALTI")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Create MONTAGNE layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/MONTAGNE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Create SCAN1000 layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});

it("Create BDPARCELLAIRE layer", done => {
    chai
        .request(common.SERVER_URL)
        .delete("/admin/layers/BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(204);
            done();
        });
});