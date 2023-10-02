var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("TEST_BDORTHO : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=14.32607995411024682,-61.33514779706757025,14.96302626285481452,-60.70632904706744171&CRS=EPSG:4326&WIDTH=843&HEIGHT=854&LAYERS=TEST_BDORTHO&STYLES=&FORMAT=image/jpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_ALTI : valid (hypso style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=14.32607995411024682,-61.33514779706757025,14.96302626285481452,-60.70632904706744171&CRS=EPSG:4326&WIDTH=843&HEIGHT=854&LAYERS=TEST_ALTI&STYLES=hypso&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("TEST_PENTE : wrong CRS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=-113531097.8245597482,-73613357.30627191067,114927363.7379055321,66945578.89708346128&CRS=IGNF:LAMB93&WIDTH=1126&HEIGHT=692&LAYERS=TEST_PENTE&STYLES=&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("TEST_PENTE : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=14.32607995411024682,-61.33514779706757025,14.96302626285481452,-60.70632904706744171&CRS=EPSG:4326&WIDTH=843&HEIGHT=854&LAYERS=TEST_PENTE&STYLES=&FORMAT=image/jpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});
