var common = require("../common");

const chai = common.chai;
const chaiHttp = common.chaiHttp;
const should = common.should;

chai.use(chaiHttp);

it("BDPARCELLAIRE : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=47.65143342658590342,6.83752218069479234,47.65242181986237568,6.839816052952025771&CRS=EPSG:4326&WIDTH=1606&HEIGHT=693&LAYERS=BDPARCELLAIRE&STYLES=&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("BDPARCELLAIRE : valid (hypso style)", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=43.56102872635474199,1.439925156934160233,43.56295508717683873,1.444395872946136139&CRS=EPSG:4326&WIDTH=1606&HEIGHT=692&LAYERS=RGEALTI&STYLES=hypso&FORMAT=image/jpeg")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});

it("MONTAGNE : wrong CRS", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=-113531097.8245597482,-73613357.30627191067,114927363.7379055321,66945578.89708346128&CRS=IGNF:LAMB93&WIDTH=1126&HEIGHT=692&LAYERS=MONTAGNE&STYLES=&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(400);
            done();
        });
});

it("MONTAGNE : valid", done => {
    chai
        .request(common.SERVER_URL)
        .get("/wms?SERVICE=WMS&VERSION=1.3.0&REQUEST=GetMap&BBOX=43.56089802603771233,1.438977447303070534,43.56306511007949922,1.44521392982573138&CRS=EPSG:4326&WIDTH=2016&HEIGHT=700&LAYERS=MONTAGNE&STYLES=&FORMAT=image/png")
        .end((err, res) => {
            if (err) done(err)
            res.should.have.status(200);
            done();
        });
});
