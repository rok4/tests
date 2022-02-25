var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("BDPARCELLAIRE : misconfigured WMS server", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetFeatureInfo&BBOX=47.65147770431939733,6.83756074517234325,47.6524660975958696,6.83985461742957668&CRS=EPSG:4326&WIDTH=1606&HEIGHT=692&LAYERS=BDPARCELLAIRE&STYLES=&FORMAT=image/jpeg&QUERY_LAYERS=BDPARCELLAIRE&INFO_FORMAT=text/html&I=561&J=395&FEATURE_COUNT=10")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(500);
            done();
        });
});

it("RGEALTI : valid (text/plain)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?REQUEST=GetFeatureInfo&SERVICE=WMS&VERSION=1.3.0&LAYERS=RGEALTI&QUERY_LAYERS=RGEALTI&INFO_FORMAT=text/plain&FORMAT=image/png&FEATURE_COUNT=10&CRS=EPSG:4326&WIDTH=2&HEIGHT=2&I=0&J=1&SRS=EPSG:4326&X=0&Y=1&BBOX=43.56226187836591,1.442540582159008,43.56226749004441,1.442548000524737&STYLES=")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.match(/^-?\d+(\.\d+)?$/);
            done();
        });
});

it("MONTAGNE : valid (text/html)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetFeatureInfo&BBOX=43.56225081784558739,1.44253709690304421,43.56225642952426114,1.44254451526700334&CRS=EPSG:4326&WIDTH=2&HEIGHT=2&LAYERS=MONTAGNE&STYLES=&FORMAT=image/png&QUERY_LAYERS=MONTAGNE&INFO_FORMAT=text/html&I=0&J=1&FEATURE_COUNT=10")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            res.text.should.have.string('<html><body><b>FeatureInfo :</b><br>');
            done();
        });
});