var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);


it("TEST_PENTE : valid (text/plain)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetFeatureInfo&VERSION=1.0.0&LAYER=TEST_PENTE&STYLE=normal&FORMAT=image/png&TILEMATRIXSET=PM&TILEMATRIX=12&TILEROW=1881&TILECOL=1354&INFOFORMAT=text/plain&I=52&J=149")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.match(/^-?\d+(\.\d+)?$/);
            done();
        });
});