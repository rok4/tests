var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("TEST_BDORTHO : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/2/729/1038?f=image%2Fjpeg&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("TEST_BDORTHO : unknown TMS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/fake/11/724/1037?f=image%2Fpng&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : wrong TMS for this layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM_5cm/11/724/1037?f=image%2Fpng&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_BDORTHO : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/12/1354/1881?f=image%2Fjpeg&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_BDORTHO : valid (call by default style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/map/tiles/PM/12/1354/1881?f=image%2Fjpeg&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_BDORTHO : valid (call by collections)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/TEST_BDORTHO/styles/normal/map/tiles/PM/12/1354/1881?f=image%2Fjpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_BDORTHO : valid (call by collections / default style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/TEST_BDORTHO/map/tiles/PM/12/1354/1881?f=image%2Fjpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});


it("TEST_BDORTHO : valid (additionnal TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/4326/7/84/53?f=image%2Fjpeg&collections=TEST_BDORTHO")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});
