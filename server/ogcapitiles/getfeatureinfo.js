var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);


xit("SCAN1000 : valid (text/html)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/10/363/517/info?f=text/html&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.have.string('<html><body><b>FeatureInfo :</b><br>');
            done();
        });
});

xit("SCAN1000 : valid (application/json)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/10/363/517/info?f=application/json&collections=SCAN1000")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.have.string('{}');
            done();
        });
});