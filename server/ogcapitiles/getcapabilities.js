var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

xit("Collections (application/json)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/?f=application%2Fjson")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

xit("Collections (text/html)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/?f=text%2Ftext")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

xit("Collection Raster", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/SCAN1000/map/tiles?f=application%2Fjson")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

xit("Collection Vector", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/SCAN1000/tiles?f=application%2Fjson")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});