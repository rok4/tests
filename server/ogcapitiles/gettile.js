var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("SCAN1000 : no data", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/11/729/1038?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(404);
            done();
        });
});

it("SCAN1000 : unknown TMS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/fake/11/724/1037?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : wrong TMS for this layer", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM_5cm/11/724/1037?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/8/90/129?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("SCAN1000 : valid (call by default style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/map/tiles/PM/8/90/129?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("SCAN1000 : valid (call by collections)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/SCAN1000/styles/normal/map/tiles/PM/8/90/129?f=image%2Fpng")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("SCAN1000 : valid (call by collections / default style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/collections/SCAN1000/map/tiles/PM/8/90/129?f=image%2Fpng")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/4326/18/61673/272102?f=image%2Fpng&collections=BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (native TMS + style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/orange/map/tiles/4326/18/61673/272102?f=image%2Fpng&collections=BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : unknown style", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/fake/map/tiles/4326/18/61673/272102?f=image%2Fpng&collections=BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("BDPARCELLAIRE : wrong style", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/estompage/map/tiles/4326/18/61673/272102?f=image%2Fpng&collections=BDPARCELLAIRE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("SCAN1000 : valid (additionnal TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/4326/10/248/1034?f=image%2Fpng&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : valid (native TMS)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/16/23940/33030?f=image%2Fpng&collections=MONTAGNE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});


