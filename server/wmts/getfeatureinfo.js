var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);


it("MONTAGNE : valid (text/plain)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetFeatureInfo&VERSION=1.0.0&LAYER=MONTAGNE&STYLE=normal&INFOFORMAT=text/plain&TILEMATRIXSET=PM&TILEMATRIX=17&TILEROW=47881&TILECOL=66061&I=69&J=68&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.match(/^-?\d+(\.\d+)?$/);
            done();
        });
});

it("SCAN1000 : valid (text/html)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wmts?SERVICE=WMTS&REQUEST=GetFeatureInfo&VERSION=1.0.0&LAYER=SCAN1000&STYLE=normal&INFOFORMAT=text/html&TILEMATRIXSET=PM&TILEMATRIX=10&TILEROW=363&TILECOL=517&I=52&J=149&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.have.string('<html><body><b>FeatureInfo :</b><br>');
            done();
        });
});