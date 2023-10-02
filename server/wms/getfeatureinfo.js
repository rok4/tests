var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("TEST_BDORTHO : misconfigured WMS server", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetFeatureInfo&BBOX=47.65147770431939733,6.83756074517234325,47.6524660975958696,6.83985461742957668&CRS=EPSG:4326&WIDTH=1606&HEIGHT=692&LAYERS=TEST_BDORTHO&STYLES=&FORMAT=image/jpeg&QUERY_LAYERS=TEST_BDORTHO&INFO_FORMAT=text/html&I=561&J=395&FEATURE_COUNT=10")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(500);
            done();
        });
});

it("TEST_ALTI : valid (text/plain)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetFeatureInfo&BBOX=-6850073.55233319289982319,1594879.65237928181886673,-6710073.98623065836727619,1741451.25051501393318176&CRS=EPSG:3857&WIDTH=916&HEIGHT=959&LAYERS=TEST_ALTI&STYLES=&FORMAT=image/jpeg&QUERY_LAYERS=TEST_ALTI&INFO_FORMAT=text/plain&I=328&J=533&FEATURE_COUNT=10")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.match(/^-?\d+(\.\d+)?$/);
            done();
        });
});

it("TEST_PENTE : valid (text/html)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetFeatureInfo&BBOX=-6850073.55233319289982319,1594879.65237928181886673,-6710073.98623065836727619,1741451.25051501393318176&CRS=EPSG:3857&WIDTH=916&HEIGHT=959&LAYERS=TEST_PENTE&STYLES=&FORMAT=image/jpeg&QUERY_LAYERS=TEST_PENTE&INFO_FORMAT=text/html&I=328&J=533&FEATURE_COUNT=10")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.have.string('<html><body><b>FeatureInfo :</b><br>');
            done();
        });
});