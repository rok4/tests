var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);


xit("TEST_PENTE : valid (text/plain)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/ogcapitiles/styles/normal/map/tiles/PM/10/363/517/info?f=text/plain&collections=TEST_PENTE")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.match(/^-?\d+(\.\d+)?$/);
            done();
        });
});